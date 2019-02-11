class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      self.take_turn
    end 
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !self.game_over
      self.round_success_message
      self.sequence_length += 1
    end 
  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence
    i = 0 
    puts "what color is first?"
    answer = gets.chomp

    if answer != self.seq.first 
      self.game_over = true 
      self.game_over_message
      self.reset_game
    end 
    i += 1

    while i < self.sequence_length
      puts "what color is next?"
      answer = gets.chomp

      if answer != self.seq[i]
        self.game_over = true 
        self.game_over_message
        self.reset_game
      else  
        self.round_success_message
        i += 1
      end 
    end 
  end

  def add_random_color
    self.seq << COLORS.sample 
  end

  def round_success_message
    puts "this round was a success!"
  end

  def game_over_message
    puts "game over!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false 
    self.seq = []
  end
end
