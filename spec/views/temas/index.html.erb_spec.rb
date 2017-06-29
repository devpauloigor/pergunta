require 'rails_helper'

RSpec.describe "temas/index", type: :view do
  before(:each) do
    assign(:temas, [
      Tema.create!(
        :descricao => "Descricao",
        :subgrupo => nil
      ),
      Tema.create!(
        :descricao => "Descricao",
        :subgrupo => nil
      )
    ])
  end

  it "renders a list of temas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
