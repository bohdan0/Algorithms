require 'boggle_solver'

describe 'boggle_solver' do
  specify { expect(boggle_solver(["aaey, rrum, tgmn, ball", "all,ball,mur,raeymnl,tall,true,trum"
])).to be_truthy }
  specify { expect(boggle_solver(["aaey, rrum, tgmn, ball", "all,ball,mur,raeymnl,rumk,tall,true,trum,yes"])).to eq("rumk,yes") }
end