class Frame
  
  attr_reader :throws
  attr_accessor :accum_score
    
  def initialize
    @throws = []
    @accum_score = "-"
  end
  
  def get_remain_count
    @throws.size == 0 ? PIN_COUNT : PIN_COUNT - @throws.reduce(:+)
  end
  
  def set_throw(knock_count)
    @throws << knock_count
  end
  
  def is_calced?
    @accum_score.is_a?(Integer)
  end
  
  def is_throwed?
    is_strike? or is_spare? or is_open?
  end
  
  def is_strike?
    @throws.size == 1 and @throws.reduce(:+) == PIN_COUNT
  end
  
  def is_spare?
    @throws.size == 2 and @throws.reduce(:+) == PIN_COUNT
  end
  
  def is_open?
    @throws.size == 2 and @throws.reduce(:+) != PIN_COUNT
  end

end