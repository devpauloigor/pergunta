require 'rails_helper'

RSpec.describe "alunos/show", type: :view do
  before(:each) do
    @aluno = assign(:aluno, Aluno.create!(
      :nome => "Nome",
      :turma => nil,
      :situacao_matricula_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
