class CreateAuditas < ActiveRecord::Migration
  def change
    create_table :auditas do |t|
   

      t.references :questao
      t.references :useres

      t.timestamps null: false
    end
    

  end
end
