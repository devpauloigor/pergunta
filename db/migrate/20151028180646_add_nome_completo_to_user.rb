class AddNomeCompletoToUser < ActiveRecord::Migration
  def change
    add_column :useres, :nome_completo, :string
  end
end
