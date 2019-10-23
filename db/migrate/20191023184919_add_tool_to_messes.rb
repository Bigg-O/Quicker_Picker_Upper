class AddToolToMesses < ActiveRecord::Migration[6.0]
  def change
    add_column :messes, :tool_id, :integer
  end
end
