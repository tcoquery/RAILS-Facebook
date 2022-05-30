class HomeController < ApplicationController
  def index
    @user = current_user
    @invitations = Invitation.where("friend_id = ?", current_user.id)
        
  end
end
