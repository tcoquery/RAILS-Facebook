class CommentsController < ApplicationController
  
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
  
      if @post.save
        flash[:success] = "Great! Your post has been created!"
        redirect_to home_index_path
      else
        flash.now[:error] = "Rats! Fix your mistakes, please."
        render :new, status: :unprocessable_entity
      end
    end
  
  private
  
  def comment_params
      params.require(:comment).permit(:post_id, :body, :user_id)
  end
  
end
