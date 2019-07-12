module Enumerable
    def my_each(arr*)
        i=0
        while yield(i, arr.length)>0
            item = arr[i]
            i+=1
        end
    end

    def my_each_with_index

    end

    def my_select

    end

    def my_all

    end

    def my_any

    end

    def my_none

    end

    def my_count
    
    end

    def my_map

    end

    def my_inject

    end

end