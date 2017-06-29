class Provaaluno < ActiveRecord::Base
  belongs_to :prova
  belongs_to :aluno
end
