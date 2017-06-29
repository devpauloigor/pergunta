require 'rails_helper'

RSpec.describe "provaalunos/edit", type: :view do
  before(:each) do
    @provaaluno = assign(:provaaluno, Provaaluno.create!(
      :prova => nil,
      :aluno => nil,
      :status => 1
    ))
  end

  it "renders the edit provaaluno form" do
    render

    assert_select "form[action=?][method=?]", provaaluno_path(@provaaluno), "post" do

      assert_select "input#provaaluno_prova_id[name=?]", "provaaluno[prova_id]"

      assert_select "input#provaaluno_aluno_id[name=?]", "provaaluno[aluno_id]"

      assert_select "input#provaaluno_status[name=?]", "provaaluno[status]"
    end
  end
end
