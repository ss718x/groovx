class CreateQueuedSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :queued_songs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.string :track_id

      t.timestamps
    end
  end
end
