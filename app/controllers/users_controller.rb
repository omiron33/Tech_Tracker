class UsersController < ApplicationController
    skip_before_action :require_login, only: [:log, :new, :create, :index]

    def log 
        render 'log'
    end

    def index
        unless session[:user_id]
            redirect_to root_path
        end
        @team = list_team
        p @team
    end
    def create
        @user = User.new(user_params)
        @user.user_level = 0
        @user.email.downcase!
        @user.save
        if @user.valid?
            session[:user_id] = @user.id
            return redirect_to users_path
        end
        messages = []
        @user.errors.full_messages.each { |message| messages << message }
        flash[:errors] = messages
        redirect_to :back
    end

    def show
        @user = User.find(params[:id])
    end


    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
            
        end

        def list_team
            @teamlist = []
            current_user.leaders.each {|leader| @teamlist << leader.employees.where.not(id: current_user.id)}
            return @teamlist
        end

    
    
    
        
end
    
