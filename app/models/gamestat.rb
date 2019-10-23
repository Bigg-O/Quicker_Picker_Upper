class Gamestat < ApplicationRecord
    belongs_to :user

    def self.top_five_messes
        Gamestat.all.max_by(5){ |gamestat| gamestat.messes_cleaned }
    end
    
    def self.longest_games
        Gamestat.all.max_by(5){ |gamestat| gamestat.elapsed_time }
    end
end
