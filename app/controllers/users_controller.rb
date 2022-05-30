class UsersController < ApplicationController
  def index
    @user = User.all
    @invitation = Invitation.new
  end


end
