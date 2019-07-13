module Enumerable
    def my_each
        for item in self do
            yield(item)
        end
        # while i < arr.length
        #     yield(arr)
        #     item = arr[i]
        #     i+=1
        # end
    end

    def my_each_with_index
        i=0
        for item in self do
            yield(item, i)
            i+=1
        end
    end

    def my_select
      arr=[]
      self.my_each do
            |item| arr << item if yield(item)
        end
        arr
    end

    def my_all?()
        check=false
        # for item in self do
        #     check=yield(item)
        #     break if not check 
        #     # yield(item) if true && not nil
        # end
        self.my_each do |item|
            check = yield(item)
            break if not check
        end
        check
    end

    def my_any?
        check = false
        self.my_each do |item|
            check=yield(item)
            break if check
        end 
        check
    end

    def my_none?
        check = false
        self.my_each do |item|
            check = !yield(item)
            break if not check
        end 
        check
    end

    def my_count
        self.length
    end

    def my_map(&proc)
        arr=[]
        return self unless proc or block_given?
        self.my_each do |item|   
            if block_given?
                arr << yield(item)
            else
                arr << proc.call(item)
            end
        end
        arr
    end

    def my_inject(*arg)
        ac=self[0]
        # self.my_each do |item|
        #     ac = yield(ac,item)
        # end
        # ac
        for item in self[1..self.length] do
            ac=yield(ac,item)
        end
        ac
    end
end

# def multiply_els(arr)
#    arr.my_inject do |item,e|
#      item * e
#    end
# end

# p multiply_els([2,4,5])

####### CHECK FOR my_select
# arr=[1,2,3,4,4]
# # arr.my_select do |item|
# #   puts  item.even?
# # end

# ###### CHECK FOR my_all?
# def all_ch(arr)
#     arr.my_all? do |item|
#         item.length >=2
#     end
# end
# str=["wordd", "any", "honey", "med", ""]
# p all_ch(str)

###### CHECK FOR my_any?
# def all_ch(arr)
#     arr.my_any? do |item|
#         item.length >=3
#     end
# end
# str=["wordd", "any", "honey", "med",""]
# p all_ch(str)

###### CHECK FOR my_none?
def all_ch(arr)
    arr.none? do |item|
        item.length >=2
    end
end
str=["wordd", "any", "honey", "med",""]
str2=[]
p all_ch(str)
p all_ch(str2)


