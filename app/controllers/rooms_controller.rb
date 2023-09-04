class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @djs = @room.djs.order(created_at: :desc)
    @user = current_user
    @rooms_user = RoomsUser.new
    @messages = Message.all
    @message = Message.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully deleted.'
  end

  def my_rooms
    @user = current_user
    @user_rooms = @user.created_rooms || []  # Initialize @user_rooms to an empty array if it's nil
  end

  private

  def room_params
    params.require(:room).permit(:name, :max_djs, :description, :creator_id)
  end
end
