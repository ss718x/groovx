class CreateSongQueues < ActiveRecord::Migration[7.0]
  def change
    create_table :song_queues do |t|

      t.timestamps
    end
  end
end
