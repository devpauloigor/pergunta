require 'rails_helper'

RSpec.describe "tempandos/show", type: :view do
  before(:each) do
    @tempando = assign(:tempando, Tempando.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
