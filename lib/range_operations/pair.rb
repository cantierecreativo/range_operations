module RangeOperations; end

module RangeOperations::Pair
  # True if sections of the two ranges overlap
  def self.overlap?(range1, range2)
    return false if !range1
    return false if !range2

    range1.cover?(range2.begin) || range2.cover?(range1.begin)
  end

  # True if the extremeties of the two ranges touch
  def self.contiguous?(range1, range2)
    return false if !range1
    return false if !range2

    range1.end == range2.begin || range2.end == range1.begin
  end

  # True if the ranges do not overlap and do not touch
  def self.disjoint?(range1, range2)
    return false if !range1
    return false if !range2

    !range1.cover?(range2) && !range2.cover?(range1)
  end

  # Make a Range form range1's begin and range2's end
  def self.merge(range1, range2)
    range1.begin..range2.end
  end
end
