class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #いいね機能の実装②
  #before_action :default_request_format

  #before_action :default_request_locale



  protected
  
  #オーバーライドとなり、deviseのメソッドが活用できないため、削除
  #def current_user
  #  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  #end

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  def ensure_current_user
    
    if current_user.id == params[:id].to_i
      redirect_to combos_url, notice: "権限がありません"
    end
  end
 
  #いいね機能の実装②
  # def default_request_format
  #   request.format = :html if request.format == '*/*;'
  # end
  # def default_request_locale
  #   request.locale = :js if request.format == '*ja*;'
  # end
end
