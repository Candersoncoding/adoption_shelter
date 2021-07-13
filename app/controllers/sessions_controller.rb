class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to :back
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end
  def login
    
    if @user = User.find_by_email(user_params[:email]).try(:authenticate, user_params[:password])
      session[:user_id] = @user.id
      redirect_to "/pets"
    else 
      flash[:login_errors] = ["Oh no, you suck at logging in. Try again. Don't suck this time."]
      redirect_to '/'
    end
  end
  def destroy
    reset_session
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
