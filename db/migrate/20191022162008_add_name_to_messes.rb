class AddNameToMesses < ActiveRecord::Migration[6.0]
  def change
    add_column :messes, :name, :string
  end
end
