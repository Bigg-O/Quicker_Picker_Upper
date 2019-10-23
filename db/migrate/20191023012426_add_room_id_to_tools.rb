class AddRoomIdToTools < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :room_id, :integer
  end
end
