# Amazon Challenge
#
# Create a Ruby terminal app that let's you borrow or by books from your own Amazon-like service
# Your Amazon service needs a recommendation engine which will help the user find new books to borrow or buy
# Be creative with how your recommendation engine thinks!!
#
# 3 groups chosen by Jamie will present their ideas

class Book

  def initialize(name, author, genre)
    @name = name
    @author = author
    @genre = genre
  end

  attr_accessor :name, :author, :genre

  def self.all #this points to all objects in itself (ie the class Song)
    ObjectSpace.each_object(self).to_a #This grabs every object from the Song class and puts it into an array
  end

end

class Genre

  def initialize(name)
    @name = name
  end

  attr_accessor :name
end

class Author

  def initialize(name)
    @name = name
  end

  attr_accessor :name
end

romance = Genre.new("Romance")
scifi = Genre.new("Sci-fi")
fantasy = Genre.new("Fantasy")

# romance authors
nora_roberts = Author.new("Nora Roberts")
jane_austen = Author.new("Jane Austen")
julie_garwood = Author.new("Julie Garwood")

# fantasy authors
tolkien = Author.new("J.R.R Tolkien")
martin = Author.new("George R.R. Martin")
king = Author.new("Stephen King")

# sci fi authors
dick = Author.new("Philip K. Dick")
asimov = Author.new("Isaac Asimov")
bradbury = Author.new("Ray Bradbury")

# romance books
Book.new("The Next Always", nora_roberts, romance)
Book.new("Playing the Odds", nora_roberts, romance)
Book.new("One man's art", nora_roberts, romance)
Book.new("Pride and Prejudice", jane_austen, romance)
Book.new("Emma", jane_austen, romance)
Book.new("Persuasion", jane_austen, romance)
Book.new("Shadow Dance", julie_garwood, romance)
Book.new("Shadow Music", julie_garwood, romance)
Book.new("The Lion's Lady", julie_garwood, romance)

# fantasy books
Book.new("The Hobbit", tolkien, fantasy)
Book.new("The Lord of the Rings", tolkien, fantasy)
Book.new("The Two Towers", tolkien, fantasy)
Book.new("Game of Thrones", martin, fantasy)
Book.new("Clash of Kings", martin, fantasy)
Book.new("Winds of Winter", martin, fantasy)
Book.new("The Shining", king, fantasy)
Book.new("Carrie", king, fantasy)
Book.new("Misery", king, fantasy)

#scifi
Book.new("A Scanner Darkly", dick, scifi)
Book.new("The Man in the High Castle", dick, scifi)
Book.new("A Maze of Death", dick, scifi)
Book.new("Foundation", asimov, scifi)
Book.new("I Robot", asimov, scifi)
Book.new("The Caves of Steel", asimov, scifi)
Book.new("Fahrenheit 451", bradbury, scifi)
Book.new("The Martian Chronicles", bradbury, scifi)
Book.new("The Illustrated Man", bradbury, scifi)

@fantasy = 0
@scifi= 0
@romance = 0


def quiz

  valid = 0
  while valid == 0
    case @input
      when "1"
        @fantasy += 1
        valid = 1
      when "2"
        @scifi += 1
        valid = 1
      when "3"
        @romance += 1
        valid = 1
      else
        puts "I don't understand"
        @input = gets.chomp
        valid = 0
      end
  end
end

puts "Hello, welcome to amazin Amazon!"
puts "We would like to know more about you, please answer the following"

puts "Which of the following do you like the best?"
puts "[1] dragons, [2]spaceships, [3]some hot guy"
@input = gets.chomp

quiz
puts "Which one is your favourite"
puts "[1] broomstick, [2] aliens, [3] kissing"
@input = gets.chomp
quiz
puts "Which character do you want to be?"
puts "[1] elf, [2] astronaut, [3] damsel"
@input = gets.chomp
quiz
puts "When you die, where do you want to go"
puts "[1] dungeon, [2] space, [3] bed"
@input = gets.chomp
quiz

tally_array = []
tally_array << @fantasy
tally_array << @scifi
tally_array << @romance

genre_array = ["fantasy", "scifi", "romance"]

puts
puts tally_array
puts

category = genre_array[tally_array.index(tally_array.max)]
puts category

romance_books = Book.all

romance_books.each do |book|
  puts romance_books
end
