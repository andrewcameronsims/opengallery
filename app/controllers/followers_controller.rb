class FollowersController < ApplicationController
  def create
    @follower = Follower.new(follower_params)

    if @follower.save
      puts "success"
    else
      puts "failure"
    end
    # return format.json {render json: @follower_id}
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
