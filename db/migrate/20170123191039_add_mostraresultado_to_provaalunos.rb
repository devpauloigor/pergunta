class AddMostraresultadoToProvaalunos < ActiveRecord::Migration
  def change
    add_column :provaalunos, :mostraresultado, :integer
  end
end
