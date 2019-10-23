class RoomsController < ApplicationController

    @@playTime = nil

    def playgame
        @@playTime = Time.now
        redirect_to action: 'index'
    end
    
    def gameover
        @gamestat = current_user.gamestats.last
    end
    
    def index
        @playTime = @@playTime
        @rooms = Room.all
    end
    
    def show
        @playTime = @@playTime
        @room = Room.find(params[:id])
    end

    def gameover
        @gamestat = current_user.gamestats.last
    end

    def drop_button
        @room = Room.find(params[:id])
        @room.drop_item
        redirect_to room_path(@room)
    end

    def pick_up_button
        @room = Room.find(params[:id])
        @room.pick_up(params[:tool_picked])
        redirect_to room_path(@room)
    end

    def clean_button

    end


end
