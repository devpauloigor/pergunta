class Respostaaluno < ActiveRecord::Base
  belongs_to :provaaluno
  belongs_to :resposta
end
