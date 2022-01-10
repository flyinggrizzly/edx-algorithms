require 'intro/merge_sort'

RSpec.describe MergeSort do
  def sort(array)
    described_class.new(array).perform
  end

  it do
    expect(sort([ 4, 2, 3, 1 ])).to eq([ 1, 2, 3, 4 ])
    expect(sort([ 4, 2, 3, 1, 7 ])).to eq([ 1, 2, 3, 4, 7 ])
  end
end
