class RoomsController < ApplicationController

    
    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find(params[:id])
    end

    def newgame
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
        @room = Room.find(params[:id])
        @room.clean_mess(params[:mess])
    end





end
