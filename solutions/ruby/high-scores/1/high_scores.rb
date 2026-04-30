class HighScores
  attr_reader :scores # adds scoroes
  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    return @scores.sort.reverse if @scores.size < 3
    top_three = Array.new()
    scores = @scores.uniq.size > 3 ? @scores.uniq : @scores
    until top_three.size == 3
      top_three.push(scores.max)
      index = scores.index(scores.max)
      scores.delete_at(index)
    end
    top_three
  end

  def latest_is_personal_best?
    latest() == personal_best()
  end
end

=begin
Your task is to write methods that return the highest score from the list, the last added score and the three highest scores.
=end