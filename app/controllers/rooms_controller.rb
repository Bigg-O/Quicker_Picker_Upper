class RoomsController < ApplicationController
    def newgame
    end
    def gameover
        @gamestat = current_user.gamestats.last

    end
end
