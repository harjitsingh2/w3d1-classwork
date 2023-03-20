class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end 
        self 
    end 

    def my_select(&prc)
        array = []
        old_array = self.my_each(&prc)

        i = 0
        while i < old_array.length
            if prc.call(old_array[i])
                array << old_array[i]
            end
            

            i += 1
        end
        array
        
    end

    def my_reject(&prc)
        array = []
        i = 0

        while i < self.length 
            if !prc.call(self[i])
                array << self[i]
            end 
            i += 1
        end 
        array 
    end 

    def my_any?(&prc)

        i = 0
        while i < self.length
            return true if prc.call(self[i])

            i += 1
        end
        false

    end

    def my_all?(&prc)

        i = 0
        while i < self.length
            return false if !prc.call(self[i])

            i += 1
        end
        true

    end

    def my_flatten
        array = []
        # condition 1: is the element an array?
        self.each do |el|
            if el.is_a?(Array) 
                array += el.my_flatten 
            else 
                array << el 
            end 
        end 
        array   

    end 

end 
