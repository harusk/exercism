class Attendee
  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  # Do not edit above methods, add your own methods below.

  def has_pass?
    if @pass_id == nil
      false
    else
      true
    end
  end

  def fits_ride?(ride_minimum_height)
    if @height >= ride_minimum_height
      true
    else
      false
    end
  end

  def allowed_to_ride?(ride_minimum_height)
    if self.has_pass? && self.fits_ride?(ride_minimum_height)
      true
    else
      false
    end
  end
end
