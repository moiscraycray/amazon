# Amazon Challenge
#
# Create a Ruby terminal app that let's you borrow or by books from your own Amazon-like service
# Your Amazon service needs a recommendation engine which will help the user find new books to borrow or buy
# Be creative with how your recommendation engine thinks!!
#
# 3 groups chosen by Jamie will present their ideas

system("clear")

class Book

  def initialize(title, author, genre)
    @title = title
    @author = author
    @genre = genre
  end

  attr_accessor :title, :author, :genre

  def self.all #this points to all objects in itself (ie the class Book)
    ObjectSpace.each_object(self).to_a #This grabs every object from the Book class and puts it into an array
  end
end # end book class

class Genre

  def initialize(type)
    @type = type
  end

  attr_accessor :type
end # end genre class

class Author

  def initialize(name)
    @name = name
  end

  attr_accessor :name
end # end author class

romance = Genre.new("Romance")
scifi = Genre.new("Sci-fi")
fantasy = Genre.new("Fantasy")

# romance authors
roberts = Author.new("Nora Roberts")
austen = Author.new("Jane Austen")
garwood = Author.new("Julie Garwood")

# fantasy authors
tolkien = Author.new("J.R.R. Tolkien")
martin = Author.new("George R.R. Martin")
king = Author.new("Stephen King")

# sci fi authors
dick = Author.new("Philip K. Dick")
asimov = Author.new("Isaac Asimov")
bradbury = Author.new("Ray Bradbury")

# romance books
Book.new("The Next Always", roberts, romance)
Book.new("Playing the Odds", roberts, romance)
Book.new("One man's art", roberts, romance)
Book.new("Pride and Prejudice", austen, romance)
Book.new("Emma", austen, romance)
Book.new("Persuasion", austen, romance)
Book.new("Shadow Dance", garwood, romance)
Book.new("Shadow Music", garwood, romance)
Book.new("The Lion's Lady", garwood, romance)

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

# scifi books
Book.new("A Scanner Darkly", dick, scifi)
Book.new("The Man in the High Castle", dick, scifi)
Book.new("A Maze of Death", dick, scifi)
Book.new("Foundation", asimov, scifi)
Book.new("I Robot", asimov, scifi)
Book.new("The Caves of Steel", asimov, scifi)
Book.new("Fahrenheit 451", bradbury, scifi)
Book.new("The Martian Chronicles", bradbury, scifi)
Book.new("The Illustrated Man", bradbury, scifi)

def classification
  puts "Would you like [1] fantasy, [2] sci-fi, or [3] romance?"
  user = gets.chomp

  valid = 0
  while valid == 0
    case user
      when "1"
        Book.all.each do |a|
          if a.genre.type == "Fantasy"
            print a.title + " by "
            puts a.author.name
            puts
          end # end if statement
        end # end book loop
        break # this breaks the loop

      when "2"
        Book.all.each do |a|
          if a.genre.type == "Sci-fi"
            print a.title + " by "
            puts a.author.name
            puts
          end # end if statement
        end # end book loop
        break

      when "3"
        Book.all.each do |a|
          if a.genre.type == "Romance"
            print a.title + " by "
            puts a.author.name
            puts
          end # end if statement
        end # end book loop
        break

      else
        puts "I don't understand"
        user = gets.chomp
    end # end case statement
  end # end while loop

end # end classification method

def writer
  puts "Which of the following authors would you like to choose?"
  puts "[1] Nora Roberts      [2] Jane Austen          [3] Julie Garwood"
  puts "[4] J.R.R. Tolkien    [5] George R.R. Martin   [6] Stephen King"
  puts "[7] Philip K. Dick    [8] Isaac Asimov         [9] Ray Bradbury"
  user = gets.chomp

  valid = 0
  while valid == 0
    case user
      when "1"
        Book.all.each do |a|
          if a.author.name == "Nora Roberts"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "2"
        Book.all.each do |a|
          if a.author.name == "Jane Austen"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "3"
        Book.all.each do |a|
          if a.author.name == "Julie Garwood"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "4"
        Book.all.each do |a|
          if a.author.name == "J.R.R. Tolkien"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "5"
        Book.all.each do |a|
          if a.author.name == "George R.R. Martin"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "6"
        Book.all.each do |a|
          if a.author.name == "Stephen King"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "7"
        Book.all.each do |a|
          if a.author.name == "Julie Garwood"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "8"
        Book.all.each do |a|
          if a.author.name == "Isaac Asimov"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      when "9"
        Book.all.each do |a|
          if a.author.name == "Ray Bradbury"
            puts a.title
          end # end if/else statement
        end # end book array loop
        break

      else
        puts "I don't understand"
        user = gets.chomp
    end # end case statement
  end # end while loop
end # end writer method

# This quiz method is used for recommending books to the user. It asks the user questions and
# recommends books based on the user's answers.
# Every answer is biased to a particular genre. Each answer will add 1 to a genre tally.
# The genre with the highest tally will be recommended. Each genre starts at 0.
@fantasy = 0
@scifi= 0
@romance = 0
def quiz

  valid = 0
  while valid == 0
    case @input
      when "1"
        @fantasy += 1
        break

      when "2"
        @scifi += 1
        break

      when "3"
        @romance += 1
        break

      else
        puts "I don't understand"
        @input = gets.chomp
      end # end case statement
  end # end while loop

end # end quiz method

# run this method when user chooses recommendation
def recommendation

  puts "We would like to know more about you, please answer the following"

  puts "Which of the following do you like the best?"
  puts "[1] dragons, [2] spaceships, [3] a hot guy/chick"
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
  puts "[1] dungeon, [2] space, [3] bed ;)"
  @input = gets.chomp
  quiz

  # After the tally's been added up, they're pushed into the tally_array
  tally_array = []
  tally_array << @fantasy << @scifi << @romance

  genre_array = ["Fantasy", "Sci-fi", "Romance"]

  puts
  puts tally_array
  puts

  # This finds the genre with the highest tally and assign it as category
  category = genre_array[tally_array.index(tally_array.max)]
  puts category
  puts

  # This array loop looks for books with the genre with the highest tally
  Book.all.each do |a|
    if a.genre.type == category
      print a.title + " by "
      puts a.author.name
      puts
    end
  end # end book array loop

end # end recommendation method

# Program starts here
puts "Hello, welcome to amazin Amazon!"
puts "Would you like to browse by [1] genre, [2] author, or see our [3] recommendation?"
user = gets.chomp

valid = 0
while valid == 0
  case user
    when "1"
      classification
      break

    when "2"
      writer
      break

    when "3"
      recommendation
      break

    else
      puts "I don't understand"
      user = gets.chomp
  end # end case statement
end # end while loop
