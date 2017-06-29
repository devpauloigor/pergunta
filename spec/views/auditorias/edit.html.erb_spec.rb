require 'rails_helper'

RSpec.describe "auditorias/edit", type: :view do
  before(:each) do
    @auditoria = assign(:auditoria, Auditoria.create!(
      :user_id => 1,
      :questao_id => 1
    ))
  end

  it "renders the edit auditoria form" do
    render

    assert_select "form[action=?][method=?]", auditoria_path(@auditoria), "post" do

      assert_select "input#auditoria_user_id[name=?]", "auditoria[user_id]"

      assert_select "input#auditoria_questao_id[name=?]", "auditoria[questao_id]"
    end
  end
end
