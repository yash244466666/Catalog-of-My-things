require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def show_options
    puts "\nSelect an option from the following:"
    puts '1- List all books'
    puts '2- List all music albums'
    puts '3- List of games'
    puts '4- List all genres'
    puts '5- List all labels'
    puts '6- List all authors'
    puts '7- Add a book'
    puts '8- Add a music album'
    puts '9- Add a game'
    puts '10- Exit'
  end

  def run
    loop do
      show_options
      option = gets.chomp
      case option
      when '1'
        @app.list_books
      when '2'
        @app.list_all_music_albums
      when '3'
        @app.list_games
      when '4'
        @app.list_all_genres
      when '5'
        @app.list_labels
      when '6'
        @app.list_authors
      when '7'
        @app.add_book
      when '8'
        @app.add_music_album
      when '9'
        @app.add_game
      when '10'
        @app.close_app
        exit
      end
    end
  end
end

Main.new.run
