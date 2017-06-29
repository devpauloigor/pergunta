require 'rails_helper'

RSpec.describe "questao_provas/edit", type: :view do
  before(:each) do
    @questao_prova = assign(:questao_prova, QuestaoProva.create!(
      :prova => nil,
      :questao => nil
    ))
  end

  it "renders the edit questao_prova form" do
    render

    assert_select "form[action=?][method=?]", questao_prova_path(@questao_prova), "post" do

      assert_select "input#questao_prova_prova_id[name=?]", "questao_prova[prova_id]"

      assert_select "input#questao_prova_questao_id[name=?]", "questao_prova[questao_id]"
    end
  end
end
