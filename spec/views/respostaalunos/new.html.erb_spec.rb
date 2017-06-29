require 'rails_helper'

RSpec.describe "respostaalunos/new", type: :view do
  before(:each) do
    assign(:respostaaluno, Respostaaluno.new(
      :provaaluno => nil,
      :resposta => nil
    ))
  end

  it "renders new respostaaluno form" do
    render

    assert_select "form[action=?][method=?]", respostaalunos_path, "post" do

      assert_select "input#respostaaluno_provaaluno_id[name=?]", "respostaaluno[provaaluno_id]"

      assert_select "input#respostaaluno_resposta_id[name=?]", "respostaaluno[resposta_id]"
    end
  end
end
