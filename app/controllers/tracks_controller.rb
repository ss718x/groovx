class TracksController < ApplicationController
  def index
  end

  def search
    query = params[:query]
    puts "Received query: #{query}"
    @tracks = RSpotify::Track.search(query) if query.present?
  end

  def callback
    # Code for callback after Spotify authentication
  end
end
