# frozen_string_literal: true

load 'lib/grid.rb'

class Game
  @@current_player = true

  def initialize(player_1, player_2, finished = false)
    @player_1 = player_1
    @player_2 = player_2
    @finished = finished
    @@played_moves = {}
    @grid = Grid.new

  end

  def display
    @grid.display
  end

  def validate_move(move)
    return false unless (1..9).member?(move) && !@@played_moves.member?(move)
    true
  end

  def make_move(move)
    mark = @@current_player ? "X" : "O"
    if validate_move(move)
      @grid.translate(move, mark)
      display
      switch_player
      @@played_moves[move] = mark
      puts "Moved played #{@@played_moves.count}"
      true
    else
      puts "Your move is invalid"
      false
    end
  end

  def switch_player
    @@current_player = !@@current_player
  end

  def moves_played
   return  @@played_moves
  end

  def check_win
    if @@played_moves.count > 4
      if @@played_moves[1] == mark && @@played_moves[2] == mark && @@played_moves[3] == mark
        true
      end
    end
  end
end
