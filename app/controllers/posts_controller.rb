class PostsController < ApplicationController

  def show
    render json: Post.find(params[:ids])
  end

end
