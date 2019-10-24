#!/usr/bin/env ruby

# frozen_string_literal: true

puts "***************"
puts "**TIC TAC TOE**"
puts "*************** \n\n\n"

p "You and your friend should input your names to initialize the game \n\n\n"

print "Player X Enter name:"
player_x = gets.chomp

print "Player O Enter name:"
player_O = gets.chomp

print "\n\n\n"

print "#{player_x} is playing X and #{player_O} is playing O \n\n\n"

grid = [["__1__|", "_2__|", "_3__"], ["__4__|", "_5__|", "_6__"], ["__7__|", "_8__|", "_9__"]]
grid.each do |row|
    row.each do |col|
        print "#{col}\t "
    end
    puts " \n\n\n"
end

print "- Each player should make one move per turn.\n\n\n"
print "- To make a move, input the number of an empty cell that you wish to mark.\n\n\n"
print "- The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner \n\n\n"


play_first  = rand(0..1)

play_first = play_first === 0 ? player_O : player_x

puts "\n******************\n\n\n"
p "Player #{play_first} will play first"

# display prompt to move input to player 1

# execute function to display grid with players mark

# display prompt to move input to player 2

# execute function to display grid with players mark

# repeat the above until all cells are marked

# display result

# display prompt asking if they want to play again