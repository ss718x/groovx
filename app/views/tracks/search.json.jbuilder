if @tracks
  json.tracks render(partial: "room/playlist", formats: :html, locals: { tracks: @tracks })
else
  json.errors "no tracks"
end
