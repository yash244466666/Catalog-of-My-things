require 'json'
require './item'
class Game < Item
  attr_reader :id
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, id = rand(0..100))
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @id = id
  end

  def to_s
    "[Game][author: #{author}] multiplayer: #{@multiplayer} last_played_at: #{last_played_at}"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.show_list
    return puts 'No game available' if all.empty?

    all.each_with_index do |game, index|
      puts "#{index}] #{game}"
    end
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end
end
