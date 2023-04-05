require 'json'
require 'date'
require_relative 'item'

class Book < Item
  attr_reader :title, :author, :genre, :cover_state

  def initialize(title, author, genre, publish_date, cover_state)
    super(publish_date)
    @title = title
    @author = author
    @genre = genre
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
  
  def self.save_all(books)
    data = books.map do |book|
      {
        title: book.title,
        author: book.author,
        genre: book.genre,
        publish_date: book.publish_date,
        cover_state: book.cover_state
      }
    end
    File.write('./data/books.json', JSON.pretty_generate(data))
  end
end
