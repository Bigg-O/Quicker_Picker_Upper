class Room < ApplicationRecord
    has_many :roominfos
    has_many :tools
    has_many :messes, through: :roominfos


    def self.inventory
        inv = Room.all.select { |room| room.name == "Inventory"}.first
    end

    # def room_tools
    #     self.tools.map { |tool| tool.name }
    #     #array of all tools in the room
    # end


    def pick_up(tool_picked)
        tool = Tool.all.find_by_id(tool_picked)
        if Room.inventory.tools.length == 0 && self.tools.length != 0
            Room.inventory.tools << tool
            self.tools.delete(tool)
        end
    end

    def drop_item
        self.tools << Room.inventory.tools.first
        Room.inventory.tools.delete
        Room.inventory.save
        self.save
    end

    def clean_mess(mess_to_clean)
        puts mess_to_clean
        if Room.inventory.tools.first == mess_to_clean.tool
            self.mess.delete(mess)
            self.save
        end

    end

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
