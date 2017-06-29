require 'rails_helper'

RSpec.describe "useres/new", type: :view do
  before(:each) do
    assign(:usere, Usere.new(
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :nome => "MyString",
      :perfil => "MyString"
    ))
  end

  it "renders new usere form" do
    render

    assert_select "form[action=?][method=?]", useres_path, "post" do

      assert_select "input#usere_email[name=?]", "usere[email]"

      assert_select "input#usere_password[name=?]", "usere[password]"

      assert_select "input#usere_password_confirmation[name=?]", "usere[password_confirmation]"

      assert_select "input#usere_nome[name=?]", "usere[nome]"

      assert_select "input#usere_perfil[name=?]", "usere[perfil]"
    end
  end
end
