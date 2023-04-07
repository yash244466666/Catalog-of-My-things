require 'json'
require_relative 'item'

class Genre
  attr_reader :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def self.file_path
    './data/genres.json'
  end

  def self.load_all
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    data = JSON.parse(file)
    data.map { |genre_data| Genre.new(*genre_data.values) }
  end

  def self.save_all(genres)
    data = genres.map do |genre|
      {
        id: genre.id,
        name: genre.name
      }
    end
    File.write(file_path, JSON.pretty_generate(data))
  end
end
