class Player
  
  attr_reader :name, :score
  
  def initialize(name, score)
    @name = name
    @score = score
  end
  
  def throw(frame_num)
    frame = @score.frames[frame_num-1]
    while !frame.is_throwed?
      remain_count = frame.get_remain_count
      knock_count = rand(3) == 0 ? remain_count : rand(remain_count+1)
      frame.set_throw(knock_count)
      @score.calc_score
      
      log
      sleep(0.25)
    end
  end
  
  def log
    puts name
    @score.log
    puts ""
  end
  
end