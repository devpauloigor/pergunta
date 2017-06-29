class CreatePerguntaSubgrupos < ActiveRecord::Migration
  def change
    create_table :questao_subgrupos do |t|
      t.references :questao, index: true, foreign_key: true
      t.references :sub_grupo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
