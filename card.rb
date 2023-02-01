#Class controlling individual cards
class Card
    

    def initialize(number, shape, color, shading)
        @number = number
        @shape = shape
        @color = color
        @shading = shading
    end

    #gets specified element of array by index
    def index(x)
        @deck[x]
    end

    def to_s
        "[#{@number}, #{@shape}, #{@color}, #{@shading}]"
    end
        
end