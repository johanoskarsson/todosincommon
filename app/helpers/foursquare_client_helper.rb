module FoursquareClientHelper

  def foursquare_client(oauth_token)
    client = Foursquare2::Client.new(
      :api_version => '20160912',
      :oauth_token => oauth_token
    )
  end

  def current_user_foursquare_client
    foursquare_client(current_user.auth_hash)
  end

end