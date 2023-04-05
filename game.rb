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

  def self.save_all
    return false unless File.exist?('./data/game.json')

    list = []
    all.each do |game|
      # how to save the authors, the labels, the genre etc...
      data = { id: game.id, author_id: game.author.id,
               # source_id: @source&.id, label_id: @label&.id, genre_id: @genre.id,
               multiplayer: game.multiplayer, last_played_at: game.last_played_at }
      list << data
    end
    File.write('./data/game.json', JSON.pretty_generate(list))
    true
  end

  def self.load_all
    return false unless File.exist?('./data/game.json')
    return false if File.empty?('./data/game.json')

    list = JSON.parse(File.read('./data/game.json'))
    list.each do |data|
      game = new(data['publish_date'], data['multiplayer'], data['last_played_at'], data['id'])

      # add authors
      game_author = Author.all.find { |author| author.id == data['author_id'] }
      game_author&.add_item(game)
      game&.add_author(game_author)

      # todo
      # add label
      # add source
      # add genre
    end
  end
end
