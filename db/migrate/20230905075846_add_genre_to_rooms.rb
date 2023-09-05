class AddGenreToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :genre, :string
  end
end
