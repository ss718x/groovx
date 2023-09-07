class RemoveRoomIdFromQueuedSongs < ActiveRecord::Migration[6.0]  # The version number may vary based on your Rails version
  def change
    remove_column :queued_songs, :room_id, :bigint
  end
end
