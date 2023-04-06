require_relative '../author'

describe Author do
  context '#show_list' do
    it '#show_list: empty' do
      expect(Author.show_list).to eq(puts('No authors available'))
    end
  end

  context 'test author basic method' do
    before(:all) do
      @author = Author.new('Dicko', 'Allassane')
    end
    it '#initialize' do
      expect(@author.id).to be_kind_of Integer
      expect(@author.first_name).to eq 'Dicko'
      expect(@author.last_name).to eq 'Allassane'
    end

    it '#to_s' do
      expect(@author.to_s).to eq 'Dicko Allassane'
    end

    it 'Author.all' do
      expect(Author.all).to contain_exactly(@author)
      author2 = Author.new('Trast', 'trast00')
      expect(Author.all).to contain_exactly(@author, author2)
    end
  end

  context '#add_item' do
    before(:all) do
      @author = Author.new('Dicko', 'Allassane')
    end
    it 'empty list of item' do
      expect(@author.items).to eq []
    end
  end
end
