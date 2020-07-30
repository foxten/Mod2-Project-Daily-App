class SessionController < ApplicationController

   def new
    render :layout => false
   end

   def welcome
    render :layout => false
   end

   def logged_in
    user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user_profile_path(user)
        else
            redirect_to new_session_path
        end
   end

   def logout
        session.delete(:user_id)
        redirect_to welcome_path
   end
end
