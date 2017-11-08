class Book

@@on_shelf  = []
@@on_loan   = []
@@overdue   = []
@@current_due_date = 0

def initialize (book_title, author, isbn)
  @book_title = book_title
  @author = author
  @isbn = isbn
  due_date = 0
end

def book_title
  @book_title
end

def author
  @author
end

def isbn
  @isbn
end

def due_date
  @due_date
end

def book_title=(book_title)
  @book_title = book_title
end

def author=(author)
  @author = author
end

def isbn=(isbn)
  @isbn = isbn
end

def due_date=(due_date)
  @due_date=due_date
end

def self.create (book_title, author, isbn)
  new_book = Book.new(book_title, author, isbn)
  @@on_shelf << new_book
  return new_book
end

def self.available
  @@on_shelf.each do |book|
    puts "Available"
    puts "Title: #{ book.book_title }"
    puts "Author: #{ book.author  }"
    puts "ISBN: #{ book.isbn } "
  end
end

def self.borrowed
  @@on_loan.each do |book|
    puts "Out on Loan"
    puts "Title: #{ book.book_title }"
    puts "Author: #{ book.author  }"
    puts "ISBN: #{ book.isbn } "
  end
end

def self.browse
  puts "Why not try #{ @@on_shelf.sample.book_title }?"
end

def lent_out?(book)
    if @@on_shelf.index(book)==nil
      puts "#{@book_title } is out on loan."
      return true
    else
      puts "#{@book_title } is available to borrow."
      return false
    end
end

def self.current_due_date
  @@current_due_date = Time.new+1209600
  puts @@current_due_date.strftime("%d-%m-%Y")
end

def borrow (book)
    if lent_out?(book)
      return false
    else
      @due_date = @@current_due_date
      puts "The due date for #{@book_title} is #{@due_date.strftime("%d-%m-%Y")}."
      @@on_loan << book
      @@on_shelf.delete(book)
      return true
    end
end

def return_to_library (book)
  if lent_out?(book)
    @@on_loan.delete(book)
    @@on_shelf << book
    @due_date = nil
    return true
  else
    return false
  end
end

def self.overdue
  @@on_loan.each do |book|
    if book.due_date < Time.new
      puts "#{book.book_title} overdue!"
      @@overdue << book
    end
  end
end



end

book1 = Book.create("book1", "author1", 11111)
book2 = Book.create("book2", "author2", 22222)
book3 = Book.create("book3", "author3", 33333)

Book.available

Book.browse

book1.lent_out?(book1)

Book.current_due_date

book1.borrow(book1)
Book.available
Book.borrowed
book1.borrow(book1)
book1.return_to_library(book1)
Book.available
Book.borrowed

book1.borrow(book1)
book1.due_date = Time.new - 1000000
Book.overdue
