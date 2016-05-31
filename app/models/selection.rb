class Selection < ActiveRecord::Base
belongs_to :player
belongs_to :round
belongs_to :gif


def self.currentselections(round)
round.selections unless round == nil
end



end