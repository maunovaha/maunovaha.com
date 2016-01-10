"use strict";

// Site namespace
var maunovaha = {

  // Contains all pages (home, blog, etc.)
  pages: {},

  // Initializes controller/action specific things e.g. home -> index
  init: function(controller, actions) {
    var $body       = $("body"),
        action      = $body.data("action"),
        _controller = $body.data("controller");
          
    if (controller === _controller && actions.hasOwnProperty(action)) {

      // Initializes subscription, but only when footer exists
      if (this.footerExists()) { this.subscription.init(); }

      actions[action]();
    }
  },

  // Checks for existance of page footer
  footerExists: function() { 
    return $("footer").length > 0; 
  }
};

// Subscription
maunovaha.subscription = {

  // DOM elements
  elements: {},

  // Initializes and binds actions
  init: function() {

    // Reference to self
    var that = this;

    // Capturing the elements
    this.elements.$subForm      = $("#new_subscriber");
    this.elements.$subEmail     = $("#subscriber_email");
    this.elements.$subBtnSend   = $("#subscriber_send");
    this.elements.$subNotify    = $(".notification");
    this.elements.$subNotifyMsg = $(".notification p");
    
    // Binds form focus highlight
    this.elements.$subForm.on("focusin", function() {
      $(this).addClass("focus");
    });

    this.elements.$subForm.on("focusout", function() {
      $(this).removeClass("focus");
    });

    // Binds form submit events
    this.elements.$subForm.on("ajax:success", function(e, data, status, xhr) {
      that.onSuccess(that, e, data, status, xhr);
    });

    this.elements.$subForm.on("ajax:error", function(e, xhr, status, error) {
      that.onFailure(that, e, xhr, status, error);
    });
  },

  // Called when form submit succeeds
  onSuccess: function(that, e, data, status, xhr) {
    if (xhr.status === 201) {
      window.location.href = "/subscribers/success";
    } else {
      that.showError(xhr.status);
    }
  },

  // Called when form submit fails
  onFailure: function(that, e, xhr, status, error) {
    that.showError(xhr.status);
  },

  // Shows error for the user below input field
  showError: function(status) {
    var msg = "Unexpected error occured, try again later";

    switch (status) {
      case 200:
        msg = "Oops, given email address has already subscribed!";
        break;
      case 422:
        msg = "Oops, your email address is invalid";
        break;
    }

    this.elements.$subNotifyMsg.text(msg);
    this.elements.$subNotify.addClass("error");
  },

  reset: function() {
    // Clear all
  },
};