# Amazon Challenge
#
# Create a Ruby terminal app that let's you borrow or by books from your own Amazon-like service
# Your Amazon service needs a recommendation engine which will help the user find new books to borrow or buy
# Be creative with how your recommendation engine thinks!!
#
# 3 groups chosen by Jamie will present their ideas

system("clear")

class Book

  def initialize(id, title, author, genre, rating)
    @id = id
    @title = title
    @author = author
    @genre = genre
    @rating = rating
  end

  attr_accessor :id, :title, :author, :genre, :rating

  def self.all #this points to all objects in itself (ie the class Book)
    ObjectSpace.each_object(self).to_a.reverse #This grabs every object from the Book class and puts it into an array
    # .reverse was added because the order was reversed for some reason
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
Book.new("1", "The Next Always", roberts, romance, 4.1)
Book.new("2", "Playing the Odds", roberts, romance, 4)
Book.new("3", "One man's art", roberts, romance, 4)
Book.new("4", "Pride and Prejudice", austen, romance, 4.2)
Book.new("5", "Emma", austen, romance, 4)
Book.new("6", "Persuasion", austen, romance, 4.1)
Book.new("7", "Shadow Dance", garwood, romance, 4)
Book.new("8", "Shadow Music", garwood, romance, 3.9)
Book.new("9", "The Lion's Lady", garwood, romance, 4.2)

# fantasy books
Book.new("1", "The Hobbit", tolkien, fantasy, 4.2)
Book.new("2", "The Lord of the Rings", tolkien, fantasy, 4.5)
Book.new("3", "The Two Towers", tolkien, fantasy, 4.4)
Book.new("4", "Game of Thrones", martin, fantasy, 4.4)
Book.new("5", "Clash of Kings", martin, fantasy, 4.4)
Book.new("6", "Dance of Dragons", martin, fantasy, 4.3)
Book.new("7", "The Shining", king, fantasy, 4.2)
Book.new("8", "Carrie", king, fantasy, 3.9)
Book.new("9", "Misery", king, fantasy, 4.1)

# scifi books
Book.new("1", "A Scanner Darkly", dick, scifi, 4)
Book.new("2", "The Man in the High Castle", dick, scifi, 3.7)
Book.new("3", "A Maze of Death", dick, scifi, 3.8)
Book.new("4", "Foundation", asimov, scifi, 4.1)
Book.new("5", "I Robot", asimov, scifi, 4.2)
Book.new("6", "The Caves of Steel", asimov, scifi, 4.1)
Book.new("7", "Fahrenheit 451", bradbury, scifi, 4)
Book.new("8", "The Martian Chronicles", bradbury, scifi, 4.1)
Book.new("9", "The Illustrated Man", bradbury, scifi, 4.1)

def classification
  puts "Would you like [1] fantasy, [2] sci-fi, or [3] romance?"
  user = gets.chomp

  def printing_genre(title_genre)
    Book.all.each do |a|
      if a.genre.type == title_genre
        print a.id + " "
        print a.title + " by "
        puts a.author.name
        print "rating: "
        puts a.rating
        puts
      end # end if statement
    end # end book loop
  end

  loop do
    case user
      when "1"
        printing_genre("Fantasy") # This will call printing_genre method and pass "Fantasy" as title_genre
        @cart_genre = "Fantasy" # This sets a variable used to check whether the book is "Fantasy" while looping through all the books
        @cart_author = nil # This sets the author as nil; prevents the loop to return true if there's an author assigned from the writer method
        @category = nil # This is the same as above; prevents the loop to return true if there's a genre/category assigned
        break # this breaks the loop

      when "2"
        printing_genre("Sci-fi")
        @cart_genre = "Sci-fi"
        @cart_author = nil
        @category = nil
        break

      when "3"
        printing_genre("Romance")
        @cart_genre = "Romance"
        @cart_author = nil
        @category = nil
        break

      else
        puts "I don't understand"
        user = gets.chomp
    end # end case statement
  end # end loop

  #talk # calling the talk method
  borrow # calling the borrow method

end # end classification method

