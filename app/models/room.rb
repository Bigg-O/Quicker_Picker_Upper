class Room < ApplicationRecord
    has_many :roominfos
    has_many :tools
    has_many :messes, through: :roominfos

    

    def self.addkid
        # adds a kid to a random room thats not the inventory
        loop do
            extra_kid_room = Room.all.sample
            if extra_kid_room.name != "inventory"
                extra_kid_room.num_of_kids += 1
                extra_kid_room.save
                return true
            end
        end
    end
    def messchance
        # should check the number of kids in the room and return a probability that increases with each kid

    end
    def addmess
        # adds a random mess to a room
        random_mess = Mess.all.sample
        Roominfo.create(room:self, mess:random_mess)
    end

  
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
