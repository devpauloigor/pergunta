require 'rails_helper'

RSpec.describe "useres/edit", type: :view do
  before(:each) do
    @usere = assign(:usere, Usere.create!(
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :nome => "MyString",
      :perfil => "MyString"
    ))
  end

  it "renders the edit usere form" do
    render

    assert_select "form[action=?][method=?]", usere_path(@usere), "post" do

      assert_select "input#usere_email[name=?]", "usere[email]"

      assert_select "input#usere_password[name=?]", "usere[password]"

      assert_select "input#usere_password_confirmation[name=?]", "usere[password_confirmation]"

      assert_select "input#usere_nome[name=?]", "usere[nome]"

      assert_select "input#usere_perfil[name=?]", "usere[perfil]"
    end
  end
end
