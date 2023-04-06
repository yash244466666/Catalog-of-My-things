require 'json'
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

  def self.file_path
    './data/music_albums.json'
  end

  def self.save_all(music_albums)
    data = music_albums.map do |album|
      {
        on_spotify: album.on_spotify,
        genre: album.genre,
        publish_date: album.publish_date,
        source: album.source,
        label: album.label
      }
    end
    File.write(file_path, JSON.pretty_generate(data))
  end
end
