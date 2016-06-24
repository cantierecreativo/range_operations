module RangeOperations; end

module RangeOperations::Array
  # Returns a new array with the ranges sorted by their .begin value
  def self.sort(ranges)
    ranges.sort_by(&:begin)
  end

  # Returns a sorted array with overlapping and contiguous items merged
  def self.simplify(ranges)
    straight = ranges.map { |r| RangeOperations::Single.straighten(r) }
    sorted = straight.sort_by(&:begin)

    [].tap do |acc|
      sorted.each do |r|
        if acc.empty?
          acc << r
        else
          if acc[-1].end < r.begin
            acc << r
          else
            acc << RangeOperations::Pair.merge(acc.pop, r)
          end
        end
      end
    end
  end

  # Returns an array of ranges resulting from removing from `range`
  # any parts overlapped by any of `subranges`.
  def self.subtract(range, subranges)
    simple = simplify(subranges)

    [].tap do |acc|
      start = range.begin

      simple.each do |sr|
        next if sr.end < start

        if sr.begin > start
          finish = [sr.begin, range.end].min
          acc << (start .. finish)
        end

        start = sr.end
        break if start > range.end
      end

      if start < range.end
        acc << (start .. range.end)
      end
    end
  end
end
