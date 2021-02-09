class HomeController < ApplicationController
    def index
        @events = Event.search(params)
        @notifications = Notification.where(recipient: current_user).unread 
    end
end
