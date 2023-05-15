require './lib/node'

class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    if @head
      find_tail.next = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def count
    count = 0
    current_node = @head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end
  
end
