class UsersController < ApplicationController
    skip_before_action :require_login, only: [:log, :new, :create, :index]

    def log
        unless session[:colors]
            session[:colors] = {'background-color' => 'slategrey', "color" => "black"}
        end
        @stores = Store.all
        render 'log'
    end

    def index
        unless session[:user_id]
            redirect_to root_path
        end

        unless session[:colors]
            session[:colors] = {'background-color' => "white", "color" => "black"}
        end
        @team = list_team
        @new = new_members
        @levellist = level_list
        
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
                return redirect_to new_user_path
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

    def update
        @user = User.find(params[:id])
        @user.update(user_level: params[:level])
        redirect_to :back
    end

    def colors
        @primary = Color.find(params[:colors]).primary
        @secondary = Color.find(params[:colors]).secondary
        session[:colors] = {"background-color" => @primary, "color" => @secondary}
        redirect_to :back
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

        def new_members
            @memberlist = []
            current_user.stores.each do |store|
                store.users.where(user_level: 0).each {|user| @memberlist << user}
            end
            return @memberlist
        end

        def level_list
            levellist = { 0 => "New User", 1 => "Employee", 2 => "Veteran Employee", 3 => "", 4 => "Team Lead", 5 => "Assistant Manager", 6 => "Department Manager", 7 => "Store Manager", 8 => "Regional Manager", 9 => "Admin"}
            return levellist
        end

    
    
    
        
end
    
