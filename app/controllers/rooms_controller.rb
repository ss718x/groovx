class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @djs = @room.djs
    @user = current_user
    @rooms_user = RoomsUser.new
    @messages = @room.messages.order(created_at: :asc)
    @message = Message.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id

    random_number = rand(1000)
    @room.image_url = "https://source.unsplash.com/random/?music&random=#{random_number}"

    if @room.save
      redirect_to room_path(@room), notice: 'Room was successfully created.'
    else
      render :new, notice: 'Cannot create room'
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
    @rooms = current_user.rooms
  end

  private

  def room_params
    params.require(:room).permit(:name, :max_djs, :description)
  end
end
