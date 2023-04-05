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
end
