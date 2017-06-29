require 'rails_helper'

RSpec.describe "resultados/edit", type: :view do
  before(:each) do
    @resultado = assign(:resultado, Resultado.create!(
      :provaaluno => nil,
      :questao => nil,
      :resposta => nil,
      :correta => 1
    ))
  end

  it "renders the edit resultado form" do
    render

    assert_select "form[action=?][method=?]", resultado_path(@resultado), "post" do

      assert_select "input#resultado_provaaluno_id[name=?]", "resultado[provaaluno_id]"

      assert_select "input#resultado_questao_id[name=?]", "resultado[questao_id]"

      assert_select "input#resultado_resposta_id[name=?]", "resultado[resposta_id]"

      assert_select "input#resultado_correta[name=?]", "resultado[correta]"
    end
  end
end
