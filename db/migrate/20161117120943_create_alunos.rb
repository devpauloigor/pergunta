class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :nome
      t.references :turma, index: true, foreign_key: true
      t.integer :situacao_matricula_id

      t.timestamps null: false
    end
  end
end
