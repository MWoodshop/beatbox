require './lib/node'

class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def insert(position, data)
    new_node = Node.new(data)
    if position == 0
      new_node.next_node = @head
      @head = new_node
    else
      current_node = @head
      (position - 1).times do
        current_node = current_node.next_node
        raise 'Invalid position' if current_node.nil?
      end
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end

  def find(start_index, n)
    current_node = @head
    index = 0

    # Traverse the list until we reach the start index
    while index < start_index && !current_node.nil?
      current_node = current_node.next_node
      index += 1
    end

    unless current_node.nil?
      result = []
      # Traverse n nodes and collect the data values
      while n > 0 && !current_node.nil?
        result << current_node.data
        current_node = current_node.next_node
        n -= 1
      end
      return result.join(' ')
    end

    nil
  end

  def includes?(data)
    current_node = @head
    until current_node.nil?
      return true if current_node.data == data

      current_node = current_node.next_node
    end
    false
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      result = @head.data
      @head = nil
      return result
    end
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.next_node.nil?
    result = current_node.next_node.data
    current_node.next_node = nil
    result
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

  def to_string
    current_node = @head
    str = ''
    until current_node.nil?
      str += current_node.data + ' '
      current_node = current_node.next_node
    end
    str.strip
  end
end
