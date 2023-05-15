require './lib/node'
require './lib/linked_list'

class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end
end
