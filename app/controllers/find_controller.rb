class FindController < ApplicationController
  include FoursquareClientHelper

  def index
    result = current_user_foursquare_client.user_friends(current_user.foursquare_id)
    @friends = result["items"].map do |friend|
      Friend.new(
        friend["id"],
        "#{friend['firstName']}  #{friend['lastName']}",
        "#{friend['photo']['prefix']}40x40#{friend['photo']['suffix']}"
      )
    end
    @friends.sort!
  end

  def email_param
    params.required(:email)
  end

end
