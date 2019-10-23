class Gamestat < ApplicationRecord
    belongs_to :user

    def self.top_five_messes
        Gamestat.all.max_by(5){ |gamestat| gamestat.messes_cleaned }
    end
    
    def self.longest_games
        Gamestat.all.max_by(5){ |gamestat| gamestat.elapsed_time }
    end
    def self.user_top_messes(user)
        Gamestat.all.select{|gamestat| gamestat.user == user }.max_by(3){ |gamestat| gamestat.messes_cleaned }
    end
    def self.user_longest_games(user)
        Gamestat.all.select{|gamestat| gamestat.user == user }.max_by(3){ |gamestat| gamestat.elapsed_time }
    end

end
