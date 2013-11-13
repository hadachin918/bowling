class Game
  
  attr_reader :players
  
  def initialize()
    @players = []
  end
   
  def add_player(player)
    @players << player
  end  
  
  def start
    (1..FRAME_COUNT).each do |frame_num|
      @players.each { |player| player.throw(frame_num) }
    end
  end
  
end