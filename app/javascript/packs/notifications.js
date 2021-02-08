(function() {
    var notifications;
  
    notifications = (function() {
      function notifications() {
        this.notifications = $("[data-behaviour='notifications']");
        if (this.notifications.length > 0) {
          this.setup();
        }
      }
  
      notifications.setup = function() {
        return console.log(this.notifications);
      };
  
      return notifications;
  
    })();
  
    jQuery(function() {
      return new notifications;
    });
  
  }).call(this);

 /*  class notifications
    constructor: ->
       @notifications = $("[data-behaviour='notifications']")
       @setup() if @notifications.length > 0
    @setup: ->
      console.log(@notifications)

jQuery ->
    new Notifications */