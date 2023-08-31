class TracksController < ApplicationController
  def index
  end

  def search
    @tracks = RSpotify::Track.search(params[:query])
  end

  def callback
    # Code for callback after Spotify authentication
  end
end
