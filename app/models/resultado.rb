class Resultado < ActiveRecord::Base
  belongs_to :provaaluno
  belongs_to :questao
  belongs_to :resposta
end
