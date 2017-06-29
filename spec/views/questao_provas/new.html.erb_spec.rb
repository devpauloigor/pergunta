require 'rails_helper'

RSpec.describe "questao_provas/new", type: :view do
  before(:each) do
    assign(:questao_prova, QuestaoProva.new(
      :prova => nil,
      :questao => nil
    ))
  end

  it "renders new questao_prova form" do
    render

    assert_select "form[action=?][method=?]", questao_provas_path, "post" do

      assert_select "input#questao_prova_prova_id[name=?]", "questao_prova[prova_id]"

      assert_select "input#questao_prova_questao_id[name=?]", "questao_prova[questao_id]"
    end
  end
end
