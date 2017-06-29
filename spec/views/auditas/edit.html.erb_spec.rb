require 'rails_helper'

RSpec.describe "auditas/edit", type: :view do
  before(:each) do
    @audita = assign(:audita, Audita.create!(
      :user_id => 1,
      :questao_id => 1
    ))
  end

  it "renders the edit audita form" do
    render

    assert_select "form[action=?][method=?]", audita_path(@audita), "post" do

      assert_select "input#audita_user_id[name=?]", "audita[user_id]"

      assert_select "input#audita_questao_id[name=?]", "audita[questao_id]"
    end
  end
end
