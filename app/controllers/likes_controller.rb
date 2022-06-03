class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.create(like_params)

    if @like.save
      flash[:success] = "Great! Your event has been created!"
      redirect_to home_index_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      redirect_to home_index_path, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private 

  def like_params
    params.permit(:user_id, :post_id)
  end

end
