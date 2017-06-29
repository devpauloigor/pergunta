class AddDuracaoToProvaalunos < ActiveRecord::Migration
  def change
    add_column :provaalunos, :duracao, :time
  end
end
