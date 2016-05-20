class Selection < ActiveRecord::Base
belongs_to :player
belongs_to :round
belongs_to :selected_gif, class_name: "Gif"





end