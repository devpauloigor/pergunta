require 'rails_helper'

RSpec.describe "resultados/new", type: :view do
  before(:each) do
    assign(:resultado, Resultado.new(
      :provaaluno => nil,
      :questao => nil,
      :resposta => nil,
      :correta => 1
    ))
  end

  it "renders new resultado form" do
    render

    assert_select "form[action=?][method=?]", resultados_path, "post" do

      assert_select "input#resultado_provaaluno_id[name=?]", "resultado[provaaluno_id]"

      assert_select "input#resultado_questao_id[name=?]", "resultado[questao_id]"

      assert_select "input#resultado_resposta_id[name=?]", "resultado[resposta_id]"

      assert_select "input#resultado_correta[name=?]", "resultado[correta]"
    end
  end
end
