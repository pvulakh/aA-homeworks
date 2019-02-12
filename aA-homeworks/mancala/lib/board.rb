require 'byebug' 

class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1 
    @name2 = name2
    @cups = Array.new(14) {[]}

    self.cups.each_with_index do |cup, idx|
      if idx != 6 && idx != 13
        self.place_stones(cup)
      end 
    end 
  end

  def place_stones(cup)
    # helper method to #initialize every non-store cup with four stones each
     4.times { cup << :stone }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13
    raise "Starting cup is empty" if self.cups[start_pos].empty?
    true 
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      start_pos -= 1 if (1..6).include?(start_pos)
    end

    next_pos = start_pos
    until self.cups[start_pos].empty? 
      if current_player_name == name1 && next_pos == 13 
        next_pos = 0 
      elsif current_player_name == name2 && next_pos == 6
        next_pos = 7 
      end 

      next_pos %= 14
      self.cups[next_pos] << self.cups[start_pos].pop 
      next_pos += 1
    end 

    self.render
    ending_cup_idx = next_pos - 1

    if current_player_name == name1 && ending_cup_idx == 6
      :prompt 
    elsif current_player_name == name2 && ending_cup_idx == 13
      :prompt 
    else 
      self.next_turn(ending_cup_idx)
    end
  end

  def next_turn(ending_cup_idx)
    if self.cups[ending_cup_idx].count == 1 
      :switch 
    else  
      ending_cup_idx
    end 
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    first = (0..5).all? { |idx| self.cups[idx].empty? }
    second = (7..12).all? { |idx| self.cups[idx].empty? }
    first || second
  end

  def winner
    p1_score = self.cups[6].count
    p2_score = self.cups[13].count

    if p1_score > p2_score 
      self.name1 
    elsif p2_score > p1_score 
      self.name2 
    else  
      :draw 
    end
  end
end
