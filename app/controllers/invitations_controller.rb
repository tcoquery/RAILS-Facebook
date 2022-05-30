class InvitationsController < ApplicationController

  def create
    @invitation = current_user.invitations.build(user_params)

    if @invitation.save
      flash[:success] = "Great! Your event has been created!"
      redirect_to users_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:invitation).permit(:user_id, :friend_id)
  end

end
