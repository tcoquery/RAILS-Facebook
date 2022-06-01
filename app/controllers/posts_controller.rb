class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.new(user_params)

    if @post.save
      flash[:success] = "Great! Your post has been created!"
      redirect_to home_index_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:user_id, :body)
  end

end
