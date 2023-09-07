class AddUserIdToQueuedSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :queued_songs, :user_id, :bigint
  end
end
