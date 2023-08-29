class AddFieldsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :tag, :string
    add_column :rooms, :description, :text
    add_column :rooms, :image_url, :string
  end
end
