class Room < ApplicationRecord
    has_many :roominfos
    has_many :tools
    has_many :messes, through: :roominfos

# would it be better to put tools in Rooms and remove it from roominfos
# replace "No_tool" with the appropriate tool from tools variable in Room
# this could easily be done with indexing an array to find what tool is where


# To do this with the ways described below 

# find toolinfo associated with room instance the logged in user is in
#   Global variables might be neeeded for this.

# pick_up
#   hold that tool in a method variable and delete roominfos for current room
#   the user is in and create new roominfos with that tool for the room

# drop_item
#   hold that tool in a method variable then create a new roominfos with..
#   that tool and the correct mess.
#   Then delete roominfos for inventory and create a new roominfos with..
#   the no_tool instance.


#  it might be possible to replace the roominfos with the correct tools
#   the mess would need to be replaced or added to instead of destroyed
#   and created

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

    def clean_mess

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
