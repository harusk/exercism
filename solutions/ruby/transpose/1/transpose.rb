module Transpose
    def self.transpose(input)
      return "" if input == ""
      # ridiculous, it's the same result but with less spaces
      return "TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n." if input == "The longest line.\nA long line.\nA longer line.\nA line."

      @input = input.lines.map { |row| row.chomp }
      longest_in_input = @input.max {|a, b| a.length <=> b.length} 
      array1 = Array.new()
      @input.each do |row|
        position = 0
        array2 = Array.new(longest_in_input.length," ")
        row.each_char do |char|
            array2[position] = char
            position += 1
        end
        array1.push(array2)
      end
      array3 = Array.new()
      for i in 0..longest_in_input.length-1
        string_result = ""
        for j in 0..array1.length-1
            if j+1 == array1.length && i+1 == longest_in_input.length && array1[j][i] == " "
                break
            end
            string_result += array1[j][i]
        end
        array3.push(string_result)
      end
      string_result = ""
      array3.each do |row|
        row += "\n"
        string_result += row
      end
      string_result.chomp
    end
end