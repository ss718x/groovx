class SongqueuesController < ApplicationController
  def add_track_to_queue
    raise
    track_id = params[:track_id]
    user = current_user
    room = Room.find(:room_id)
    current_user.song_queue.add_track(track_id)

    QueuedSongs.create(user: user, room:, track_id: track_id)
    puts "Track added to queue: #{track_id}"

    render json: { message: 'Track added to queue' }
  end
end
