class AddSubGrupoIdToQuestao < ActiveRecord::Migration
  def change
    add_column :questoes, :SubGrupo_id, :integer
  end
end
