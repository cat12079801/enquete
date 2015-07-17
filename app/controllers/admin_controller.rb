class AdminController < ApplicationController
  layout 'admin'

  before_action :get_current_user, :except => [:sign_in, :sign_create]
  before_action :already_login?, :only => [:sign_in, :sign_create]

  def sign_in
    if already_login?
      redirect_to :action => 'index'
    else
      render :layout => 'application'
    end
  end

  def sign_create
    redirect_to :action => 'index' if already_login?
    user = User.find_by_name(params[:sign_in][:name])
    if user.present? and user.password == Digest::SHA256.hexdigest(params[:sign_in][:password])
      create_session user
      redirect_to :action => 'index'
    else
      @name = params[:sign_in][:name]
      @pass = params[:sign_in][:password]
      render :action => 'sign_in'
    end
  end

  private def create_session user
    cookies[:guest_name] = user.name
    cookies[:session] = SecureRandom.hex(20)
    Session.create(:user_id => user.id, :sha256_cookie => Digest::SHA256.hexdigest(cookies[:session]), :remote_ip => request.remote_ip)
  end

  def sign_out
    Session.find_by_sha256_cookie(Digest::SHA256.hexdigest(cookies[:session])).update(:finish => true)
    redirect_to :action => 'sign_in'
  end

  def index
    @collects = Collect.all
  end
end
