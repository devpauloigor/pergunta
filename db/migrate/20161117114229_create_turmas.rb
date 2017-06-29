class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
