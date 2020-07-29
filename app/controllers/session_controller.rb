class SessionController < ApplicationController

   def new
   end

   def logged_in
    user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_session_path
        end
   end

   def logout
        session[:user_id].destroy
   end
end
