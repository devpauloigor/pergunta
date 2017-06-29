class QuestaoProva < ActiveRecord::Base
  belongs_to :prova
  belongs_to :questao
end
