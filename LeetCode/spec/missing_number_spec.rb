require 'missing_number'

describe 'missing_number' do
  specify { expect(missing_number([0, 1, 3])).to eq(2) }
  specify { expect(missing_number([3,2,1])).to eq(0) }
  specify { expect(missing_number([2,4,0,3,1])).to eq(5) }
end