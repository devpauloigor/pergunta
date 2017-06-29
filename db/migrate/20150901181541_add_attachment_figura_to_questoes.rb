class AddAttachmentFiguraToQuestoes < ActiveRecord::Migration
  def self.up
    change_table :questoes do |t|
      t.attachment :figura
    end
  end

  def self.down
    remove_attachment :questoes, :figura
  end
end
