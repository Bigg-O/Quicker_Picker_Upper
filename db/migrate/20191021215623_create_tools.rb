class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.boolean :inventory

      t.timestamps
    end
  end
end