require 'rails_helper'

RSpec.describe "tempandos/new", type: :view do
  before(:each) do
    assign(:tempando, Tempando.new())
  end

  it "renders new tempando form" do
    render

    assert_select "form[action=?][method=?]", tempandos_path, "post" do
    end
  end
end
