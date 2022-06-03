class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        flash[:success] = "Great! Your event has been created!"
        redirect_to posts_path
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end

end
