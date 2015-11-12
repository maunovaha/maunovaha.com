var maunovaha    = maunovaha || {};
maunovaha.render = (function() {

  "use strict";

  return function(controller, actions) {
    var $body       = $("body"),
        action      = $body.data("action"),
        _controller = $body.data("controller");
        
    if (controller === _controller && actions.hasOwnProperty(action)) {
      actions[action](); // Calls current controller/action
    }
  };

})();