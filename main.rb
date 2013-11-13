#coding: utf-8

require "./game.rb"
require "./player.rb"
require "./score.rb"
require "./frame.rb"
require "./last_frame.rb"

FRAME_COUNT = 10
PIN_COUNT = 10
player_names = ["プレイヤーA", "プレイヤーB"]

game = Game.new
player_names.each do |player_name|
  game.add_player(Player.new(player_name, Score.new))
end
game.start