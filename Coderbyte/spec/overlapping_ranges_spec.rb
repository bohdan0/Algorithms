require 'overlapping_ranges'

describe 'overlapping_ranges' do
    specify{ expect(overlapping_ranges([4, 10, 2, 6, 2])).to be_truthy }
    specify{ expect(overlapping_ranges([1, 5, 3, 7, 1])).to be_truthy }
    specify{ expect(overlapping_ranges([10, 20, 4, 14, 4])).to be_truthy }
    specify{ expect(overlapping_ranges([4, 10, 2, 6, 5])).to be_falsy }
end