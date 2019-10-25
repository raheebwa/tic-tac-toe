# frozen_string_literal: true

load 'lib/grid.rb'
load 'lib/player.rb'

class Game
  attr_accessor :winner

  @@current_player = true

  @@finished = false

  def initialize(player_1, player_2, finished = false)
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
    @finished = finished
    @@played_moves = Hash.new
    @grid = Grid.new
  end

  def display
    @grid.display
    puts "X #{@@played_moves.select { |x, y| y == 'X' }}"
    puts "O #{@@played_moves.select { |x, y| y == 'O' }}"
  end

  def validate_move(move)
    return false unless (1..9).member?(move) && !@@played_moves.member?(move)

    true
  end

  def make_move(move)
    mark = @@current_player ? 'X' : 'O'
    if validate_move(move)
      @grid.translate(move, mark)
      display
      switch_player
      @@played_moves[move] = mark
    else
      false
    end
  end

  def status
    @@finished
  end

  def curr_player
    @@current_player == true ? @player_1.name : @player_2.name
  end

  def switch_player
    @@current_player = !@@current_player
  end

  def check_win
    return false unless @@played_moves.count > 4

    x_count = @@played_moves.select { |_x, y| y == 'X' }
    o_count = @@played_moves.select { |_a, b| b == 'O' }

    if x_count.count > 2
      @@finished = true if valid_win(x_count) == true
      @winner = @player_1 if valid_win(x_count) == true

    elsif o_count.count > 2
      @@finished = true if valid_win(o_count) == true
      @winner = @player_2 if valid_win(o_count) == true

    else
      false
    end
  end

  def valid_win(hash)
    if (hash[1] === hash[2]) === hash[3]
      true
    elsif (hash[4] === hash[5]) === hash[6]
      true
    elsif (hash[7] === hash[8]) === hash[9]
      true
    elsif (hash[1] === hash[4]) === hash[7]
      true
    elsif (hash[2] === hash[5]) === hash[8]
      true
    elsif (hash[3] === hash[6]) === hash[9]
      true
    else
      (hash[7] === hash[5]) === hash[3]
    end
  end

  def instructions
    print "- Each player should make one move per turn.\n\n\n"
    print "- To make a move, input the number of an empty cell that you wish to mark.\n\n\n"
    print "- The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner \n\n\n"
  end
end
