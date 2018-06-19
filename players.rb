
class Player
 
  attr_accessor :name


  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_a_life()
    @lives = @lives-1
    puts "#{@name} has #{@lives} left"
    
  end

  def dead?
    if @lives<=0
      puts "#{@name} is out! Game Over!"
      return true
    end
  end

end
