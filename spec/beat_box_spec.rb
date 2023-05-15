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

  it 'append "deep doo ditt" and return "deep" on list.head.data and "doo" on list.head.next_node.data' do
    bb = BeatBox.new
    bb.append('deep doo ditt')

    expect(bb.list.head.data).to eq('deep')
  end
end
