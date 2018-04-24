class ComputersController < ApplicationController

    def show
        @computer = Computer.find(params[:id])
    end

end
