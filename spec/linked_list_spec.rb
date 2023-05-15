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

  it 'prepends "dop" and returns "dop"' do
    list = LinkedList.new
    list.prepend('dop')

    expect(list.head.data).to eq('dop')
  end

  it 'makes two appends then one prepend and returns to_string as "dop plop suu"' do
    list = LinkedList.new
    list.append('plop')
    list.append('suu')
    list.prepend('dop')

    expect(list.to_string).to eq('dop plop suu')
  end

  it 'makes two appends then one prepend and returns list.count as 3' do
    list = LinkedList.new
    list.append('plop')
    list.append('suu')
    list.prepend('dop')

    expect(list.count).to eq(3)
  end

  it 'list.insert(1, "woo") returns "woo"' do
    list = LinkedList.new
    list.append('plop')
    list.append('suu')
    list.prepend('dop')
    list.insert(1, 'woo')

    expect(list.head.data).to eq('dop')
    expect(list.head.next_node.data).to eq('woo')
    expect(list.head.next_node.next_node.data).to eq('plop')
    expect(list.head.next_node.next_node.next_node.data).to eq('suu')
  end

  it 'raises an error if the position is invalid' do
    list = LinkedList.new
    list.append('plop')
    list.append('suu')
    expect { list.insert(5, 'woo') }.to raise_error('Invalid position')
  end

  it 'tests to_string after two appends, one prepend, one insert' do
    list = LinkedList.new
    list.append('plop')
    list.append('suu')
    list.prepend('dop')
    list.insert(1, 'woo')

    expect(list.to_string).to eq('dop woo plop suu')
  end

  it 'makes several appends and tests find method' do
    list = LinkedList.new
    list.append('deep')
    list.append('woo')
    list.append('shi')
    list.append('shu')
    list.append('blop')

    expect(list.to_string).to eq('deep woo shi shu blop')
    expect(list.find(2, 1)).to eq('shi')
    expect(list.find(1, 3)).to eq('woo shi shu')
  end

  it 'makes several appends and tests includes? method' do
        list = LinkedList.new
    list.append('deep')
    list.append('woo')
    list.append('shi')
    list.append('shu')
    list.append('blop')

    expect(list.includes?('deep')).to eq(true)
    expect(list.includes?('dep')).to eq(false)
  end
end
