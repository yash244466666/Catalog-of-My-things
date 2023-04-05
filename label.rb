require 'json'
require_relative 'item'

class Label
  attr_reader :id, :title, :color, :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def self.save_all(labels)
    data = labels.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color,
        item_ids: label.items.map(&:id)
      }
    end
    File.write('./data/labels.json', JSON.pretty_generate(data))
  end
end
