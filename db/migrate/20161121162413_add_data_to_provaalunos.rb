class AddDataToProvaalunos < ActiveRecord::Migration
  def change
    add_column :provaalunos, :data, :timestamp
  end
end
