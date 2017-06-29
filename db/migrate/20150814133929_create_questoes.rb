class CreateQuestoes < ActiveRecord::Migration
  def change
    create_table :questoes do |t|
      t.text :descricao

      t.timestamps null: false
    end
  end
end
