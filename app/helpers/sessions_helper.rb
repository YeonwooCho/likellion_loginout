module SessionsHelper
    def login(user)
        session[:user_id] = user.id
    end
    
    def current_user
    #    if @current_user.nil?
    #        @current_user = User.find_by(id: session[:user_id])
    #    else
    #        @current_user = @current_user
    #    end
        
        #@current_user = @current_user || User.find_by(id: session[:user_id])
        
        @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
