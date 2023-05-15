require './lib/linked_list'
require './lib/node'

RSpec.describe Node do
  it 'Exists and can be initialized.' do
    list = LinkedList.new

    expect(list).to be_an_instance_of(LinkedList)
  end

  it 'list.head returns nil' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end
end
