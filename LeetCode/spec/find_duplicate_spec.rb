require 'find_duplicate'

describe 'find_duplicate' do
  specify { expect(find_duplicate([1,1])).to eq(1) }
  specify { expect(find_duplicate([5,2,4,2,3,1])).to eq(2) }
  specify { expect(find_duplicate([7,4,5,1,7,2,6,3])).to eq(7) }
end