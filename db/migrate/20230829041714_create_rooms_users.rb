class CreateRoomsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms_users do |t|
      t.integer :room_id
      t.integer :user_id
    end
  end
end
