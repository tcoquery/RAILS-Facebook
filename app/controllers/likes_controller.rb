class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.create(like_params)

    if @like.save
      flash[:success] = "Great! Your event has been created!"
      redirect_to posts_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      redirect_to posts_path, status: :unprocessable_entity
    end
  end

  def destroy
    @dislike = Like.find(params[:id])
    @dislike.delete
    redirect_to posts_path
  end

  private 

  def like_params
    params.permit(:user_id, :post_id)
  end

end
