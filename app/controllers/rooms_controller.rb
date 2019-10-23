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

    def newgame
    end

    def gameover
        @gamestat = current_user.gamestats.last
    end

end
