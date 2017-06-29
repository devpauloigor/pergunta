require 'rails_helper'

RSpec.describe "turmas/show", type: :view do
  before(:each) do
    @turma = assign(:turma, Turma.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
