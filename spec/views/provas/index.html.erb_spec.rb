require 'rails_helper'

RSpec.describe "provas/index", type: :view do
  before(:each) do
    assign(:provas, [
      Prova.create!(
        :nome => "Nome"
      ),
      Prova.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of provas" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
