# frozen_string_literal: true

# rubocop:disable Metrics/CyclomaticComplexity

class Grid

  @@grid_display = ""

  def initialize
    @grid = [%w[__1_ _2_ _3_], %w[__4_ _5_ _6_], %w[__7_ _8_ _9_]]
  end

  def display
    @grid.each do |row|
      row.each do |column|
        @@grid_display += column + "\t"
      end
      @@grid_display += "\n\n\n\n"
    end
    @@grid_display
  end

  def translate(pos, mark)
    case pos
    when 1
      @@grid_display[0][0] = mark
    when 2
      @@grid_display[0][1] = mark
    when 3
      @@grid_display[0][2] = mark
    when 4
      @@grid_display[1][0] = mark
    when 5
      @@grid_display[1][1] = mark
    when 6
      @@grid_display[1][2] = mark
    when 7
      @@grid_display[2][0] = mark
    when 8
      @@grid_display[2][1] = mark
    when 9
      @@grid_display[2][2] = mark
    else
      warning = 'position not valid. Please insert any number from 1 to 9'
      warning
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
