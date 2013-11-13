class Score
  
  attr_reader :frames, :total_score
  
  def initialize
    @frames = []
    (1..FRAME_COUNT-1).each { @frames << Frame.new }
    @frames << LastFrame.new
    @total_score = 0
  end
  
  def calc_score
    before_accum_score = 0
    @frames.each_with_index do |frame, i|
      #ストライク
      if frame.is_strike?
        bonus = get_next_throw_sum(i+1, 1, 2)
        frame.accum_score = before_accum_score + PIN_COUNT + bonus if bonus
      #スペア
      elsif frame.is_spare?
        bonus = get_next_throw_sum(i+1, 2, 1)
        frame.accum_score = before_accum_score + PIN_COUNT + bonus if bonus
      #オープン
      elsif frame.is_open?
        frame.accum_score = before_accum_score + frame.throws.reduce(:+)
      end
      before_accum_score = frame.accum_score if frame.is_calced?
    end
    @total_score = before_accum_score
  end
  
  def get_next_throw_sum(frame_num, throw_num, sum_count)
    next_throw_sum = 0
    (1..sum_count).each do
      next_frame_and_throw_num = get_next_frame_and_throw_num(frame_num, throw_num)
      if next_frame_and_throw_num
        frame_num, throw_num = next_frame_and_throw_num[0], next_frame_and_throw_num[1]
        next_throw_sum += @frames[frame_num-1].throws[throw_num-1]
      else
        return false
      end
    end
    next_throw_sum
  end
  
  def get_next_frame_and_throw_num(frame_num, throw_num)
    return frame_num, throw_num + 1 if @frames[frame_num-1].throws[throw_num]
    return frame_num + 1, 1 if @frames[frame_num] and @frames[frame_num].throws[0]
    false
  end
  
end