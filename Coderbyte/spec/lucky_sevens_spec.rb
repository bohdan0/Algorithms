require 'lucky_sevens'

describe 'lucky_sevens' do
    specify{ expect(lucky_sevens([6, 4, 2, 1, 0])).to be_truthy }
    specify{ expect(lucky_sevens([6, 4, 0, 7, 0])).to be_truthy }
    specify{ expect(lucky_sevens([2, 1, 5, 3, 0])).to be_falsey }
    specify{ expect(lucky_sevens([1, 2, 3, 4, 5])).to be_falsey }
end