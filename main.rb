#coding: utf-8

require "./game.rb"
require "./player.rb"
require "./strong_player.rb"
require "./weak_player.rb"
require "./score.rb"
require "./frame.rb"
require "./last_frame.rb"

FRAME_COUNT = 10
PIN_COUNT = 10

game = Game.new
game.add_player(StrongPlayer.new("プレイヤーA", Score.new))
game.add_player(WeakPlayer.new("プレイヤーB", Score.new))

game.start