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

    QueuedSong.create(user: @user, track_id: @track_id)
    puts "Track added to queue: #{@track_id}"

    # @queue_array = []
    # @queue_array << queued_song

    render json: { message: 'Track added to queue' }
  end

  def queued_songs
    @queued_songs = QueuedSong.all.map do |queue|
      RSpotify::Track.find(queue.track_id)
    end
    render json: @queued_songs
  end
end
