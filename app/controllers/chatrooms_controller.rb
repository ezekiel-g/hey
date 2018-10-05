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
      redirect_to chatroom_path(@chatroom)
    else
      flash.now[:notice] = @chatroom.errors.full_messages.join(' * ')
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
