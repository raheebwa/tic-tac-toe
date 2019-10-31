# frozen_string_literal: true

require './lib/game.rb'
require './lib/grid.rb'
require './lib/player.rb'

player1 = Player.new('player1')
player2 = Player.new('player2')
game = Game.new(player1, player2)
grid = Grid.new

RSpec.describe Game do
  describe '#initialize' do
    i
    it 'Check if the board is displaying correctly' do
      expect(game.display).to eql(grid.display)
    end
    it 'returns false if the move is out of the range 1 - 9' do
      expect(game.validate_move(11)).to eql(false)
    end
  end
end
