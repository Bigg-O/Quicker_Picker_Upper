class ApplicationController < ActionController::Base

    before_action :authorize
    helper_method :current_user
    
    def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
        else
          @current_user = nil
        end
    end

    def require_login
        redirect_to login_path unless session.include? :user_id
    end

    protected

      def authorize
        unless User.find_by(id: session[:user_id])
            redirect_to '/users'
        end
      end
end