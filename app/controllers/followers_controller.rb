class FollowersController < ApplicationController
  def create
    @follower = Follower.new(follower_params)
    @follower.save
  end

  def destroy
    @follower = Follower.find(params[:id])
    @follower.destroy
  end

  private
    def follower_params
      params.require(:follower).permit(:user_id, :workshop_id)
    end
end
