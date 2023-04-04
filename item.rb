require 'date'
class Item
  attr_reader :genre, :author, :source, :label, :id, :archived
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = rand(1..100)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end
end
