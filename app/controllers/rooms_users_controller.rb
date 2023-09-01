class RoomsUsersController < ApplicationController
  def create
    @rooms_user = RoomsUser.new(room_id: params[:room_id], user_id: current_user.id)
    @rooms_user.save
    @room = Room.find(params[:id])
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @rooms_user = RoomsUser.find_by(room_id: params[:room_id], user_id: current_user.id)
    @rooms_user.destroy
    redirect_to room_path(@room)
  end
end
