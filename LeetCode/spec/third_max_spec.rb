require 'third_max'

describe 'third_max' do
  specify { expect(third_max([2,1,3])).to eq(1) }
  specify { expect(third_max([2,6,3,7,9,4])).to eq(6) }
  specify { expect(third_max([5,3,3,5,3,5,3])).to eq(5) }
end