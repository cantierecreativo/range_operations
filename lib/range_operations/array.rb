# rubocop:disable Metrics/MethodLength
module RangeOperations; end

module RangeOperations::Array
  # Returns a new array with the ranges sorted by their .begin value
  def self.sort(ranges)
    ranges.sort_by(&:begin)
  end

  # Returns a sorted array with overlapping and contiguous items merged
  def self.simplify(ranges)
    straight = ranges.map { |range| RangeOperations::Single.straighten(range) }
    sorted = straight.sort_by(&:begin)

    sorted.each.with_object([]) do |range, acc|
      acc <<
        if acc.empty?
          range
        elsif acc[-1].end < range.begin
          range
        else
          RangeOperations::Pair.merge(acc.pop, range)
        end
    end
  end

  # rubocop:disable Metrics/AbcSize
  # Returns an array of ranges resulting from removing from `range`
  # any parts overlapped by any of `subranges`.
  def self.subtract(range, subranges)
    simple = simplify(subranges)
    start = range.begin

    result = simple.each.with_object([]) do |subrange, acc|
      next if subrange.end < start

      if subrange.begin > start
        finish = [subrange.begin, range.end].min
        acc << (start..finish)
      end

      start = subrange.end
    end

    result << (start..range.end) if start < range.end
    result
  end
  # rubocop:enable Metrics/AbcSize
end
# rubocop:enable Metrics/MethodLength
