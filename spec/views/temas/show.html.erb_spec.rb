require 'rails_helper'

RSpec.describe "temas/show", type: :view do
  before(:each) do
    @tema = assign(:tema, Tema.create!(
      :descricao => "Descricao",
      :subgrupo => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(//)
  end
end
