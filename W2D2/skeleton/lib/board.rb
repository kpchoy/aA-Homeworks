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

    current_idx = start_pos

    until stones.empty?
      current_idx += 1
      current_idx = 0 if current_idx > 13

      if current_idx == 6
        self.cups[6] << stones.pop if current_player_name == @name1
      elsif current_idx == 13
        self.cups[13] << stones.pop if current_player_name == @name2
      else
        self.cups[current_idx] << stones.pop
      end
    end

    render
    next_turn(current_idx)


  end

  def next_turn(ending_cup_idx)

    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
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
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups.drop(6).all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end 
  end
end
