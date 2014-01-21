require 'minitest/autorun'
require_relative 'Library.rb'
class TestBook < MiniTest::Test

  def setup
    @User = User.new("Jim")
    @info = {author: "jon", title: "an affair", description:"things happened", owner: @User}
    @Book = Book.new(@info)
  end

  def test_author
    assert_equal "jon", @Book.author
  end

  def test_title
    assert_equal "an affair", @Book.title
  end

  def test_description
    assert_equal "things happened", @Book.description
  end

  def test_owner
    assert_instance_of User, @Book.owner
  end

  def test_status
    assert_kind_of Symbol, @Book.status
  end

  def test_all
    assert_instance_of Array, Book.all
    assert_kind_of Integer , Book.all.length
    assert_instance_of Book, Book.all[0]
  end

  def test_checkout
    @Book.checkout_to(@User)
    #set status
    assert_equal :checked_out, @Book.status
     
    #associate with user
    assert_instance_of User, @Book.borrower
    assert_includes(@User.books_out, @Book.title.to_sym)

    assert_instance_of Date, @Book.due_on

  end

  def test_checkin
    #pre
    @Book.checkout_to(@User)
    refute_equal :available, @Book.status
    refute_nil @Book.borrower
    #setup
    @Book.checkin
    #test
    assert_equal :available, @Book.status
    assert_nil @Book.borrower
    assert_nil @Book.due_on
  end

  def test_report_lost  
    assert_equal :lost, @Book.report_lost
  end

  def test_all_overdue
    
  end

  def test_all_checked_out
    assert_equal "\n title: an affair, due: 2014-01-26, borrower: Jim", Book.all_checked_out
  end

end

class TestUser < MiniTest::Test
  def setup
    @User = User.new('Jim')
    info = {author: "jon", title: "an affair", description:"things happened", owner: @User} 
    info2 = {author: "harry", title: "Global Fire", description:"less stuff", owner: @User} 
    info3 = {author: "Mac", title: "Fiddle", description:"more happenings", owner: @User} 

    @book = Book.new(info)
    @book2 = Book.new(info2)
    @book3 = Book.new(info3)
  end

  def test_name
    assert_equal "Jim", @User.name
  end

  def test_add_book
    assert_instance_of Book, @User.add_book(author: "jon", title: "an affair", description:"things happened")
  end

  def test_books_out
    assert_kind_of Hash, @User.books_out
    assert_respond_to @User.books_out, :length
    refute_equal 3, @User.books_out.length
    refute_equal 4, @User.books_out.length
    refute_equal 5, @User.books_out.length
  end

  def test_allowed
    assert_equal true, @User.allowed?
  end

  def test_not_allowed
    #setup 
      @book.checkout_to(@User) 
        assert_includes @User.books_out, @book.title.to_sym     
        # assert_equal true, @User.books_out.keys
      @book2.checkout_to(@User)
        assert_includes @User.books_out, @book2.title.to_sym  
    #end setup
    assert_equal 2, @User.books_out.length
    refute_equal true, @User.allowed?
  end
end

# [DONE] Books should be able to have information saved about them (author, title, description)

# [done] Users should be able to add books to a library

# [done] A user should not be able to check out more than two books at any given time
# [done] Checked-out books should be associated with a user


# [done] A user should be able to check out books from the library for one week intervals
# [done] Users with overdue books should not be able to request any new books until they turn all their overdue books in

# [done] Users should be able to check in books to the library when they're finished with them
# [DONE] Users should be able to check a book's status (e.g. available, checked out, overdue or lost)

# [done] Users should be able to see a list of who has checked out which book and when those books are due to be returned
# Users should be able to see a list of books that are overdue
