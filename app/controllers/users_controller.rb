class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      #회원가입이 성공했을 때
      redirect_to contents_path
      login(@user)
    else
      #회원가입이 실패했을 때
      render 'new'
    end
 
  end
  
  def edit
    current_user.add_role :admin
    redirect_to contents_path
  end
  
  def edit_mod
    current_user.add_role :moder
    redirect_to contents_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :nickname, :name, :password, :password_confirmation)
  end
end


  