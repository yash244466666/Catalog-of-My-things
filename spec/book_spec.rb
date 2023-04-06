require 'rspec'
require_relative '../book'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '2022-01-01', 'good') }

  describe '#can_be_archived?' do
    context 'when the book is older than 10 years' do
      let(:book) { Book.new('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '2010-01-01', 'good') }

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the book is less than 10 years old' do
      it 'returns false' do
        expect(book.can_be_archived?).to be false
      end
    end

    context 'when the book has a bad cover state' do
      let(:book) { Book.new('To Kill a Mockingbird', 'Harper Lee', 'Fiction', '2000-01-01', 'bad') }

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end
  end
end
