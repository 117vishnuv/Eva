class HomeController < ApplicationController
    def index
        @events = Event.search(params)
    end
end
