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

    // Capturing the elements
    this.elements.$subForm    = $("#new_subscriber");
    this.elements.$subEmail   = $("#subscriber_email");
    this.elements.$subBtnSend = $("#subscriber_send");
    this.elements.$subMessage = "Yo, daaawg!"; // notification area...
    
    // Binds form focus highlight
    this.elements.$subForm.on("focusin", function() {
      $(this).addClass("focus");
    });

    this.elements.$subForm.on("focusout", function() {
      $(this).removeClass("focus");
    });


    // Binds scrollable clicks to elements with "scroll-to" class
    /*
    $(".scroll-to").on("click", function(e) {
      scrollTo(e, $("#" + $(this).data("scroll-to")));
    });

    // Scrolls to given section of the page
    var scrollTo = function(e, section) {
      e.preventDefault();
      $("body, html").animate({ scrollTop: section.offset().top }, 900, "easeInOutQuart", function() {});
    };
    */

  },

  reset: function() {
    // Clear all
  },

  send: function() {
    // Send query
  }
};