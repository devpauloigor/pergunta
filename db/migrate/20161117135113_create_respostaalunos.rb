class CreateRespostaalunos < ActiveRecord::Migration
  def change
    create_table :respostaalunos do |t|
      t.references :provaaluno, index: true, foreign_key: true
      t.references :resposta, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
