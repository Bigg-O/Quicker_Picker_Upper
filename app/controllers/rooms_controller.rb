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
    end

end
