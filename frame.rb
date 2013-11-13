class Frame
  
  attr_reader :throws
  attr_accessor :accum_score
    
  def initialize
    @throws = []
    @accum_score = nil
  end
  
  def remain
    PIN_COUNT - knocks
  end
  
  def <<(knock_count)
    @throws << knock_count
  end
  
  def is_calced?
    !@accum_score.nil?
  end
  
  def is_throwed?
    is_strike? or is_spare? or is_open?
  end
  
  def is_strike?
    @throws.size == 1 and knocks == PIN_COUNT
  end
  
  def next
    # ..?
  end
  
  def is_spare?
    @throws.size == 2 and knocks == PIN_COUNT
  end
  
  def is_open?
    @throws.size == 2 and knocks != PIN_COUNT
  end
  
  def knocks
    @throws.reduct(0, :+)
  end
end