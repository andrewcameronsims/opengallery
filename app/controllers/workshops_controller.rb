# frozen_string_literal: true

class WorkshopsController < ApplicationController

  def new
    if !current_user.artist?
      @workshop = Workshop.new
      @user = current_user
    else
      redirect_to home_path
    end
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @user = current_user

    if @workshop.save
      @user.artist = true
      @user.save
      redirect_to new_piece_path
    else
      render 'new'
    end
  end

  private

  def workshop_params
    params.require(:workshop).permit(:bio, :bank_account, :auto_respond_msg, :user_id)
  end
end
