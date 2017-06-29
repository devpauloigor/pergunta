class AddTemaIdToQuestaoSubgrupos < ActiveRecord::Migration
  def change
  	 add_column :questao_subgrupos, :tema_id, :integer
  end
end
