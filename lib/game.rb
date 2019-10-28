# frozen_string_literal: true

load 'lib/grid.rb'
load 'lib/player.rb'

class Game
  attr_accessor :winner

  @current_player = true

  @finished = false

  def initialize(player1, player2, finished = false)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @finished = finished
    @played_moves = {}
    @grid = Grid.new
  end

  def display
    @grid.display
  end

  def validate_move(move)
    return false unless (1..9).member?(move) && !@played_moves.member?(move)

    true
  end

  def make_move(move)
    @mark = @current_player ? 'X' : 'O' if validate_move(move)
    @grid.translate(move, @mark)
    switch_player
    @played_moves[move] = @mark
    check_win
    check_draw
    display
  end

  def curr_player
    @current_player == true ? @player1.name : @player2.name
  end

  def switch_player
    @current_player = !@current_player
  end

  def check_win
    x_count = @played_moves.select { |_x, y| y == 'X' }
    o_count = @played_moves.select { |_a, b| b == 'O' }

    if x_count.count > 2 && valid_win(x_count) == true
      @winner = @player1
      return true
    elsif o_count.count > 2 && valid_win(o_count) == true
      @winner = @player2
      return true
    else
      false
    end
  end

  def valid_win(hash)
    if hash[1] == @mark && hash[2] == @mark && hash[3] == @mark
      true
    elsif hash[4] == @mark && hash[5] == @mark && hash[6] == @mark
      true
    elsif hash[7] == @mark && hash[8] == @mark && hash[9] == @mark
      true
    elsif hash[1] == @mark && hash[4] == @mark && hash[7] == @mark
      true
    elsif hash[2] == @mark && hash[5] == @mark && hash[8] == @mark
      true
    elsif hash[3] == @mark && hash[6] == @mark && hash[9] == @mark
      true
    elsif hash[1] == @mark && hash[5] == @mark && hash[9] == @mark
      true
    elsif hash[3] == @mark && hash[5] == @mark && hash[7] == @mark
      true
    else
      false
    end
  end

  def check_draw
    return false unless @played_moves.length == 9 && check_win == false

    true
  end

  def instructions
    print "- Each player should make one move per turn.\n\n\n"
    print "- To make a move, input the number of an empty cell that you wish to mark.\n\n\n"
    print "- The player who succeeds in placing three of their marks in a horizontal, 
    vertical, or diagonal row is the winner \n\n\n"
  end
end
