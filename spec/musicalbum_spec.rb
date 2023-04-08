require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('title', true, 'rnb', '2010-01-01')
  end

  describe '#new' do
    it 'takes three parameters and returns a MusicAlbum object' do
      expect(@music_album).to be_an_instance_of MusicAlbum
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@music_album.title).to eql 'title'
    end
  end

  describe '#on_spotify' do
    it 'returns the correct on_spotify' do
      expect(@music_album.on_spotify).to eql true
    end
  end

  describe '#publish_date' do
    it 'returns the correct publish_date' do
      expect(@music_album.publish_date).to eql '2010-01-01'
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if on_spotify is true and publish date < 10 years' do
      @music_album.move_to_archive
      expect(@music_album.archived).to be true
    end

    it 'returns false if on_spotify is false' do
      @music_album.on_spotify = false
      @music_album.move_to_archive
      expect(@music_album.archived).to be false
    end

    it 'returns false if publish_date is < 10 years' do
      @music_album.publish_date = '2020-01-01'
      @music_album.move_to_archive
      expect(@music_album.archived).to be false
    end
  end
end
