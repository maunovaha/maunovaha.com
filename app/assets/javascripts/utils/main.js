"use strict";

// Site namespace
var maunovaha = {

  // Contains all pages (home, blog, etc.)
  pages: {},

  // Contains all shared views e.g. footer
  shared: {},

  // Initializes controller/action specific things e.g. home -> index
  initView: function(props) {
    var $body       = $("body"),
        _action     = $body.data("action"),
        _controller = $body.data("controller");
    
    if (props["controller"] === _controller && props["action"] === _action) {
      // Initialize correct view
      props["main"].init();
    }
  },

  // Initializes a shared view
  initSharedView: function(props) {
    props["main"].init();
  },

  // Checks for existance of DOM element
  elementExists: function($element) { 
    return $element.length > 0; 
  }
};