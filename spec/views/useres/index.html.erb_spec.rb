require 'rails_helper'

RSpec.describe "useres/index", type: :view do
  before(:each) do
    assign(:useres, [
      Usere.create!(
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :nome => "Nome",
        :perfil => "Perfil"
      ),
      Usere.create!(
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :nome => "Nome",
        :perfil => "Perfil"
      )
    ])
  end

  it "renders a list of useres" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Perfil".to_s, :count => 2
  end
end
