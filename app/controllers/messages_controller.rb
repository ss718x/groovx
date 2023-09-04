class MessagesController < ApplicationController
  def create
    # content, chatroom, user
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    @message.room = @room
    @message.user = current_user

    if @message.save
      redirect_to room_path(@room)
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
