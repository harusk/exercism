class AssemblyLine
  RATE_PER_HOUR = 221
  MINUTES = 60
  def initialize(speed)
    @speed = speed
    @success_rate = success_rate
  end

  def production_rate_per_hour
    @speed * RATE_PER_HOUR * @success_rate
  end

  def working_items_per_minute
    (self.production_rate_per_hour/MINUTES).to_i
  end

  private
  def success_rate
    if @speed <= 4 && @speed >= 1
      1
    elsif @speed >= 5 && @speed <= 8
      0.9
    elsif @speed == 9
      0.8
    elsif @speed >= 10
      0.77
    end
  end
end
