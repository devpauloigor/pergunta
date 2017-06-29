require 'rails_helper'

RSpec.describe "auditorias/show", type: :view do
  before(:each) do
    @auditoria = assign(:auditoria, Auditoria.create!(
      :user_id => 1,
      :questao_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
