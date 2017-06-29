require 'rails_helper'

RSpec.describe "respostaalunos/index", type: :view do
  before(:each) do
    assign(:respostaalunos, [
      Respostaaluno.create!(
        :provaaluno => nil,
        :resposta => nil
      ),
      Respostaaluno.create!(
        :provaaluno => nil,
        :resposta => nil
      )
    ])
  end

  it "renders a list of respostaalunos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
