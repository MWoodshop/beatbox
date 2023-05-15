require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  it 'Exists and can be initialized.' do
    list = LinkedList.new

    expect(list).to be_an_instance_of(LinkedList)
  end

  it 'list.head returns nil' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end

  it 'list.append returns "doop"' do
    list = LinkedList.new
    list.append('doop')

    expect(list.head.data).to eq('doop')
  end

  it 'list.head.next_node returns nil' do
    list = LinkedList.new
    list.append('doop')

    expect(list.head.next_node).to eq(nil)
  end

  it 'list.count returns 1' do
    list = LinkedList.new
    list.append('doop')

    expect(list.count).to eq(1)
  end

  it 'list.to_string returns "doop"' do
    list = LinkedList.new
    list.append('doop')

    expect(list.to_string).to eq('doop')
  end

  it 'list.head returns nil' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end

  it 'append doop and return head.next_node = nil' do
    list = LinkedList.new
    list.append('doop')

    expect(list.head.next_node).to eq(nil)
  end

  it 'append "deep", return it in data and return nil in next_node' do
    list = LinkedList.new
    list.append('deep')

    expect(list.head.data).to eq('deep')
    expect(list.head.next_node).to eq(nil)
  end
end
