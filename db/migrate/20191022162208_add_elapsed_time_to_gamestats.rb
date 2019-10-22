class AddElapsedTimeToGamestats < ActiveRecord::Migration[6.0]
  def change
    add_column :gamestats, :elapsed_time, :time
  end
end
