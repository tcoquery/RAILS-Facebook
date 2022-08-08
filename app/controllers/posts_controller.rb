class PostsController < ApplicationController
  def index
    @pending_invitations = current_user.pending_invitations
    @posts = Post.all
    @friends = current_user.friends
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(user_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:post).permit(:user_id, :body)
  end

end
