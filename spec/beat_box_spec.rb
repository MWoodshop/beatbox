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

  xit 'plays the audio of the beats' do
    beat_box = BeatBox.new
    beat_box.append('deep doo ditt woo hoo shu')
    beat_box.play

    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} deep").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} doo").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} ditt").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} woo").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} hoo").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} shu").once
    beat_box.play
  end

  xit 'plays audio with multiple conditions on BeatBox' do
    beat_box = BeatBox.new('deep dop dop deep')
    beat_box.play

    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} deep").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} dop").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} dop").once
    expect(beat_box).to receive(:system).with("say -r #{beat_box.rate} -v #{beat_box.voice} deep").once
    beat_box.play
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

  xit 'plays the beats at the expected rate' do
    bb = BeatBox.new('deep dop dop deep')
    bb.rate = 100 # Set the rate to 100
    bb.play

    expect(bb).to receive(:system).with("say -r #{bb.rate} -v #{bb.voice} deep").once
    expect(bb).to receive(:system).with("say -r #{bb.rate} -v #{bb.voice} dop").once
    expect(bb).to receive(:system).with("say -r #{bb.rate} -v #{bb.voice} dop").once
    expect(bb).to receive(:system).with("say -r #{bb.rate} -v #{bb.voice} deep").once

    bb.play
  end
end
