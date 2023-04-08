require_relative '../genre'
require_relative '../music_album'

describe Genre do
  before :each do
    @genre = Genre.new('Rock')
  end

  describe '#new' do
    it 'takes one parameters and returns a Genre object' do
      expect(@genre).to be_an_instance_of Genre
    end
  end

  describe '#name' do
    it 'returns the correct genre name' do
      expect(@genre.name).to eql 'Rock'
    end
  end

  describe '#add_item' do
    let(:title) { 'War' }
    let(:on_spotify) { true }
    let(:publish_date) { '2010-01-01' }
    let(:genre) { 'rnb' }
    let(:music_album) { MusicAlbum.new(title, on_spotify, genre, publish_date) }

    it 'Adds an item to the genre item array' do
      @genre.add_item(music_album)
      expect(@genre.items).to include(music_album)
    end

    it 'Sets the item genre to the genre' do
      @genre.add_item(music_album)
      expect(music_album.genre).to eq(@genre)
    end
  end
end
