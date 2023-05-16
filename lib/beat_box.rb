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
    output = ''
    current_node = @list.head
    until current_node.nil?
      output += "Playing #{current_node.data}...\n"
      system("say #{current_node.data}")
      output += "#{current_node.data} played.\n"
      current_node = current_node.next_node
    end
    puts output # for debugging purposes
    output
  end
end
