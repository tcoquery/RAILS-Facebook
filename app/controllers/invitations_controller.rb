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

  def destroy
    @invitation = Invitation.where("id = ?", params[:id])
    @friend = User.where("id = ?", params[:invitation][:friend_id]).first
    @invitation.destroy(params[:id])

    if params[:commit] == "Accept"
      current_user.friends.create(first_name: params[:invitation][:first_name], last_name: params[:invitation][:last_name])
      @friend.friends.create(user_id: @friend.id, first_name: current_user.first_name, last_name: current_user.last_name)
    end

    respond_to do |format|
      format.html { redirect_to home_index_path }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:invitation).permit(:user_id, :friend_id)
  end

end
