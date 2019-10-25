# frozen_string_literal: true

load 'lib/grid.rb'

class Game
  @@current_player = false

  def initialize(player_1, player_2, finished = false)
    @player_1 = player_1
    @player_2 = player_2
    @finished = finished
    @@played_moves = []
    @grid = Grid.new

    break if @finished == true
  end

  def game_display
    @grid.display
  end

  def validate_move(move)
    return true unless (1..9).member?(move) && !@@played_moves.include?(move)
    false
  end

  def make_move(move, player)
    mark = @@current_player ? "X" : "O"
    if validate_move(move)
      @grid.translate(move, mark)
      switch_player
      true
    else
      puts "Your move is invalid"
    end
    false
  end

  def switch_player
    @@current_player = !@@current_player
  end
end
