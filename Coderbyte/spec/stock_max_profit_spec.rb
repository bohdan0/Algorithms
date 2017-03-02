require 'stock_max_profit'

describe 'stock_picker' do
    specify{ expect(stock_picker([1, -3, 4, 0, 8, 7, 11, 3])).to eq(14) }
    specify{ expect(stock_picker([45, 24, 35, 31, 40, 38, 11])).to eq(16) }
    specify{ expect(stock_picker([9, 8, 7, 6, 5, 4, 3, 2])).to eq(-1) }
end