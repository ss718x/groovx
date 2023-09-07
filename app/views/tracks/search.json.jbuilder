if @tracks
  json.tracks render(partial: "room/playlist", formats: :html, locals: { tracks: @tracks })
  # json room_id @room_id
else
  json.errors "no tracks"
end
