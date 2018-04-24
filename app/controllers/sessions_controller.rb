class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    
    def create
        if (params[:email]) == "" || (params[:password]) == ""
            flash[:errors] = ["Login Fields can not be blank"]
            return redirect_to :back
        end
        @user = User.find_by(email: params[:email].downcase)
            # Log User In
        if @user
            if @user.authenticate(params[:password])
                id = @user.id
                session[:user_id] = @user.id
                redirect_to users_path
            else
            flash[:errors] = ["Email / Password do not match"]
            redirect_to root_path
            end
        else
            flash[:errors] = ["User not found"]
            redirect_to root_path
        end
        end

        def destroy
        session[:user_id] = nil
        redirect_to root_path
        end
end
