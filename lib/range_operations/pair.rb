module RangeOperations; end

module RangeOperations::Pair
  # True if sections of the two ranges overlap
  def self.overlap?(a, b)
    a && b && (a.cover?(b.begin) || b.cover?(a.begin))
  end

  # True if the extremeties of the two ranges touch
  def self.contiguous?(a, b)
    a && b && (a.end == b.begin || b.end == a.begin)
  end

  # True if the ranges do not overlap and do not touch
  def self.disjoint?(a, b)
    a && b && !a.cover?(b) && !b.cover?(a)
  end

  # Make a Range form a's begin and b's end
  def self.merge(a, b)
    a.begin .. b.end
  end
end
