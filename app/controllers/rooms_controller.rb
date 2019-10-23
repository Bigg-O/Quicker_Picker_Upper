class RoomsController < ApplicationController
    @@timeStep = 0
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

    def newgame
    end

    def gameover
        @gamestat = current_user.gamestats.last

    end
    

    private

    def timecheck
        # checks the time and returns an integer that is the amount of elapsed 30 second periods
        # stores the current time step in a variable
       ((Time.now - @@playTime)/30).to_i
    end
    def gameover?
        if Room.gameover?
            redirect_to gameover_path
        end
    end
    def update
        # finds the current step (a step is a 30 second chunk of time)
        # adds kids and messes for each step that has passed
        # redirects to gameover if you add a 5th mess to a room
        # updates the timestep of the controller
        current_step = timecheck
        if current_step > @@timeStep
            (current_step - @@timeStep).times do
                Room.addKids
                if !Room.addmesses
                    redirect_to gameover_path
                end
            end
            @@timeStep = current_step
        end
    end



end
