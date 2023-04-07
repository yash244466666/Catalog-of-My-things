require_relative '../label'
require_relative '../item'

RSpec.describe Label do
  let(:label_id) { 1 }
  let(:label_title) { 'Label Title' }
  let(:label_color) { 'Label Color' }
  let(:item_publish_date) { '2021-01-01' }
  let(:item) { Item.new(item_publish_date) }
  subject(:label) { described_class.new(label_title, label_color) }

  describe '#initialize' do
    it 'creates a new label with the specified attributes' do
      expect(label.title).to eq(label_title)
      expect(label.color).to eq(label_color)
      expect(label.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds the specified item to the label' do
      label.add_item(item)
      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end
  end
end
