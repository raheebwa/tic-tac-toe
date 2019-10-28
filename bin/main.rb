#!/usr/bin/env ruby

# frozen_string_literal: true

load "lib/game.rb"


puts "***************"
puts "**TIC TAC TOE**"
puts "***************"

print "\n\n\n"


def game_play
p "You and your friend should input your names to initialize the game"

print "\n\n\n"

print "Player 1 Enter name: "
player_1 = gets.chomp

print "Player 2 Enter name: "
player_2 = gets.chomp

print "\n\n\n"

game = Game.new(player_1, player_2)
game.display

print "#{player_1} is playing X and #{player_2} is playing O \n\n\n"

puts "\n******************\n\n\n"
finished = false
while finished == false
  print "#{game.curr_player}, it's your turn! Input your choice: "
  prompt_move = gets.chomp.to_i
  game.make_move(prompt_move)
  if game.check_win == true
    puts "\n\n The Winner is #{game.winner.name}"
    finished = true
  elsif game.check_draw == true
    print "It's a draw!"
    finished = true
  end

end

end


play_again = true

while play_again

game_play

puts "Do you want to play again? (Enter 'Y' for yes or 'N' for no)"
reply = gets.chomp

reply.upcase === 'Y' ? play_again= true : play_again = false

end

# display prompt to move input to player 1

# execute function to display grid with players mark

# display prompt to move input to player 2

# execute function to display grid with players mark

# repeat the above 


