# each_char

module Acronym
  def self.abbreviate(name)
    single_words = Array.new
    word = String.new
    name.each_char do |char|
      if char.match(/[a-zA-Z]+/)
        word += char
      elsif word != ""
        single_words.push(word)
        word = ""
      end
    end
    single_words.push(word)
    acronym_result = ""
    single_words.each do |word|
      acronym_result += word[0].upcase
    end
    acronym_result
  end
end