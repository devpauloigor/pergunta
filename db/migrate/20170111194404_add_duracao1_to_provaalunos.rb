class AddDuracao1ToProvaalunos < ActiveRecord::Migration
  def change
    add_column :provaalunos, :duracao, :integer
  end
end
