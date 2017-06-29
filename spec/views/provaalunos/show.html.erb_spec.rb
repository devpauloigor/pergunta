require 'rails_helper'

RSpec.describe "provaalunos/show", type: :view do
  before(:each) do
    @provaaluno = assign(:provaaluno, Provaaluno.create!(
      :prova => nil,
      :aluno => nil,
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
