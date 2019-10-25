#!/usr/bin/env ruby

# frozen_string_literal: true

load "lib/game.rb"


puts "***************"
puts "**TIC TAC TOE**"
puts "***************"

print "\n\n\n"

p "You and your friend should input your names to initialize the game"

print "\n\n\n"

print "Player 1 Enter name:"
player_1 = gets.chomp

print "Player 2 Enter name:"
player_2 = gets.chomp

print "\n\n\n"

game = Game.new(player_1, player_2)
game.display

print "#{player_1} is playing X and #{player_2} is playing O \n\n\n"

puts "\n******************\n\n\n"

while game.status == false
  p "#{game.curr_player}, it's your turn! Input your choice."
  prompt_move = gets.chomp
  game.make_move(prompt_move)


end
    
# display prompt to move input to player 1
p "input your move"
prompt_move = gets.chomp


# execute function to display grid with players mark

# display prompt to move input to player 2

# execute function to display grid with players mark

# repeat the above 

if game_won || game_ended || game_drawn
    # display winner & prompt for replay
    game_status = false
    
end

