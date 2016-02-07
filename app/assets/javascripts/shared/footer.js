"use strict";

maunovaha.shared.footer = (function(mv) {

  // Contains program logic for sidebar
  var main = {

    // DOM elements of footer
    $elements: {},

    // Timer handles for loading bar animation
    timers: {},

    // Initializes the sidebar
    init: function() {

      if (!mv.elementExists($("footer"))) {
        return false;
      }

      // Reference to self
      var that = this;

      // Capturing the elements
      this.$elements.subForm      = $("#new_subscriber");
      this.$elements.subEmail     = $("#subscriber_email");
      this.$elements.subBtnSend   = $("#subscriber_send");
      this.$elements.subNotify    = $(".notification");
      this.$elements.subNotifyMsg = $(".notification p");
      this.$elements.loader       = $(".loader");

      // Binds form focus highlight
      this.$elements.subForm.on("focusin", function() {
        $(this).addClass("focus");
      });

      this.$elements.subForm.on("focusout", function() {
        $(this).removeClass("focus");
      });

      // Binds form submit events
      this.$elements.subForm.on("ajax:success", function(e, data, status, xhr) {
        that.onSuccess(e, data, status, xhr);
      });

      this.$elements.subForm.on("ajax:error", function(e, xhr, status, error) {
        that.onFailure(e, xhr, status, error);
      });

      this.$elements.subForm.on("ajax:beforeSend", function(xhr, settings) {
        that.onBeforeSend(xhr, settings);
      });

      this.$elements.subForm.on("ajax:complete", function(xhr, status) {
        that.onComplete(xhr, status);
      });
    },

    // Called when form submit succeeds
    onSuccess: function(e, data, status, xhr) {
      if (xhr.status === 201) {
        setTimeout(function() { window.location.href = "/subscribers/success"; }, 800);
      } else {
        this.showError(xhr.status);
      }
    },

    // Called when form submit fails
    onFailure: function(e, xhr, status, error) {
      this.showError(xhr.status);
    },

    // Called when request is going to be sent
    onBeforeSend: function(xhr, settings) {
      var that = this;

      // Disable inputs
      this.$elements.subEmail.prop("disabled", true);
      this.$elements.subBtnSend.prop("disabled", true);

      // Makes illusion of loading
      this.timers.t1 = setTimeout(function() { that.setLoaded(25) }, 200);
      this.timers.t2 = setTimeout(function() { that.setLoaded(35) }, 550);
      this.timers.t3 = setTimeout(function() { that.setLoaded(75) }, 1350);
    },

    // Called when request is done
    onComplete: function(xhr, status) {
      this.setLoaded(100);
    },

    // Shows error for the user below input field
    showError: function(status) {
      var that = this;

      // Slight delay makes it nicer
      setTimeout(function() {
        var msg = "Unexpected error occured, try again later";

        switch (status) {
          case 200:
            msg = "Given email address has already subscribed!";
            break;
          case 422:
            msg = "Oops, your email address is invalid";
            break;
        }

        that.$elements.subNotifyMsg.text(msg);
        that.$elements.subNotify.addClass("error");
      }, 500);
    },

    // Sets loading bar progress
    setLoaded: function(percent) {
      var that = this;

      this.$elements.loader.addClass("p-" + percent);

      // Automatically reset the loader after a while
      if (percent === 100) { 
        setTimeout(function() { 
          // Enable inputs
          that.$elements.subEmail.prop("disabled", false);
          that.$elements.subBtnSend.prop("disabled", false);
          that.resetLoader(that) 
        }, 700); 
      }
    },

    // Resets loading bar to start
    resetLoader: function(that) {
      // Clear ongoing timers
      clearTimeout(that.timers.t1);
      clearTimeout(that.timers.t2);
      clearTimeout(that.timers.t3);

      // Reset loading back width back to zero
      that.$elements.loader.removeClass("p-25");
      that.$elements.loader.removeClass("p-35");
      that.$elements.loader.removeClass("p-75");
      that.$elements.loader.removeClass("p-100");
    }
  };

  $(function() { 
    // Initializes a shared view
    mv.initSharedView({ main: main });
  });

})(maunovaha);