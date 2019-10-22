class RemoveTypeFromMesses < ActiveRecord::Migration[6.0]
  def change

    remove_column :messes, :type, :string
  end
end
