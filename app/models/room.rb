class Room < ApplicationRecord
    has_many :roominfos
    has_many :tools
    has_many :messes, through: :roominfos


    def self.rooms
        Room.all.select{|room| room.name != 'Inventory'}
    end


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

    def addmess
        # adds a random mess to a room
        if self.fullmess
            return false
        end
        loop do 
            random_mess = Mess.all.sample
            if !self.messes.include?(random_mess)
                Roominfo.create(room:self, mess:random_mess)
                return true
            end
        end
    end

    

    def self.gameover?
        # returns true if all rooms are messy => self.fullmess?
        # or if one room has all messes
        self.rooms.each do |room| 
           if room.fullmess?
                return true
           end
        end
        if self.fullmess?
            return true
        end
        return false
    end

    def fullmess?
        # checks a room to see if it has all the messes
        if self.messes.count == 4
            return true
        else
            return false
        end
    end

    def self.fullmess?
        # check each room for a mess and return true if all rooms are messy
       
        if self.all.map {| room| room.messy? }.include?(false)
            return false
        else 
            return true
        end   
    end
    
    def messy?
        # check a single room to see if its messy
        # if a single room has roominfos (.empty? is false), its messy (return true)
        !self.roominfos.empty?
    end

    def self.add_messes
        # attempts to add messes to all of the rooms.
        #  if a room is full of messes, returns false, meaning game is over
        self.rooms.each do |room| 
            room.num_of_kids.times do 
                if rand(1..100) > 50
                   if !room.addmess
                    # add mess returns false if the room is full of messes
                    return false
                   end
                end
            end
        end
        return true
    end

   
    
end
