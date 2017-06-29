require 'rails_helper'

RSpec.describe "useres/show", type: :view do
  before(:each) do
    @usere = assign(:usere, Usere.create!(
      :email => "Email",
      :password => "Password",
      :password_confirmation => "Password Confirmation",
      :nome => "Nome",
      :perfil => "Perfil"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Password Confirmation/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Perfil/)
  end
end
