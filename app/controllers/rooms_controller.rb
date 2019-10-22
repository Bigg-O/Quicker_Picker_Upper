class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find(params[:id])
        @tools = Tool.all.select{|tool| tool.roominfos.room_id == @room.id}
    end

end