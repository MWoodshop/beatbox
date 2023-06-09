require './lib/node'
require './lib/linked_list'

class BeatBox
  attr_reader :list
  attr_accessor :rate, :voice

  BEATS_LIST = %w[deep dop doo ditt woo hoo shu tee dee bop la na]

  DEFAULT_RATE = 500
  # Using Samantha instead of Boing as my version of OSX doesn't have Boing.
  DEFAULT_VOICE = 'Samantha'

  def initialize(starting_word = nil)
    @list = LinkedList.new
    append(starting_word) if starting_word
    @rate = DEFAULT_RATE
    @voice = DEFAULT_VOICE
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
    words.each do |word|
      if BEATS_LIST.include?(word)
        @list.prepend(word)
      else
        puts "Invalid beat: #{word}. Skipping."
        return
      end
    end
  end

  def count
    @list.count
  end

  def reset_voice
    self.voice = DEFAULT_VOICE
  end

  def reset_rate
    self.rate = DEFAULT_RATE
  end

  def play
    output = ''
    current_node = @list.head
    until current_node.nil?
      output += "Playing #{current_node.data}...\n"
      system("say -r #{rate} -v #{voice} #{current_node.data}")
      output += "#{current_node.data} played.\n"
      current_node = current_node.next_node
    end
    output
  end

  def all
    @list.to_string
  end
end
