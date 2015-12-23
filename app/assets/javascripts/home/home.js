maunovaha.home = (function(render) {

  "use strict";

  var actions = {
    index: function() {
      // Binds scrollable clicks to elements with "scroll-to" class
      $('.scroll-to').on('click', function(e) {
        scrollTo(e, $('#' + $(this).data('scroll-to')));
      });

      // Scrolls to given section of the page
      var scrollTo = function(e, section) {
        e.preventDefault();

        $('body, html').animate({
          scrollTop: section.offset().top
        }, 900, 'easeInOutQuart', function() {});
      };
    }
  };

  $(function() { render("home", actions); });

})(maunovaha.render);