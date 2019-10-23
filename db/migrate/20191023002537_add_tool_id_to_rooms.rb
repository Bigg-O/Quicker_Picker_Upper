class AddToolIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :tool_id, :integer
  end
end
