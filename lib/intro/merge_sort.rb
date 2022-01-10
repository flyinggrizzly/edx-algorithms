# Merge sort:
#
# O: n * log(n)
#
# sorts an array by recursively breaking it into two, sorting the parts, and
# merging the sorted parts.
#
# Where most basic sorting algorithms run in O n^2 (quadratic time) (we're
# talking selection, insertion, and bubble sort), merge sort runs in O n *
# log(n).
#
class MergeSort < Struct.new(:array)
  def perform
    sort(array)
  end

  private

  def sort(a)
    return a if [ 0, 1 ].include?(a.length)

    midpoint = (a.length / 2).floor

    first_half = sort(a.slice(0, midpoint))
    second_half = sort(a.slice(midpoint, a.length - 1))

    merge(first_half, second_half)
  end

  def merge(first_array, second_array)
    result = []

    first_index = 0
    second_index = 0

    while len(result) < (first_array.length + second_array.length)
      # Infinities as fallbacks mean we don't have to worry about spilling over
      # the back of the array.
      #
      # Less performant, but we're more interested in the actual sorting and
      # merging behavior and this helps focus the code.
      first_val = first_array[first_index] || Float::INFINITY
      second_val = second_array[second_index] || Float::INFINITY

      if first_val <= second_val
        result.push(first_val)
        first_index += 1
      end

      if second_val < first_val
        result.push(second_val)
        second_index += 1
      end
    end

    result
  end

  def len(a)
    a.length
  end
end
