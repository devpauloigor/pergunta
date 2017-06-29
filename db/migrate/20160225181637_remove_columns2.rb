class RemoveColumns2 < ActiveRecord::Migration
  def change
  	def self.up
  remove_column :questao_subgrupos, :sub_grupo_id
	end
  end

  def self.up
  remove_column :questao_subgrupos, :sub_grupo_id
	end
end
