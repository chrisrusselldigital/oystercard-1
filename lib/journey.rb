class Journey
  MINIMUM_CHARGE = 3
  attr_reader :entry_station, :exit_station

  def complete?
    true
  end

  def fare
    MINIMUM_CHARGE
  end

end