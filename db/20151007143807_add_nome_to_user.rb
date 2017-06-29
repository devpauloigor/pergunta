class AddNomeToUser < ActiveRecord::Migration
  def change
    add_column :useres, :nome, :string
  end
end
