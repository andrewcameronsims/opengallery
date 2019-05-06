class FollowersController < ApplicationController
  def create
    @follower = Follower.new(follower_params)

    if @follower.save
      puts "success"
    else
      puts "failure"
    end
  end

  private
    def follower_params
      params.require(:follower).permit(:user_id, :workshop_id)
    end
end
