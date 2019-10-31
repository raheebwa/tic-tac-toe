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
    it 'Check if current player is true' do
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
      expect(game.played_moves).to eql({})
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
      game.played_moves[1] = 'X'
      expect(game.validate_move(1)).to eql(false)
    end

    it 'returns true if the move is in the range 1 - 9 & move is not played before' do
      expect(game.validate_move(4)).to eql(true)
    end
  end

  describe '#make_move' do
    it 'Marks cell in grid with player\'s mark' do
      game.make_move(2)
      expect(game.played_moves[2]).to eql('X')
    end
  end

  # describe '#curr_player' do
  #   it 'returns player1 name if current_player is true' do

  #   end
  #   it 'returns player2 name if current_player is false' do

  #   end
  # end

  describe '#switch_player' do
    it 'Switch current player status everytime that it\'s called' do
      game.current_player = true
      game.switch_player
      expect(game.current_player).to eql(false)
    end
  end

  describe '#check_win & #valid_win' do
    it 'If the board hasn\'t a win set, returns false' do
      game.played_moves = {}
      expect(game.check_win).to eql(false)
    end
    it 'If the board has a win set, returns true' do
      game.played_moves = { 1 => 'X', 2 => 'O', 5 => 'X', 6 => 'O', 9 => 'X' }
      expect(game.check_win).to eql(true)
    end
  end

  describe '#check_draw' do
    it 'Return true if the game is over and the result is a draw' do
      game.played_moves = { 1 => 'O', 2 => 'X', 3 => 'X', 4 => 'X', 5 => 'X', 6 => 'O', 7 => '0', 8 => '0', 9 => 'X' }
      expect(game.check_draw).to eql(true)
    end
    it 'Return false if the game isn\'t over or the result isn\'t a draw' do
      game.played_moves = { 1 => 'O', 2 => 'X', 3 => 'X', 4 => 'X', 5 => 'X', 6 => 'O', 7 => 'X', 8 => 'O', 9 => 'O' }
      expect(game.check_draw).to eql(false)
    end
  end
end
