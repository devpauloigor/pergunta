require 'rails_helper'

RSpec.describe "temas/edit", type: :view do
  before(:each) do
    @tema = assign(:tema, Tema.create!(
      :descricao => "MyString",
      :subgrupo => nil
    ))
  end

  it "renders the edit tema form" do
    render

    assert_select "form[action=?][method=?]", tema_path(@tema), "post" do

      assert_select "input#tema_descricao[name=?]", "tema[descricao]"

      assert_select "input#tema_subgrupo_id[name=?]", "tema[subgrupo_id]"
    end
  end
end
