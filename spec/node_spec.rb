require './lib/node'

RSpec.describe Node do
  it 'Exists and can be initialized.' do
    node = Node.new('plop')

    expect(node).to be_an_instance_of(Node)
  end

  it 'Returns "plop" on node.data' do
    node = Node.new('plop')

    expect(node.data).to eq('plop')
  end

  it 'Returns nil on next_node' do
    node = Node.new('plop')
    expect(node.next_node).to eq(nil)
  end
end
