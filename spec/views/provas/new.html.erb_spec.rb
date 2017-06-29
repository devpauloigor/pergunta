require 'rails_helper'

RSpec.describe "provas/new", type: :view do
  before(:each) do
    assign(:prova, Prova.new(
      :nome => "MyString"
    ))
  end

  it "renders new prova form" do
    render

    assert_select "form[action=?][method=?]", provas_path, "post" do

      assert_select "input#prova_nome[name=?]", "prova[nome]"
    end
  end
end
