class Friend
  attr_accessor :id, :name, :photo_url

  def initialize(id, name, photo_url)
    @id = id
    @name = name
    @photo_url = photo_url
  end

  def eql?(other)
    id == other.id
  end

  def hash
    id.hash
  end

  def <=>(other)
    self.name.downcase <=> other.name.downcase
  end

  def to_s
    "#{@id}: #{@name} - #{@photo_url}"
  end
end