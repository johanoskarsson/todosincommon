class Venue
  attr_accessor :id, :name, :photo_url, :url, :city, :distance

  def initialize(id, name, photo_url, url, city, distance)
    @id = id
    @name = name
    @photo_url = photo_url
    @url = url
    @city = city
    @distance = distance
  end

  def eql?(other)
    id == other.id
  end

  def <=>(other)
    # distance doesn't seem to be present unfortunately
    unless @distance.nil?
      return @distance <=> other.distance
    end
    unless @name.nil?
      return @name <=> other.name
    end
    return @id <=> other.id
  end

  def hash
    id.hash
  end

  def to_s
    "#{@id}: #{@name} - #{@photo_url} - #{@url}"
  end
end