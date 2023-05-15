require './lib/node'

RSpec.describe Node do
  it 'Exists and can be initialized.' do
    node = Node.new('plop')

    expect(node).to be_an_instance_of(Node)
  end


end
