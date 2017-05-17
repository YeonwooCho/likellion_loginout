class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    user = User.find_by(nickname: params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to contents_path
      
    else
      flash[:alert] = '아이디나 비밀번호가 잘못되었습니다.'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    
    redirect_to contents_path
  end
end
