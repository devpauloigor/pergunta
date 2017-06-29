class CreateResultados < ActiveRecord::Migration
  def change
    create_table :resultados do |t|
      t.references :provaaluno, index: true, foreign_key: true
      t.references :questao, index: true, foreign_key: true
      t.references :resposta, index: true, foreign_key: true
      t.integer :correta

      t.timestamps null: false
    end
  end
end
