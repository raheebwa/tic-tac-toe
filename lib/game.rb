# frozen_string_literal: true

load 'lib/grid.rb'

class Game
  attr_accessor :winner

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
      x_count = @@played_moves.select{|x,y| y=="X"}
      o_count = @@played_moves.select{|a,b| b=="O"}

      if (x_count.count > 2)
        valid_win(x_count)
        elsif(o_count.count > 2)        
        valid_win(o_count)
      end
    end
    false
  end

  def valid_win(hash)

    if (hash[1] == hash[2]) == hash[3]
      return true
    elsif (hash[4] == hash[5]) == hash[6]
      return true
    elsif (hash[7] == hash[8]) == hash[9]
      return true
    elsif (hash[1] == hash[4]) == hash[7]
      return true
    elsif (hash[2] == hash[5]) == hash[8]
      return true
    elsif (hash[3] == hash[6]) == hash[9]
      return true
    elsif (hash[7] == hash[5]) == hash[3]
      return true
    elsif (hash[1] == hash[5]) == hash[9]
      return true
    else
      return false
    end
  end
end
