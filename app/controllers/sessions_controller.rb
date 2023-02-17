class SessionsController < ApplicationController
  
  def new
    @gossip = Gossip.new
    @user = current_user # vérifier que current_user est initialisée
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end
  
  
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end