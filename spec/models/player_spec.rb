require 'rails_helper'

describe "Player" do 

  it 'players have a username' do
  x = Player.new(username: "will")
  expect(x.username).to eq("will")
  end


  
  describe '#starting_hand' do 
    
      it 'gives a player a hand of 10 gifs' do 
      player = Player.new
      player.starting_hand
      expect(player.gifs.size).to eq(10)
    end

    it 'deletes a players current hand before assigning new gifs' do
      #setup
      player = Player.new
      #trigger: call twice to simulate 2 rounds
      player.starting_hand
      player.starting_hand
      #expectation
      expect(player.gifs.size).to eq(10)
    end

  end

end