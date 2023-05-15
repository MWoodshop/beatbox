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
end
