class CreateQuestaoProvas < ActiveRecord::Migration
  def change
    create_table :questao_provas do |t|
      t.references :prova, index: true, foreign_key: true
      t.references :questao, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
