class ChangeElapsedTimeToIntegerOnGamestats < ActiveRecord::Migration[6.0]
  def change
    change_column :gamestats, :elapsed_time, :integer
  end
end
