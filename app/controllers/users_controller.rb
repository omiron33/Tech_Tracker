class UsersController < ApplicationController
    skip_before_action :require_login, only: [:log, :new, :create, :index]

    def log 
        @stores = Store.all
        render 'log'
    end

    def index
        unless session[:user_id]
            redirect_to root_path
        end
        @team = list_team
    end
    def create
        @user = User.new(user_params)
        @store = Store.find_by(store_params)
        @user.user_level = 0
        @user.email.downcase!
        @user.save
        @store.users << @user
        if @user.valid?
            session[:user_id] = @user.id
            if current_user.user_level < 1
                return redirect_to new_users_path
            end
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
            params.require(:user).permit(:first_name, :last_name, :email, :employee_number, :password, :password_confirmation)
            
        end

        def store_params
            params.require(:store).permit(:store_number)
        end

        def list_team
            @teamlist = []
            current_user.leaders.each {|leader| @teamlist << leader.employees.where.not(id: current_user.id)}
            return @teamlist
        end

    
    
    
        
end
    
