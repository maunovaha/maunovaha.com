"use strict";

maunovaha.pages.home = {};
maunovaha.pages.home.index = (function(mv) {
  
  // Contains program logic for home/index
  var main = {

    // Initializes the view
    init: function() {

      // Binds scrollable clicks to elements with "scroll-to" class
      $(".scroll-to").on("click", function(e) {
        e.preventDefault();

        scrollTo($("#" + $(this).data("scroll-to")));
      });

      // Scrolls to given section of the page
      var scrollTo = function(section) {
        $("body, html").animate(
          { scrollTop: section.offset().top }, 
          900, 
          "easeInOutQuart", 
          function() {}
        );
      };

      // Logic to load game section images on demand
      $("#load-more").on("click", function(e) {
        e.preventDefault();

        // Add when all loaded? - or just first?
        $(this).parent().addClass("display-none");

        // I know, this is a bit dirty.. but works
        $(".hidden-game").each(function(i) {
          var $hiddenGame       = $(this),
              $hiddenGameImg    = $hiddenGame.find("img"),
              $hiddenGameImgUrl = $hiddenGameImg.data("hidden-game-url");

          $hiddenGameImg.load(function() {
            $hiddenGame.addClass("inline-block");
          }).attr("src", $hiddenGameImgUrl);
        });
      });

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