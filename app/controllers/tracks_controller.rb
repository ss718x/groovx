class TracksController < ApplicationController
  def index
  end

  def search
    query = params[:query]
    @tracks = RSpotify::Track.search(query) if query.present?

    respond_to do |format|
      format.json
    end
  end

  def callback
    # Code for callback after Spotify authentication
  end
end
