class RoomsController < ApplicationController
    def newgame
    end
    def gameover
        @gamestat = current_user.gamestats.last

    end


    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find(params[:id])
        @tools = Tool.all.select{|tool| tool.roominfos.room_id == @room.id}
    end

end
