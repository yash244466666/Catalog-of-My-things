require_relative 'label'
require_relative 'book'
require_relative 'game'
require_relative 'author'
require_relative 'music_album'
require_relative 'genre'

class App
  attr_reader :labels, :books, :genres, :music_albums

  def initialize
    @labels = []
    Label.load_all
    @books = []
    Book.load_all
    @genres = []
    Genre.load_all
    @music_albums = []
    MusicAlbum.load_all
    @games = []
    @authors = []
  end

  def list_books
    if @books.empty?
    @books = Book.load_all
    end
    if @books.empty?
      puts 'books not found'
    else
      puts 'List Books:'
      @books.each do |book|
        puts
        puts "Title: #{book.title}, Publisher: #{book.publisher}, " \
             "Published: #{book.publish_date}, " \
             "Cover_State: #{book.cover_state}, " \
             "Archived: #{book.archived || (book.cover_state == 'bad')}"
      end
    end
  end

  def list_labels
      if @labels.empty?
    @labels = Label.load_all
    end
    if @labels.empty?
      puts 'labels not found'
    else
      puts 'List Labels:'
      @labels.each do |label|
        puts "Title: #{label.title}, " \
             "Color: #{label.color}"
      end
    end
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts 'Enter cover state (good/bad):'
    cover_state = gets.chomp.downcase == 'bad' ? 'bad' : 'good'
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter author:'
    author = gets.chomp
    book = Book.new(title, publisher, publish_date, cover_state)
    book.add_author(author)
    @books << book
    puts 'Book added successfully'
    # @books = Book.load_all
    return book
  end

  def add_label
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title, color)
    @labels = Label.load_all
    @labels.push(label)
    puts 'Label added successfully'
    label
  end

  def list_games
    Game.show_list
  end

  def list_authors
    Author.show_list
  end

  def select_author
    puts "\nSelect the author information"
    puts 'First Name: '
    first_name = gets.chomp.to_s
    puts 'Last Name: '
    last_name = gets.chomp.to_s
    Author.new(first_name, last_name)
  end

  def multiplayer_status
    puts 'Multiplayer? (Y/N): '
    multiplayer = gets.chomp
    if %w[Y y].include?(multiplayer)
      true
    elsif %w[N n].include?(multiplayer)
      false
    else
      puts "Invalid value detected: #{mutliplayer}"
    end
  end

  def add_game
    author = select_author
    puts 'Publish Date: '
    publish_date = gets.chomp
    puts 'Select lable '
    label = add_label
    is_multiplayer = multiplayer_status
    puts 'Date last played: '
    last_played = gets.chomp
    new_game = Game.new(publish_date, is_multiplayer, last_played)
    new_game.add_label(label)
    new_game.add_author(author)
    @games = Game.load_all
    @games.push(new_game)
    puts 'Game and Author created succcessfully!'
    new_game
  end

  def add_genre(name)
    genre = Genre.new(name)
    @genres = Genre.load_all
    @genres.push(genre)
    genre
  end

  def add_music_album
    puts 'Enter music album title:'
    title = gets.chomp
    puts 'Enter music album spotify status (true/false):'
    on_spotify = gets.chomp.downcase == 'true'
    puts 'Enter music album publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter music album genre name:'
    genre_name = gets.chomp
    genre = @genres.find { |g| g.name == genre_name }
    if genre.nil?
      genre = Genre.new(genre_name)
      @genres << genre
      Genre.save_all(@genres)
    end
    music_album = MusicAlbum.new(title, on_spotify, genre_name, publish_date)
    @music_albums = MusicAlbum.load_all
    @music_albums << music_album
    puts 'Added music album successfully'
    music_album
  end

  def list_all_genres
    if @genres.empty?
      @genres = Genre.load_all
    end
    if @genres.empty?
      puts 'There are no genres yet.'
    else
      puts 'All genres:'
      @genres.each do |genre|
        puts "Genre: #{genre.name}"
      end
    end
  end

  def list_all_music_albums
    if @music_albums.empty?
      @music_albums = MusicAlbum.load_all
    end
    if @music_albums.empty?
      puts 'There are no music albums yet.'
    else
      puts 'All music albums:'
      @music_albums.each do |music_album|
        puts "Title: #{music_album.title}, " \
             "Spotify: #{music_album.on_spotify}, " \
             "Genre: #{music_album.genre}, " \
             "Published: #{music_album.publish_date}, " \
             "Archived: #{music_album.archived}"
      end
    end
  end

  def close_app
    Book.save_all(@books)
    Author.save_all
    Game.save_all
    Label.save_all(@labels)
    MusicAlbum.save_all(@music_albums)
    puts 'Thanks for using the app!'
  end
end
