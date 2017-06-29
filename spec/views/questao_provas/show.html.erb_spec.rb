require 'rails_helper'

RSpec.describe "questao_provas/show", type: :view do
  before(:each) do
    @questao_prova = assign(:questao_prova, QuestaoProva.create!(
      :prova => nil,
      :questao => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
