require 'rails_helper'

RSpec.describe "respostaalunos/show", type: :view do
  before(:each) do
    @respostaaluno = assign(:respostaaluno, Respostaaluno.create!(
      :provaaluno => nil,
      :resposta => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
