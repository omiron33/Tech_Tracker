class ComputersController < ApplicationController

    def show
        @computer = Computer.find(params[:id])
    end

    def new
        @skulist = Skulist.all
    end

    def index

    end

end
