require 'json'
require_relative 'item'

class Genre
  attr_reader :id, :name, :items

  def initialize(id, name)
    @id = id
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
end
