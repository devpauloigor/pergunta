require 'rails_helper'

RSpec.describe "auditorias/index", type: :view do
  before(:each) do
    assign(:auditorias, [
      Auditoria.create!(
        :user_id => 1,
        :questao_id => 2
      ),
      Auditoria.create!(
        :user_id => 1,
        :questao_id => 2
      )
    ])
  end

  it "renders a list of auditorias" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
