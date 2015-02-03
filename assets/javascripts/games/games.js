(function($) {
  "use strict";

  var gallery = function() {
    $(".thumbnails img").on("click", function() {

      var $preview = $("." + $(this).parent().data("preview"));

      // Swaps preview image to thumbnail image
      $preview.attr("src", $(this).attr("src"));
    });
  };

  $(function() { gallery(); });
})(jQuery);
