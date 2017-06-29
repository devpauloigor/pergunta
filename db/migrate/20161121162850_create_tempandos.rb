class CreateTempandos < ActiveRecord::Migration
  def change
    create_table :tempandos do |t|
      t.timestamp :horario

      t.timestamps null: false
    end
  end
end
