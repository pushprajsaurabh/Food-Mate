class UsersController < SessionsController
  skip_before_filter :authorize, :only => :create

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      api_response(@user.id, 'Sign up successful', 200)
    else
      api_response(@user.errors, 'Sign up unsuccessful', 400)
    end
  end

  def user_matches
    friends = User.find(@user_id).friends.map do |x|
      x.to_user_hash
    end
    api_response(friends, 'Friends', 200)
  end

  private 

  def api_response (payload, message, status)
      render :json => {
            :payload => payload,
            :message => message
        },:status => status
  end


  def user_params
    params.permit(:phone, :password, :password_confirmation, :name, :photo, :twitter_handle)
  end

end