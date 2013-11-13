class Player
  
  attr_reader :name, :score
  
  def initialize(name, score)
    @name = name
    @score = score
  end
  
  def throw(frame_num)
    frame = @score.frames[frame_num-1]
    while !frame.is_throwed?
      knock_count = knock(frame.get_remain_count)
      frame.set_throw(knock_count)
      @score.calc_score
      
      log; sleep(0.25)
    end
  end

  protected

  def knock(remain_count)
    raise NotImplementedError
  end

  private

  def log
    puts name
    @score.frames.each_with_index do |frame, i|
      puts "第#{i+1}フレーム"
      frame.throws.each_with_index { |throw, j| print "#{j+1}投目：#{throw}　" }
      puts "累積スコア：#{frame.accum_score}"
    end
    puts ""
  end


  
end