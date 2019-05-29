module RangeOperations; end

module RangeOperations::Single
  # True if begin is greater than end
  def self.backwards?(range)
    return false if !range

    range.begin > range.end
  end

  # Inverts backwards Ranges, leaves others unchanged
  def self.straighten(range)
    range.begin <= range.end ? range : range.end..range.begin
  end
end
