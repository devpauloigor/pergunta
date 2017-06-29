require 'rails_helper'

RSpec.describe "provas/show", type: :view do
  before(:each) do
    @prova = assign(:prova, Prova.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
