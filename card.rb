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

        when 0
            return @number
        when 1
            return @shape
        when 2
            return @color
        when 3
            return @shading
        end

    end

    def to_s
        "[#{@number}, #{@shape}, #{@color}, #{@shading}]"
    end
        
end