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

  xit 'plays each word in the list' do
    beat_box = BeatBox.new
    beat_box.append('deep doo ditt woo hoo shu')
    expect do
      beat_box.play
    end.to output("Playing deep...\ndeep played.\nPlaying doo...\ndoo played.\nPlaying ditt...\nditt played.\nPlaying woo...\nwoo played.\nPlaying hoo...\nhoo played.\nPlaying shu...\nshu played.\n").to_stdout
  end
  # Iteration 3 tests complete.

  # Iteration 4 tests begin.
  it 'checks for invalid beats on append' do
    bb = BeatBox.new
    expect { bb.append('invalid beat') }.to output("Invalid beat: invalid. Skipping.\n").to_stdout
    expect(bb.count).to eq(0)
  end

  it 'checks for invalid beats on prepend' do
    bb = BeatBox.new
    expect { bb.prepend('invalid beat') }.to output("Invalid beat: invalid. Skipping.\n").to_stdout
    expect(bb.count).to eq(0)
  end

  it 'checks append against the BEATS_LIST and returns all method as a string' do
    bb = BeatBox.new('deep')
    bb.append('Mississippi')

    expect(bb.all).to eq('deep')
  end

  it 'checks prepend against the BEATS_LIST and returns all method as a string' do
    bb = BeatBox.new('deep')
    bb.append('Mississippi')
    bb.prepend('tee tee tee Mississippi')

    expect(bb.all).to eq('tee tee tee deep')
  end
end
