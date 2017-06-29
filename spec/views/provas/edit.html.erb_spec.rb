require 'rails_helper'

RSpec.describe "provas/edit", type: :view do
  before(:each) do
    @prova = assign(:prova, Prova.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit prova form" do
    render

    assert_select "form[action=?][method=?]", prova_path(@prova), "post" do

      assert_select "input#prova_nome[name=?]", "prova[nome]"
    end
  end
end
