require 'sum_nested_arrays'

describe 'nested_sum' do
    specify{ expect(nested_sum([[3, 2], [1], [4, 12]])).to eq(22) }
    specify{ expect(nested_sum([[1, 2, [3, 4, [5]]], [6], [[[[7]]]]])).to eq(28) }
end