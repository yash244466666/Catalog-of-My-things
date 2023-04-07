require_relative 'label'
require_relative 'book'
require_relative 'game'
require_relative 'author'
require_relative 'music_album'
require_relative 'genre'

class App
  def initialize
    @labels = []
    @books = []
    @genres = []
    @music_albums = []
    @games = []
    @authors = []
  end

  def list_books
    puts
    puts 'Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher},
      Cover State: #{book.cover_state}, Published: #{book.publish_date},
      Archived: #{book.archived || (book.cover_state == 'bad')}"
    end
    puts
  end

  def list_labels
    puts
    puts 'Labels:'
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
      puts 'Items:'
      label.items.each do |item|
        puts "#{item.class}: #{item.title}"
      end
    end
    puts
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts 'Enter cover state (good/bad):'
    cover_state = gets.chomp.downcase == 'bad'
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter author:'
    author = gets.chomp
    puts 'Enter label title:'
    label_title = gets.chomp
    puts 'Enter label color:'
    label_color = gets.chomp
    book = Book.new(title, publish_date, publisher, cover_state)
    book.add_author(author)
    @books << book
    label = add_label(label_title, label_color)
    label.add_item(book)
    book
  end

  def add_label(title, color)
    label = Label.new(title, color)
    @labels << label
    label
  end

  def list_games
    Game.show_list
  end

  def list_authors
    Author.show_list
  end

  def add_game
    Game.create
  end

  def add_genre(name)
    genre = Genre.new(name)
    @genres << genre
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

    music_album = MusicAlbum.new(title, on_spotify, publish_date)
    music_album.add_genre(genre_name)
    add_genre(genre_name)
    @music_albums << music_album
    music_album
  end

  def list_all_genres
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
      puts 'There are no music albums yet.'
    else
      puts 'All music albums:'
      @music_albums.each do |music_album|
        puts "Title: #{music_album.title}, Spotify: #{music_album.on_spotify},
        Published: #{music_album.publish_date}, Archived: #{music_album.archived}"
      end
    end
  end

  def exit
    @labels.save_all
    @books.save_all
    @genres.save_all
    @music_albums.save_all
    @games.save_all
    @authors.save_all
    puts 'Thanks for using the app!'
  end
end
