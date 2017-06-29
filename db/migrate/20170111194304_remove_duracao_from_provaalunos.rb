class RemoveDuracaoFromProvaalunos < ActiveRecord::Migration
  def change
    remove_column :provaalunos, :duracao, :time
  end
end
