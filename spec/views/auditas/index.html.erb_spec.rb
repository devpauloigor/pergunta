require 'rails_helper'

RSpec.describe "auditas/index", type: :view do
  before(:each) do
    assign(:auditas, [
      Audita.create!(
        :user_id => 1,
        :questao_id => 2
      ),
      Audita.create!(
        :user_id => 1,
        :questao_id => 2
      )
    ])
  end

  it "renders a list of auditas" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
