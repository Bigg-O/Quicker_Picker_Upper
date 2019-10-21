class CreateMesses < ActiveRecord::Migration[6.0]
  def change
    create_table :messes do |t|
      t.string :type

      t.timestamps
    end
  end
end
