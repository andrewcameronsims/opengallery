class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.all
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def new
    @workshop = Workshop.new
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def create
    @workshop = Workshop.new(workshop_params)
  end

  def update
  end

  def destroy
  end
  
  private
    def workshop_params
      params.require(:workshop).permit(:bio, :bank_account, :auto_respond_msg, :user_id)
    end
end
