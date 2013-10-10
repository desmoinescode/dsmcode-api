class TweetsController < ApplicationController

  def show
    render json: Tweet.find(params[:ids])
  end

end
