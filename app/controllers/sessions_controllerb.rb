class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(
      auth_hash: auth_hash["credentials"]["token"],
      email: auth_hash["info"]["email"],
      foursquare_id: auth_hash["uid"]
    )
    session[:user_id] = @user.id
    redirect_to '/find'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end