class RemoveToolIdFromRoominfos < ActiveRecord::Migration[6.0]
  def change

    remove_column :roominfos, :tool_id, :integer
  end
end
