module RangeOperations; end

module RangeOperations::Single
  # True if begin is greater than end
  def self.backwards?(r)
    r && r.begin > r.end
  end

  # Inverts backwards Ranges, leaves others unchanged
  def self.straighten(r)
    r.begin <= r.end ? r : r.end .. r.begin
  end
end
