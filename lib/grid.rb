# frozen_string_literal: true

class Grid
  def initialize
    @grid = [%w[__1_ _2_ _3_], %w[__4_ _5_ _6_], %w[__7_ _8_ _9_]]
  end

  def display
    @grid.each do |row|
      row.each do |column|
        print column + "\t"
      end
      print "\n\n\n\n"
    end
  end

  def translator(pos, mark)
    case pos
    when 1
      @grid[0][0] = mark
    when 2
      @grid[0][1] = mark
    when 3
      @grid[0][2] = mark
    when 4
      @grid[1][0] = mark
    when 5
      @grid[1][1] = mark
    when 6
      @grid[1][2] = mark
    when 7
      @grid[2][0] = mark
    when 8
      @grid[2][1] = mark
    when 9
      @grid[2][2] = mark
    else
      puts 'position not valid. Please insert any number from 1 to 9'
    end
  end
end
