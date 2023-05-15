require './lib/node'

class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head
      find_tail.next = Node.new(data)
    else
      @head = Node.new(data)
    end
  end
end
