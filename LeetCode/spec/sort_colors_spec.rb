require 'sort_colors'

describe 'sort_colors' do
  specify {
    a = [0]
    sort_colors(a)
    expect(a).to eq([0])
  }
  specify {
    b = [1,0]
    sort_colors(b)
    expect(b).to eq([0,1])
  }
  specify {
    c = [0,2,1,2,1,2,1,0]
    sort_colors(c)
    expect(c).to eq([0,0,1,1,1,2,2,2])
  }
end