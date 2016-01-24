"use strict";

maunovaha.pages.home = {};
maunovaha.pages.home.index = (function(mv) {
  
  // Contains program logic for home/index
  var main = {

    // Initializes the view
    init: function() {

      // Binds scrollable clicks to elements with "scroll-to" class
      $(".scroll-to").on("click", function(e) {
        scrollTo(e, $("#" + $(this).data("scroll-to")));
      });

      // Scrolls to given section of the page
      var scrollTo = function(e, section) {
        e.preventDefault();

        $("body, html").animate(
          { scrollTop: section.offset().top }, 
          900, 
          "easeInOutQuart", 
          function() {}
        );
      };
    }
  };

  // Registers itself to list of pages
  $(function() { 
    // Initializes view
    mv.initView({
      controller: "home",
      action: "index",
      main: main
    }); 
  });

})(maunovaha);