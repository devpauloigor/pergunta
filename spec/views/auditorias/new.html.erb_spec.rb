require 'rails_helper'

RSpec.describe "auditorias/new", type: :view do
  before(:each) do
    assign(:auditoria, Auditoria.new(
      :user_id => 1,
      :questao_id => 1
    ))
  end

  it "renders new auditoria form" do
    render

    assert_select "form[action=?][method=?]", auditorias_path, "post" do

      assert_select "input#auditoria_user_id[name=?]", "auditoria[user_id]"

      assert_select "input#auditoria_questao_id[name=?]", "auditoria[questao_id]"
    end
  end
end
