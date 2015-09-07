class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to( '/', notice: 'Welcome Administrator!')
    else
      redirect_to( '/login', alert: 'Incorrect Login. Please try again')
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to( '/', notice: 'Logged out successfully')
  end

end
