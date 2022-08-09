class UsersController < ApplicationController
  def index
    @user = User.all
    @invitation = Invitation.new
    @pending_invitations = current_user.pending_invitations
  end

  def show
    @posts = current_user.posts
    @pending_invitations = current_user.pending_invitations
  end
end
