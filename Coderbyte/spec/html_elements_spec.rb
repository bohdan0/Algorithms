require 'html_elements'

describe 'html_elements' do
  specify { expect(html_elements("<div><div><b></b></div></p>")).to eq("div") }
  specify { expect(html_elements("<div>abc</div><p><em><i>test test test</b></em></p>")).to eq("i") }
end