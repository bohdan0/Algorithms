require 'move_zeroes'

describe 'move_zeroes' do
  specify { expect(move_zeroes([0,1,0,3,12])).to eq([1,3,12,0,0]) }
  specify { expect(move_zeroes([2,5,0,6,1,0,0,0,3])).to eq([2,5,6,1,3,0,0,0,0]) }
  specify { expect(move_zeroes([0,4,0,1,0,5,0,3])).to eq([4,1,5,3,0,0,0,0]) }
end