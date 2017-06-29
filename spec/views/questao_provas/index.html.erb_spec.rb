require 'rails_helper'

RSpec.describe "questao_provas/index", type: :view do
  before(:each) do
    assign(:questao_provas, [
      QuestaoProva.create!(
        :prova => nil,
        :questao => nil
      ),
      QuestaoProva.create!(
        :prova => nil,
        :questao => nil
      )
    ])
  end

  it "renders a list of questao_provas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
