class RemoveSubGrupoIdFromQuestaoSubgrupos < ActiveRecord::Migration
  def self.up
    remove_column :questao_subgrupos, :sub_grupo_id
  end

  def self.down
    add_column :questao_subgrupo, :tema_id, :integer
  end
end
