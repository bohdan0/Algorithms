# Have the function HTMLElements(str) read the str parameter being passed which will be a string of HTML DOM elements and plain text. The elements that will be used are: b, i, em, div, p. For example: if str is "<div><b><p>hello world</p></b></div>" then this string of DOM elements is nested correctly so your program should return the string true. 

# If a string is not nested correctly, return the first element encountered where, if changed into a different element, would result in a properly formatted string. If the string is not formatted properly, then it will only be one element that needs to be changed. For example: if str is "<div><i>hello</i>world</b>" then your program should return the string div because if the first <div> element were changed into a <b>, the string would be properly formatted.

def html_elements(str)
    stack = []
    start_idxs = []
    end_idxs = []
    str.each_char.with_index do |char, idx|
        start_idxs << idx if char == '<'
        end_idxs << idx if char == '>'
    end

    0.upto(start_idxs.length - 1) do |idx|
        word = str[start_idxs[idx]..end_idxs[idx]]
        if word[1] == '/'
            old = stack.pop
            return old[1...-1] unless word[0] + word[2..-1] == old
        else
            stack << word
        end
    end
    
    stack.empty? ? true : stack.first[1...-1]
end