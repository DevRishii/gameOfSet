#Class controlling individual cards
class Card
    

    def initialize(number, shape, color, shading)
        @number = number
        @shape = shape
        @color = color
        @shading = shading
    end

    #returns specified card feature by index
    def featureIndex(x)
        
        case x

        when x == 0
            return @number
        when x == 1
            return @shape
        when x == 2
            return @color
        when x == 3
            return @shading
        end

    end

    def to_s
        "[#{@number}, #{@shape}, #{@color}, #{@shading}]"
    end
        
end