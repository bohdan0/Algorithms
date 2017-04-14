require 'find_median_sorted_arrays'

describe 'find_median_sorted_arrays' do
  specify { expect(find_median_sorted_arrays([1,2,3,4,5], [3,4,6])).to eq(3.5) }
  specify { expect(find_median_sorted_arrays([1,1], [1,2])).to eq(1.25) }
  specify { expect(find_median_sorted_arrays([1,2], [3,4])).to eq(2.5) }
  specify { expect(find_median_sorted_arrays([1,3], [2])).to eq(2) }
end