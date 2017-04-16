require 'find_disappeared_numbers'

describe 'find_disappeared_numbers' do
  specify { expect(find_disappeared_numbers([4,3,2,7,8,2,3,1])).to eq([5,6]) }
  specify { expect(find_disappeared_numbers([5,1,4,6,1,4])).to eq([2,3]) }
  specify { expect(find_disappeared_numbers([7,4,6,2,5,1,3])).to eq([]) }
end