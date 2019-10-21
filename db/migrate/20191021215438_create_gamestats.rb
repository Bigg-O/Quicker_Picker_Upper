class CreateGamestats < ActiveRecord::Migration[6.0]
  def change
    create_table :gamestats do |t|
      t.datetime :initial_time
      t.datetime :ending_time
      t.integer :messes_cleaned
      t.integer :user_id

      t.timestamps
    end
  end
end
