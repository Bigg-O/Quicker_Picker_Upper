class RemoveTimesFromGamestats < ActiveRecord::Migration[6.0]
  def change

    remove_column :gamestats, :initial_time, :datetime

    remove_column :gamestats, :ending_time, :datetime
  end
end
