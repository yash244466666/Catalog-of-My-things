require_relative 'item'

class Genre
  attr_reader :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end
end
