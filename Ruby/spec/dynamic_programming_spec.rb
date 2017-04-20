require 'dynamic_programming'

describe 'make_change' do
  coins = [1,5,7,10]
  specify { expect(make_change(11, coins)).to eq(2) }
  specify { expect(make_change(12, coins)).to eq(2) }
  specify { expect(make_change(13, coins)).to eq(3) }
  specify { expect(make_change(14, coins)).to eq(2) }
end