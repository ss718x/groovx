class AddMaxDjsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :max_djs, :integer
  end
end
