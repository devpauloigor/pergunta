require 'rails_helper'

RSpec.describe "provaalunos/new", type: :view do
  before(:each) do
    assign(:provaaluno, Provaaluno.new(
      :prova => nil,
      :aluno => nil,
      :status => 1
    ))
  end

  it "renders new provaaluno form" do
    render

    assert_select "form[action=?][method=?]", provaalunos_path, "post" do

      assert_select "input#provaaluno_prova_id[name=?]", "provaaluno[prova_id]"

      assert_select "input#provaaluno_aluno_id[name=?]", "provaaluno[aluno_id]"

      assert_select "input#provaaluno_status[name=?]", "provaaluno[status]"
    end
  end
end
