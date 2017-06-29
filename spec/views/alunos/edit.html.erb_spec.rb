require 'rails_helper'

RSpec.describe "alunos/edit", type: :view do
  before(:each) do
    @aluno = assign(:aluno, Aluno.create!(
      :nome => "MyString",
      :turma => nil,
      :situacao_matricula_id => 1
    ))
  end

  it "renders the edit aluno form" do
    render

    assert_select "form[action=?][method=?]", aluno_path(@aluno), "post" do

      assert_select "input#aluno_nome[name=?]", "aluno[nome]"

      assert_select "input#aluno_turma_id[name=?]", "aluno[turma_id]"

      assert_select "input#aluno_situacao_matricula_id[name=?]", "aluno[situacao_matricula_id]"
    end
  end
end
