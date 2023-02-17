class ApplicationController < ActionController::Base
before_action :set_current_user
helper_method :current_user
before_action :authenticate_user! # Vérifier que l'utilisateur est connecté
before_action :set_current_user
protect_from_forgery with: :exception

  def set_current_user
    if session[:user_id]
      Current.user = User.find(session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authenticate_user!
    redirect_to new_session_path, alert: "Vous devez vous connecter pour accéder à cette page." unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

end
