# For this popular algorithm interview question, the input will be a string consisting only of the characters 0, 1 and ?, where the ? acts as a wildcard that can be either a 0 or 1, and your goal is to print all possible combinations of the string. For example, if the string is "011?0" then your program should output a set of all strings, which are: ["01100", "01110"].

def patterns(str)
    result = []
    str.each_char do |char|
        if char == '?'
            result += result
            result = add_0_and_1(result)
        else
            result = add_char_to_each_el(result, char)
        end
    end
p result
    result
end

def add_0_and_1(arr)
    return ['0', '1'] if arr.empty?
    idx = 0
    while idx < arr.length / 2
        arr[idx] += + '0'
        idx += 1
    end

    while idx < arr.length
        arr[idx] += '1'
        idx += 1
    end

    arr
end

def add_char_to_each_el(arr, char)
    return [char] if arr.empty?
    idx = 0
    while idx < arr.length
        arr[idx] += char
        idx += 1
    end

    arr
end