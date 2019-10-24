class RoomsController < ApplicationController
    
    @@timeStep = 0
    @@playTime = nil
    $current_messes_cleaned = 0
    
    def newgame
        Roominfo.destroy_all
        @@playTime = Time.now
        redirect_to action: 'index'
    end
    
    def gameover
        @gamestat = current_user.gamestats.last
    end
    
    def index
        if @@playTime
            update
            gameOver?
            @playTime = @@playTime
            @rooms = Room.all
        else
            redirect_to '/main'
        end
    end
    
    def show
        update
        gameOver?
        @playTime = @@playTime
        @room = Room.find(params[:id])
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
        @room.clean_mess(params[:mess], current_user)
        redirect_to room_path(@room)
    end

    private

        def timecheck
            # checks the time and returns an integer that is the amount of elapsed 30 second periods
            # stores the current time step in a variable
            if Time.now != @@playTime
                ((Time.now - @@playTime)/15).to_i
            end
        end

        def gameOver?
            elapsed = Time.now - @@playTime
            if Room.gameover?
                Gamestat.create(messes_cleaned: $current_messes_cleaned, user_id: current_user.id, elapsed_time: elapsed)
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
                    if !Room.add_messes
                        redirect_to gameover_path
                    end
                end
                @@timeStep = current_step
            end
        end

end
