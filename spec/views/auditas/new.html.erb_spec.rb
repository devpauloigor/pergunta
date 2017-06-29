require 'rails_helper'

RSpec.describe "auditas/new", type: :view do
  before(:each) do
    assign(:audita, Audita.new(
      :user_id => 1,
      :questao_id => 1
    ))
  end

  it "renders new audita form" do
    render

    assert_select "form[action=?][method=?]", auditas_path, "post" do

      assert_select "input#audita_user_id[name=?]", "audita[user_id]"

      assert_select "input#audita_questao_id[name=?]", "audita[questao_id]"
    end
  end
end
