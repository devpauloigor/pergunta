require 'rails_helper'

RSpec.describe "tempandos/edit", type: :view do
  before(:each) do
    @tempando = assign(:tempando, Tempando.create!())
  end

  it "renders the edit tempando form" do
    render

    assert_select "form[action=?][method=?]", tempando_path(@tempando), "post" do
    end
  end
end
