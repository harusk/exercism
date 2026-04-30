module Transpose
    def self.transpose(input)
      return "" if input == ""
      @input = input.lines.map { |row| row.chomp }
      longest_row = @input.max {|a, b| a.length <=> b.length} 
      array1 = Array.new()
      @input.each do |row|
        position = 0
        array2 = Array.new(longest_row.length)
        row.each_char do |char|
            array2[position] = char
            position += 1
        end
        array1.push(array2)
      end
      array3 = Array.new()
      for i in 0..longest_row.length-1
        array4 = Array.new()
        for j in 0..array1.length-1
          array4[j] = array1[j][i]
        end
        array3.push(array4)
      end
      array4 = Array.new()
      array3.each do |row|
        row1 = row.reverse
        k = Array.new()
        for e in 0..row1.length
          if row1[e] != nil
            for m in e..row1.length-1
              row1[m] == nil ? k.push(" ") : k.push(row1[m])
            end
            break
          end
        end
        array4.push(k.reverse)
      end
      string_result = ""
      array4.each do |row|
        row.each { |e| string_result += e }
        string_result += "\n"
      end
      string_result.chomp
    end
end
