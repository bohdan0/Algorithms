require 'find_pattern'

answer1 = ['01100', '01110']

answer2 = [
    '010010',
    '011010',
    '010011',
    '011011'
]

answer3 = ['000010', '010010', '100010', '110010']

describe 'find_pattern' do
    specify { expect(patterns('011?0').sort).to eq(answer1.sort) }
    specify { expect(patterns('01?01?').sort).to eq(answer2.sort) }
    specify { expect(patterns('??0010').sort).to eq(answer3.sort) }
end