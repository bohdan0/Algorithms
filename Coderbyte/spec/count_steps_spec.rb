require 'count_steps'

describe 'count_steps' do
    specify { expect(count_steps(4)).to eq(5) }
    specify { expect(count_steps(3)).to eq(3) }
    specify { expect(count_steps(10)).to eq(89) }
end