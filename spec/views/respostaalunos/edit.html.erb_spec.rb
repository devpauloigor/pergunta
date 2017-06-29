require 'rails_helper'

RSpec.describe "respostaalunos/edit", type: :view do
  before(:each) do
    @respostaaluno = assign(:respostaaluno, Respostaaluno.create!(
      :provaaluno => nil,
      :resposta => nil
    ))
  end

  it "renders the edit respostaaluno form" do
    render

    assert_select "form[action=?][method=?]", respostaaluno_path(@respostaaluno), "post" do

      assert_select "input#respostaaluno_provaaluno_id[name=?]", "respostaaluno[provaaluno_id]"

      assert_select "input#respostaaluno_resposta_id[name=?]", "respostaaluno[resposta_id]"
    end
  end
end
