# Using the Ruby language, have the function BoggleSolver(strArr) read the array of strings stored in strArr, which will contain 2 elements: the first element will represent a 4x4 matrix of letters, and the second element will be a long string of comma-separated words each at least 3 letters long, in alphabetical order, that represents a dictionary of some arbitrary length. Your goal is to determine if all the comma separated words as the second parameter exist in the 4x4 matrix of letters

def boggle_solver(strArr)
    matrix = strArr.first.split(', ')
    words = strArr.last.split(',')
    result = []

    words.each do |word|
        if found?(word, matrix)
            result << word
        end
    end

    result.length == words.length ? true : (words - result).join(',')
end

def found?(word, matrix, used = [])
    matrix.each_with_index do |row, row_idx|
        row.each_char.with_index do |el, col_idx|
            if el == word[0] && one_away(used.last, [row_idx, col_idx])
                return true if word.length == 1 && !used.include?([row_idx, col_idx])
                return true if found?(word[1..-1], matrix, used + [[row_idx, col_idx]])
            end
        end
    end
    
    false
end

def one_away(prev, curr)
    return true unless prev
    neighbors = [
                    [-1, -1],
                    [-1, 0],
                    [-1, 1],
                    [0, 1],
                    [1, 1],
                    [1, 0],
                    [1, -1],
                    [0, -1]
                ]
    neighbors.each { |dir| return true if [prev[0] + dir[0], prev[1] + dir[1]] == curr }
    false
end