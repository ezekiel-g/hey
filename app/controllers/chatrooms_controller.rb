class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      flash[:notice] = 'Chatroom created successfully'
      redirect_to root_path
    else
      flash.now[:notice] = @chatroom.errors.full_messages.join(' * ')
      render :new
    end
  end

  def edit
    @chatroom = Chatroom.find(params[:id])

    if current_user.id != @chatroom.owner_id
      flash[:notice] = 'You are only allowed to edit your own chatrooms.'
      redirect_to chatroom_path
    end
  end

  def update
    @chatroom = Chatroom.find(params[:id])

    if @chatroom.update_attributes(chatroom_params)
      flash[:notice] = 'Chatroom edited successfully'
      redirect_to root_path
    else
      flash.now[:notice] = @chatroom.errors.full_messages.join(' * ')
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy

    flash[:notice] = 'Chatroom deleted'
    redirect_to root_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :owner_id)
  end
end
