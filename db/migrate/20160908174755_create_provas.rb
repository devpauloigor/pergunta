class CreateProvas < ActiveRecord::Migration
  def change
    create_table :provas do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
