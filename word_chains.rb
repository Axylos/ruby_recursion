require 'set'
class WordChainer
  attr_accessor :dictionary
  
  def initialize(dictionary_file_name)
    @dictionary = Set.new
    File.foreach(dictionary_file_name) do |word|
      @dictionary.add(word.chomp)
    end
  end
  
  
  def adjacent_words(word)
    adjacent_words = []
    dict_by_length = @dictionary.select do |dict_word| 
      dict_word.length == word.length
    end
    dict_by_length.each do |dict_word|
      changes = 0
      word.length.times do |i|
        changes += 1 if word[i] != dict_word[i]
      end
      adjacent_words << dict_word if changes == 1
    end
    adjacent_words
  end
  
  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]
    
    while !@current_words.empty?
      new_current_words = []
      @current_words.each do |current_word|
        adj_words = adjacent_words(current_word)
        adj_words.each do |adj_word|
          next if @all_seen_words.include? adj_word
          new_current_words << adj_word
          @all_seen_words << adj_word
        end  
      end
      puts new_current_words
      @current_words = new_current_words
    end
  end
end