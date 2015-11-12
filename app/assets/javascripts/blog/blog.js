maunovaha.blog = (function(render) {

  "use strict";

  var actions = {
    index: function() {
      console.log("Index of blog called..");
    }
  };

  $(function() { render("blog", actions); });

})(maunovaha.render);