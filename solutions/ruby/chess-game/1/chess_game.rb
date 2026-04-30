module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    return true if RANKS === rank && FILES === file
    return false
  end

  def self.nick_name(first_name, last_name)
    return first_name[...2].upcase + last_name[last_name.size-2..].upcase
  end

  def self.move_message(first_name, last_name, square)
    file = square[...1]
    rank = square[1...]
    nickname = self.nick_name(first_name,last_name)
    valid_move = self.valid_square?(rank.to_i, file)
    return "#{nickname} moved to #{square}" if valid_move == true
    return "#{nickname} attempted to move to #{square}, but that is not a valid square" if valid_move == false
  end
end
