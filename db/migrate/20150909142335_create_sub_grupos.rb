class CreateSubGrupos < ActiveRecord::Migration
  def change
    create_table :sub_grupos do |t|
      t.string :nome
      t.references :grupo

      t.timestamps null: false
    end
  end
end
