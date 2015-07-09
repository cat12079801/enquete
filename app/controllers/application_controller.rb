class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private def get_current_user
    if cookies[:guest_name].blank? or cookies[:session].blank? or Session.where(:user_id => User.find_by_name(cookies[:guest_name]).id, :sha256_cookie => Digest::SHA256.hexdigest(cookies[:session]), :finish => false).blank?
      redirect_to '/admin/sign_in'
    else
      @current_user = User.find_by_name(cookies[:guest_name])
    end
  end

  private def already_login?
    Session.where(:sha256_cookie => Digest::SHA256.hexdigest(cookies[:session]), :finish => false).present?
  end
end
