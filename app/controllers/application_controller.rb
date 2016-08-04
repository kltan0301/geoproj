class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def require_logout
     if logged_in?
       flash[:warning] = "You must log out to create/log in as a new user"
       redirect_to(attractions_url)
     end
    end
end
