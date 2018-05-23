class SalesController < ApplicationController

    def show
        @computer = Computer.find(params[:id])
    end

    def new
        @computerlist = Computer.all
        @userlist = list_team
        

    end

    def create

    end

    def getComputers
        
    end

    private
        def sale_params
            params.require(:sale).permit(:transaction_date, :user_id, :customer_id)
            
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
