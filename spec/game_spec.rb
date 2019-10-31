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
    it 'Check if current player is 1' do
      expect(game.current_player).to eql(true)
    end
    it 'Check if finished is false' do
      expect(game.finished).to eql(false)
    end
    it 'Check if player1 is an instance of player class' do
      expect(game.player1).is_a? Player 
    end
    it 'Check if player2 is an instance of player class' do
      expect(game.player2).is_a? Player 
    end
    it 'Check if played moves are equal to empty hash' do
      expect(game.played_moves).to eql(Hash.new)
    end
    it 'Check if valid move defaults to true' do
      expect(game.valid_move).to eql(true)
    end
  end

  describe '#display' do
    it 'Check if the board is displaying correctly' do
      expect(game.display).to eql(grid.display)
    end
  end

  describe '#validate_move' do
    it 'returns false if the move is out of the range 1 - 9' do
      expect(game.validate_move(11)).to eql(false)
    end
    it 'returns false if the move is already played' do
      game.played_moves[1] = "X"
      expect(game.validate_move(1)).to eql(false)
    end

    it 'returns true if the move is in the range 1 - 9 & move is not played before' do
      expect(game.validate_move(4)).to eql(true)
    end
  end

  # describe '#make_move' do
   
  # end

  # describe '#curr_player' do
    
  # end

  # describe '#switch_player' do
    
  # end

  # describe '#check_win' do
    
  # end

  # describe '#valid_win' do
    
  # end

  # describe '#check_draw' do
    
  # end
end
