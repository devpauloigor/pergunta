require 'rails_helper'

RSpec.describe "tempandos/index", type: :view do
  before(:each) do
    assign(:tempandos, [
      Tempando.create!(),
      Tempando.create!()
    ])
  end

  it "renders a list of tempandos" do
    render
  end
end
