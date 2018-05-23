class ComputersController < ApplicationController

    def show
        @computer = Computer.find(params[:id])
    end

    def new
        @skulist = Skulist.all
    end

    def index
        @computerlist = Computer.where(sold: false, store_id: session[:store_id])
    end

    def create
        @sku = Skulist.find_by(sku: params[:skulist_sku])
        @store = Store.find(session[:store_id])
        @computer = Computer.new(serial: params[:serial], skulist_id: @sku.id, sold: false)
        @computer.rec_date = Date.current()
        @computer.skulist_id = @sku.id
        @computer.save
        @store.computers << @computer
        if @computer.valid?
            flash[:success] = 'Computer added to store inventory'
            return redirect_to new_computer_path
        end
        messages = []
        @user.errors.full_messages.each { |message| messages << message }
        flash[:errors] = messages
        redirect_to new_computer_path
    end




end
