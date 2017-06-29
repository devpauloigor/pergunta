class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
      t.text :descricao
      t.integer :correta
      t.references :pergunta
   
      t.timestamps null: false
    end
  end
end
