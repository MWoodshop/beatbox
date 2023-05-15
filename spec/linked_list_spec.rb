require './lib/linked_list'
require './lib/node'

# Iteration 1 starts here
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
    list.append('doop')
    list.append('deep')

    expect(list.head.next_node.data).to eq('deep')
    expect(list.head.next_node.next_node).to eq(nil)
  end

  it 'list.count now returns 2' do
    list = LinkedList.new
    list.append('doop')
    list.append('deep')

    expect(list.count).to eq(2)
  end
end
# Iteration 1 ends here

# Iteration 2 starts here
RSpec.describe LinkedList do
  it 'creates a list, appends plop, to_string returns plop' do
    list = LinkedList.new
    list.append('plop')

    expect(list.to_string).to eq('plop')
  end

end
