class AddPerfilToUser < ActiveRecord::Migration
  def change
    add_column :useres, :Perfil, :string
  end
end
