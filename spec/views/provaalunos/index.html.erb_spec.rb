require 'rails_helper'

RSpec.describe "provaalunos/index", type: :view do
  before(:each) do
    assign(:provaalunos, [
      Provaaluno.create!(
        :prova => nil,
        :aluno => nil,
        :status => 1
      ),
      Provaaluno.create!(
        :prova => nil,
        :aluno => nil,
        :status => 1
      )
    ])
  end

  it "renders a list of provaalunos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
