#!/usr/bin/env ruby

# frozen_string_literal: true

puts "***************"
puts "**TIC TAC TOE**"
puts "***************"

p "Player X Enter name: "
player_x = gets.chomp

p "Player O Enter name: "
player_O = gets.chomp

puts "#{player_x} is playing X and #{player_O} is playing O"

play_first  = rand(0..1)

play_first = play_first === 0 ? player_O : player_x

puts "\n******************"
puts "Player #{play_first} will play first"

#TODO
#Instructions for the game line 8
# PLay empty grid

grid = [["*", "*", "*"], ["*", "*", "*"], ["*", "*", "*"]]

grid.each do |row|
    row.each do |col|
        print "#{col}\t "
    end
    puts " \n\n\n"
end