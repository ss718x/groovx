class TracksController < ApplicationController
  def index
  end

  def search
    query = params[:query]
    @room_id = params[:room_id]
    @tracks = RSpotify::Track.search(query) if query.present?

    respond_to do |format|
      format.json
      # format.json { render json: { tracks: @tracks, room_id: @room_id }}
    end
  end

  def callback
    # Code for callback after Spotify authentication
  end

  def add_track_to_queue
    @track_id = params[:track_id]
    @user = current_user
    @room_id = params[:roomId]

    QueuedSong.create(user: @user, room_id: 266, track_id: @track_id)
    puts "Track added to queue: #{@track_id}"

    # add addSongToQueue action that will generate queued songs

    render json: { message: 'Track added to queue' }
  end
end
