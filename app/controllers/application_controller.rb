class ApplicationController < ActionController::Base
    before_action :assign_user
   
    def assign_user
        @current_user = User.find_by(id: session[:user_id])
    end
end
