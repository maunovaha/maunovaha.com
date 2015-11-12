maunovaha.home = (function(render) {

  "use strict";

  var actions = {
    index: function() {
      console.log("Index of home called..");
    }
  };

  $(function() { render("home", actions); });

})(maunovaha.render);