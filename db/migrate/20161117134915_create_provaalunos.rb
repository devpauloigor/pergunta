class CreateProvaalunos < ActiveRecord::Migration
  def change
    create_table :provaalunos do |t|
      t.references :prova, index: true, foreign_key: true
      t.references :aluno, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
