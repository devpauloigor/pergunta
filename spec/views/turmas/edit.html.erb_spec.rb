require 'rails_helper'

RSpec.describe "turmas/edit", type: :view do
  before(:each) do
    @turma = assign(:turma, Turma.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit turma form" do
    render

    assert_select "form[action=?][method=?]", turma_path(@turma), "post" do

      assert_select "input#turma_descricao[name=?]", "turma[descricao]"
    end
  end
end
