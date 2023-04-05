require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify, :genre, :source, :label

  def initialize(on_spotify, genre, publish_date, source, label)
    super(publish_date)
    @on_spotify = on_spotify
    @genre = genre
    @source = source
    @label = label
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end
end
