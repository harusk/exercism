class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    message_index = @line.index(']:') + 2
    message = @line[message_index, @line.size]
    message.strip.chomp
  end

  def log_level
    level_end_index = @line.index(']:')
    level = @line[0, level_end_index]
    level.gsub(/[\[\]]/,'').downcase
  end

  def reformat
    "#{message()} (#{log_level()})"
  end
end
