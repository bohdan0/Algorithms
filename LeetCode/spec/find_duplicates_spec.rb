require 'find_duplicates'

describe 'find_duplicates' do
  specify { expect(find_duplicates([4,3,2,7,8,2,3,1])).to eq([2,3]) }
  specify { expect(find_duplicates([5,1,4,6,1,4])).to eq([1,4]) }
  specify { expect(find_duplicates([7,4,6,2,5,1,3])).to eq([]) }
end