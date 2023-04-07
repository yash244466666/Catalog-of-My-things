require 'json'
require_relative 'item'

class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def self.file_path
    './data/labels.json'
  end

  def self.load_all
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    data = JSON.parse(file)
    data.map { |label_data| Label.new(*label_data.values) }
  end

  def self.save_all(labels)
    data = labels.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    File.write(file_path, JSON.pretty_generate(data))
  end
end
