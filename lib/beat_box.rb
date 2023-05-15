require './lib/node'
require './lib/linked_list'

class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    words = data.split(' ')
    words.each do |word|
      @list.append(word)
    end
  end

  def count
    @list.count
  end

  def play
    current_node = @list.head
    until current_node.nil?
      `say -r 500 -v Samantha #{current_node.data}`
      current_node = current_node.next_node
    end
  end
end
