class MembershipsController < ApplicationController
  def new
    @users = User.all
    @chatroom = Chatroom.find(params[:chatroom_id])
    @membership = Membership.new
  end

  def create
    @users = User.all
    @chatroom = Chatroom.find(params[:chatroom_id])
    @membership = Membership.new(membership_params)
    @membership.chatroom = @chatroom

    if @membership.save
      flash[:notice] = 'User added successfully'
      redirect_to chatroom_path(@chatroom)
    else
      flash.now[:notice] = @membership.errors.full_messages.join(' * ')
      render :new
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    flash[:notice] = 'Chatroom deleted'
    redirect_to root_path
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :chatroom_id)
  end
end
