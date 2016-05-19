class PlayerRoundGif < ActiveRecord::Base
belongs_to :player
belongs_to :round
belongs_to :gif

end