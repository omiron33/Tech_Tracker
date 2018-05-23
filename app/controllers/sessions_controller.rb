class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    
    def create
        if (params[:employee_number]) == "" || (params[:password]) == ""
            flash[:errors] = ["Login Fields can not be blank"]
            return redirect_to :back
        end
        @user = User.find_by(employee_number: params[:employee_number])
            # Log User In
        if @user
            if @user.authenticate(params[:password])
                id = @user.id
                session[:user_id] = @user.id
                session[:store_id] = @user.stores.first.id
                if current_user.user_level < 1
                    return redirect_to new_user_path
                end
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

    def storeset
        session[:store_id] = params[:set]
        redirect_to :back
    end


    def destroy
    session[:user_id] = nil
    session[:colors] = nil
    session[:store_id] = nil
    redirect_to root_path
    end
end
