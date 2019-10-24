class UsersController < ApplicationController

    skip_before_action :authorize, only: [:index ,:new, :create]

    def index
        #new game and stats
    end

    def show
        redirect_to :index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id]
            redirect_to login_path, notice: 'Your account was successfully created.' 
        else
            render :new
        end

    end

    def statistics
        # do some stuff with gamestats
        @top_five_messes = Gamestat.top_five_messes
        @longest_games = Gamestat.longest_games
        @user_top_messes = Gamestat.user_top_messes(current_user)
        @user_longest_games =Gamestat.user_longest_games(current_user)
    end

    private

        def user_params
            params.require(:user).permit(:user_name, :password, :password_confirmation)
        end

end
