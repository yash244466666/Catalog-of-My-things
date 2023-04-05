require 'json'
class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name, id = rand(0..100))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_s
    "#{@first_name} #{last_name}"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.show_list
    return puts 'No authors available' if all.empty?

    all.each_with_index do |author, index|
      puts "#{index}] #{author}" # {author.first_name} #{author.last_name}"
    end
  end
end
