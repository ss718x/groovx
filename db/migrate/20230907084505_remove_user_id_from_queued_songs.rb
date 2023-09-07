class RemoveUserIdFromQueuedSongs < ActiveRecord::Migration[7.0]
  def change
    remove_column :queued_songs, :user_id, :bigint
  end
end
