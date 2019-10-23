class Room < ApplicationRecord
    has_many :roominfos
    has_many :messes, through: :roominfos
    has_many :tools, through: :roominfos
    

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
end
