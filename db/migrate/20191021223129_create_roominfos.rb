class CreateRoominfos < ActiveRecord::Migration[6.0]
  def change
    create_table :roominfos do |t|
      t.integer :room_id
      t.integer :tool_id
      t.integer :mess_id

      t.timestamps
    end
  end
end
