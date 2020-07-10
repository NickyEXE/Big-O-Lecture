require 'pry'

random_array = Array.new(1000){ rand(1...999) }
sorted_array = Array.new(1000){ rand(1...999)}.sort
sorted_super_size_array = Array.new(2000){ rand(1...999)}.sort
random_array2 = Array.new(10000){ rand(1...10000)}

def linear_search(arr, target_num)
    arr.each_with_index do |num, i|
        if num === target_num
            return num
        else
            puts "Remaining elements to search: #{arr.length - i}"
        end
    end
    return false
end

def binary_search(arr, target)
    puts("Remaining elements to search: #{arr.length}")

    # Find the middle item in the array
    midpoint = arr.length/2
    middle_item = arr[midpoint]

    # The case that we're looking at one item
    if arr.length <=1
        return middle_item === target ? target : false
    end

    # If the middle item is the target, we can return it.
    # Otherwise, if the target is less than the midpoint
    # Throw out all the items to the right of it and run this method again.
    # Otherwise, throw out all the items to the left of it and run this method again.
    if middle_item === target
        return target
    elsif middle_item >= target
        return binary_search(arr.slice(0, midpoint), target)
    elsif middle_item < target
        return binary_search(arr.slice(midpoint, arr.length), target)
    end
end



# const binarySearch = (arr, target) => {
#   console.log(`Remaining elements to search: ${arr.length}`);

#   const midpoint = Math.floor(arr.length / 2);
#   const middle = arr[midpoint];

#   if (arr.length <= 1) {
#     return middle === target ? target : false;
#   }

#   if (middle === target) {
#     #  we found the thing
#     return target
#   } else if (middle >= target) {
#     #  let's look in the first half
#     return binarySearch(arr.slice(0, midpoint), target);
#   } else if (middle < target){
#     #  let's look in the second half
#     return binarySearch(arr.slice(midpoint), target);
#   }
# };
# ```

# Initial Has Target Sum

def has_target_sum(arr, target)
    results = []
    arr.each do |current_num|
        arr.each do |next_num|
            if (current_num + next_num === target)
                results.push([current_num, next_num])
            end
        end
    end
    return results
end


# First Refactor

def has_target_sum_2(arr, target)
    results = []
    arr.each_with_index do |current_num, i|
        arr.slice(i, arr.length).each do |next_num|
            if (current_num + next_num === target)
                results.push([current_num, next_num])
            end
        end
    end
    return results
end

def has_target_sum_3(arr, target)
    results = []
    nums_i_have_seen = []
    arr.each do |current|
       target_paired_num = target - current
       if nums_i_have_seen.include?(target_paired_num)
         results.push([current, target_paired_num])
       end
       nums_i_have_seen.push(current)
    end
    return results
end

def has_target_sum_linear(arr, target)
    results = []
    nums_i_have_seen = {}
    arr.each do |current|
       target_paired_num = target - current
       if nums_i_have_seen[target_paired_num]
         results.push([current, target_paired_num])
       end
       nums_i_have_seen[current] = true
    end
    return results
end

binding.pry
