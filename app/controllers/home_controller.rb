class HomeController < ApplicationController
  def index
    @pending_invitations = current_user.pending_invitations
    @posts = Post.all
  end


end
