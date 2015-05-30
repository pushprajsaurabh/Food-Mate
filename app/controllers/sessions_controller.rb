class SessionsController < ApplicationController

  before_filter :authorize, :except => [:create]

  def authorize
    session_token = params[:session_token] || session[:session_token]
    @user = User.find_by_session_token(session_token)
    @user_id = @user.id if @user.present?
    if !session_token || @user.blank?
      api_response(nil, "Empty or Wrong Session Token", 401)
    end
  end

  def new
  end

  def create
    user = User.find_by_phone(params[:phone])
    if user && user.authenticate(params[:password])
      session_token = user.id.to_s + SecureRandom.base64(64).gsub(/[$=+\/]/,65.+(rand(25)).chr)
      user.session_token = session_token
      session[:session_token] = session_token
      user.save
      api_response({ :session_token => session_token } , 'Logged in!!!', 200)
    else
      api_response(nil, "Invalid phone or password", 400)
    end
  end

  def destroy
    session[:session_token] = nil
    User.find(@user_id).update_attributes(:session_token => nil)
    api_response(nil, 'Logged out!!!', 200)
  end

  private 

  def api_response(payload, message, status)
      render :json => {
            :payload => payload,
            :message => message
        },:status => status
  end
end