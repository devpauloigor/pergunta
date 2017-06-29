class AddUserToProvas < ActiveRecord::Migration
  def change
    add_reference :provas, :user, index: true, foreign_key: true
  end
end
