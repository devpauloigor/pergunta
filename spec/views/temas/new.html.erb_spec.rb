require 'rails_helper'

RSpec.describe "temas/new", type: :view do
  before(:each) do
    assign(:tema, Tema.new(
      :descricao => "MyString",
      :subgrupo => nil
    ))
  end

  it "renders new tema form" do
    render

    assert_select "form[action=?][method=?]", temas_path, "post" do

      assert_select "input#tema_descricao[name=?]", "tema[descricao]"

      assert_select "input#tema_subgrupo_id[name=?]", "tema[subgrupo_id]"
    end
  end
end
