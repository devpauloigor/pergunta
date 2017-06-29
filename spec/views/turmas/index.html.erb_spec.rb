require 'rails_helper'

RSpec.describe "turmas/index", type: :view do
  before(:each) do
    assign(:turmas, [
      Turma.create!(
        :descricao => "Descricao"
      ),
      Turma.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of turmas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