def writer
  puts "Which of the following authors would you like to choose?"
  puts "[1] Nora Roberts      [2] Jane Austen          [3] Julie Garwood"
  puts "[4] J.R.R. Tolkien    [5] George R.R. Martin   [6] Stephen King"
  puts "[7] Philip K. Dick    [8] Isaac Asimov         [9] Ray Bradbury"
  user = gets.chomp

  def printing(book_writer)
    Book.all.each do |a|
      if a.author.name == book_writer
        print a.id + " "
        puts a.title
      end # end if/else statement
    end # end book array loop
  end # end printing method

  loop do
    case user
      when "1"
        printing("Nora Roberts")
        @cart_author = "Nora Roberts"
        @cart_genre = nil
        @category = nil
        break

      when "2"
        printing("Jane Austen")
        @cart_author = "Jane Austen"
        @cart_genre = nil
        @category = nil
        break

      when "3"
        printing("Julie Garwood")
        @cart_author = "Julie Garwood"
        @cart_genre = nil
        @category = nil
        break

      when "4"
        printing("J.R.R. Tolkien")
        @cart_author = "J.R.R. Tolkien"
        @cart_genre = nil
        @category = nil
        break

      when "5"
        printing("George R.R. Martin")
        @cart_author = "George R.R. Martin"
        @cart_genre = nil
        @category = nil
        break

      when "6"
        printing("Stephen King")
        @cart_author = "Stephen King"
        @cart_genre = nil
        @category = nil
        break

      when "7"
        printing("Julie Garwood")
        @cart_author = "Julie Garwood"
        @cart_genre = nil
        @category = nil
        break

      when "8"
        printing("Isaac Asimov")
        @cart_author = "Isaac Asimov"
        @cart_genre = nil
        @category = nil
        break

      when "9"
        printing("Ray Bradbury")
        @cart_author = "Ray Bradbury"
        @cart_genre = nil
        @category = nil
        break

      else
        puts "I don't understand"
        user = gets.chomp
    end # end case statement
  end # end loop

  borrow # calling the borrow method
end # end writer method

# This quiz method is used for recommending books to the user. It asks the user questions and
# recommends books based on the user's answers.
# Every answer is biased to a particular genre. Each answer will add 1 to a genre tally.
# The genre with the highest tally will be recommended. Each genre starts at 0.
@fantasy = 0
@scifi= 0
@romance = 0
def quiz

  loop do
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
  end # end  loop

end # end quiz method

# run this method when user chooses recommendation
def recommendation

  puts "We would like to know more about you, please answer the following"

  puts "Which of the following do you like the best?"
  puts "[1] dragons, [2] spaceships, [3] a hot guy/chick"
  @input = gets.chomp
  quiz
  puts "Which one is your favourite thing?"
  puts "[1] broomstick, [2] aliens, [3] kissing"
  @input = gets.chomp
  quiz
  puts "Which character do you want to be?"
  puts "[1] elf, [2] astronaut, [3] damsel"
  @input = gets.chomp
  quiz
  puts "What is your favourite place?"
  puts "[1] dungeon, [2] outer space, [3] bed ;)"
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
  @category = genre_array[tally_array.index(tally_array.max)]
  puts @category
  puts

  # This array loop looks for books with the genre with the highest tally
  Book.all.each do |a|
    if a.genre.type == @category
      print a.id + " "
      print a.title + " by "
      puts a.author.name
      puts
    end
  end # end book array loop

  borrow # calling the borrow method

end # end recommendation method

@shopping_cart = []

# This method is called when users want to buy a book
# This method adds the chosen book to the shopping_cart array
def add_to_cart


  puts "Which of these do you want? Please enter number"
  user = gets.chomp

  Book.all.each do |a|
      if (a.id == user) && ((a.genre.type == @cart_genre) || (a.author.name == @cart_author) || (a.genre.type == @category))
      print a.id + " "
      print a.title + " by "
      puts a.author.name
      puts
      input = a.title + " by " + a.author.name
      @shopping_cart << input
      puts "You have bought: "
      puts @shopping_cart
      puts
    end # end if statement
  end # end book loop

  intro

end # end add_to_cart method

def view_cart
  if @shopping_cart.length == 0 # If shopping_cart array has nothing in it, the length will equal to 0
    puts "You haven't bought anything yet"
    puts
    intro
  else
    puts "You have bought:"
    puts @shopping_cart
    puts
    intro
  end
end

# def talk
#   puts "Would you like to hear a short description on any of these books? [y/n]"
#   user = gets.chomp
#
#   loop do
#     case user
#     when "y"
#     when "n"
#     else
#       puts "I don't understand"
#       user = gets.chomp
#   end # end loop
# end # end talk method

# This method runs after listing all the available books
def borrow
  puts "Would you like to buy any of these books? [y/n]"
  user = gets.chomp.downcase

  loop do
    case user
      when "y"
        add_to_cart
        break

      when "n"
        intro
        break

      else
        "I don't understand"
        user = gets.chomp
    end # end case statement
  end # end loop

end # end borrow method

# This method is what you see first when the program runs
def intro
  puts "Would you like to browse by [1] genre, [2] author, see our [3] recommendation, [4] see your shopping cart or [5] exit?"
  user = gets.chomp


  loop do
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

      when "4"
        view_cart
        break

      when "5"
        puts
        puts "Thanks for using amaing Amazon\n\n"
        puts "Goodbye!\n\n"
        break

      else
        puts "I don't understand"
        user = gets.chomp
    end # end case statement

  end # end  loop

end # end intro method

# Program starts here
puts "Hello, welcome to amazin Amazon!"
intro # call intro method
