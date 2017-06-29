require 'rails_helper'

RSpec.describe "resultados/index", type: :view do
  before(:each) do
    assign(:resultados, [
      Resultado.create!(
        :provaaluno => nil,
        :questao => nil,
        :resposta => nil,
        :correta => 1
      ),
      Resultado.create!(
        :provaaluno => nil,
        :questao => nil,
        :resposta => nil,
        :correta => 1
      )
    ])
  end

  it "renders a list of resultados" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
