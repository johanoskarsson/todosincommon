class IntersectController < ApplicationController
  include FoursquareClientHelper

  def index
  end

  def intersect
    redirect_to '/' if current_user.nil?

    client = current_user_foursquare_client
    sq_other_user = client.user(id_param)
    sq_current_user = client.user("self")

    intersection = intersect_lists(
      fetch_list_items(client, "#{sq_current_user.id}/todos"),
      fetch_list_items(client, "#{sq_other_user.id}/todos")
    )

    @todos = intersection.sort
  end

  private

  def fetch_list_items(client, list_id)
    items = []
    limit = 200 # this is their maximum

    while true
      list_items = client.list(list_id, limit: limit, offset: items.size)["listItems"]

      return items if list_items["items"].empty?

      items.concat(list_items["items"])

      return items if list_items["items"].size < limit
    end
  end

  def intersect_lists(list1, list2)
    venues1 = extract_venues(list1)
    venues2 = extract_venues(list2)
    venues1.to_set.intersection(venues2.to_set)
  end

  def extract_venues(list)
    result = list.map do |item| 
      venue = item["venue"]
      if venue.nil?
        nil
      else
        id = venue["id"]
        location = venue["location"]
        location ||= {}
        photo = item["photo"]
        photo_url = photo.nil? ? nil : photo["prefix"] + "297x268" + photo["suffix"]
        Venue.new(
          id, 
          venue["name"], 
          photo_url, 
          "https://foursquare.com/v/#{id}",
          location["city"],
          location["distance"]
        )
      end
    end
    result.compact
  end

  def id_param
    params.required(:id)
  end

end
