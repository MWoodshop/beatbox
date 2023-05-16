require './lib/node'
require './lib/linked_list'

class BeatBox
  attr_reader :list

  BEATS_LIST = %w[deep doo ditt woo hoo shu tee dee bop la na]

  def initialize(starting_word = nil)
    @list = LinkedList.new
    append(starting_word) if starting_word
  end

  def append(data)
    return if data.nil?

    words = data.split(' ')
    words.each do |word|
      if BEATS_LIST.include?(word)
        @list.append(word)
      else
        puts "Invalid beat: #{word}. Skipping."
        return
      end
    end
  end

  def prepend(data)
    return if data.nil?

    words = data.split(' ')
    invalid_words = []
    words.reverse.each do |word|
      if BEATS_LIST.include?(word)
        @list.prepend(word)
      else
        invalid_words << word
      end
    end

    return unless invalid_words.any?

    puts "Invalid beats: #{invalid_words.join(', ')}. Skipping."
  end

  def count
    @list.count
  end

  def play
    output = ''
    current_node = @list.head
    until current_node.nil?
      output += "Playing #{current_node.data}...\n"
      system("say -r 500 -v Samantha #{current_node.data}")
      output += "#{current_node.data} played.\n"
      current_node = current_node.next_node
    end
    puts output # for debugging purposes
    output
  end

  def all
    @list.to_string
  end
end
