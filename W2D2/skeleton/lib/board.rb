class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |el, idx|
      if idx == 6 || idx == 13
        next
      else
        4.times {el << :stone}

      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless (0...14).include?(start_pos)
      raise "Invalid starting cup"
    end
    if self.cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = self.cups[start_pos]
    self.cups[start_pos] = []
    stones.each_with_index do |stone, idx|
      next if (idx + 1 + start_pos) > 13
      self.cups[idx+start_pos+1] << stone
    end
    p self.cups[13]
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
