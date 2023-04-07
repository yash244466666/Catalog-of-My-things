require 'rspec'
require_relative '../book'
require 'date'

describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:publish_date) { '1925-04-10' }
  let(:publisher) { "Charles Scribner's Sons" }
  let(:cover_state) { 'good' }
  subject(:book) { described_class.new(title, publish_date, publisher, cover_state) }

  describe '#initialize' do
    it 'sets the title' do
      expect(book.title).to eq(title)
    end

    it 'sets the publish date' do
      expect(book.publish_date).to eq((publish_date))
    end

    it 'sets the publisher' do
      expect(book.publisher).to eq(publisher)
    end

    it 'sets the cover state' do
      expect(book.cover_state).to eq(cover_state)
    end
  end

  describe '#add_author' do
    it 'adds an author to the book' do
      author = 'F. Scott Fitzgerald'
      book.add_author(author)
      expect(book.author).to include(author)
    end
  end

  describe '#archived?' do
    context 'when the book is archived' do
      before { book.move_to_archive }

      it 'returns true' do
        expect(book.archived).to be(true)
      end
    end

    context 'when the cover state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        book.move_to_archive
        expect(book.archived).to be(true)
      end
    end

    context 'when the book is not archived and the cover state is good' do
      it 'returns false' do
        expect(book.archived).to be(false)
      end
    end
  end
end
