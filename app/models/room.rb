class Room < ApplicationRecord
    has_many :roominfos
    has_many :tools
    has_many :messes, through: :roominfos
  
    def self.fullmess
        # check each room for a mess and return true if all rooms are messy
        if self.all.map {| room| room.messy? }.includes?(false)
            return false
        else 
            return true
        end   
    end
    def messy?
        # check a single room to see if its messy
        # if a single room has roominfos(.empty? is false), its messy (return true)

        !self.roominfos.empty?
    end

end
