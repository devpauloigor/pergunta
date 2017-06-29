require 'rails_helper'

RSpec.describe "resultados/show", type: :view do
  before(:each) do
    @resultado = assign(:resultado, Resultado.create!(
      :provaaluno => nil,
      :questao => nil,
      :resposta => nil,
      :correta => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
