require './lib/beat_box'
require './lib/linked_list'
require './lib/node'

# Iteration 3 begins here
RSpec.describe BeatBox do
  it 'Exists and can be initialized.' do
    bb = BeatBox.new

    expect(bb).to be_an_instance_of(BeatBox)
  end

  it 'create a linked list on beat_box' do
    bb = BeatBox.new

    expect(bb.list.head).to eq(nil)
  end

  it 'append a string and test append method' do
    bb = BeatBox.new
    bb.append('deep doo ditt')

    expect(bb.list.head.data).to eq('deep')
    expect(bb.list.head.next_node.data).to eq('doo')
  end

  it 'append a string and test count method' do
    bb = BeatBox.new
    bb.append('deep doo ditt')
    bb.append('woo hoo shu')

    expect(bb.count).to eq(6)
  end

  it 'append and string and tests count and list.count' do
    bb = BeatBox.new
    bb.append('deep doo ditt woo hoo shu')

    expect(bb.count).to eq(6)
    expect(bb.list.count).to eq(6)
  end
end
