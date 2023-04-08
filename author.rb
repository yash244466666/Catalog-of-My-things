require 'json'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name)
    @id = rand(0..100)
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
    load_all
    return puts 'No authors available' if all.empty?

    all.each_with_index do |author, index|
      puts "#{index}] #{author}" # .first_name} #{author.last_name}"
    end
  end

  def self.file_path
    './data/authors.json'
  end

  def self.save_all
    list = []
    all.each do |author|
      list << { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end
    File.write(file_path, JSON.pretty_generate(list))
  end

  def self.load_all
    return false unless File.exist?(file_path)
    return false if File.empty?(file_path)

    list_authors = JSON.parse(File.read(file_path))
    list_authors.each do |author|
      new(author['first_name'], author['last_name']).instance_variable_set(:@id, author['id'])
    end
  end
end
