require 'date'
class Book
  @@count = 0
  @@library = []
  def self.count
    @@count
  end
  
  def self.all
    @@library
  end

  def self.all_checked_out
    out = ""
    @@library.each do |b|
      if b.status == :checked_out
        out += "\n title: #{b.title}, due: #{b.due_on}, borrower: #{b.borrower.name}"
      end
    end
    return out 
  end

  def self.all_overdue
    @@library.each do |b|
      puts "# title: {b.title}, checked out by #{b.borrower.name}, due on #{b.due_on}" if b.overdue?
    end
  end
  
  attr_reader :title, :author, :description, :owner, :due_on 
  attr_accessor :status, :borrower
  def initialize(opts = {})
    @title = opts[:title]
    @author = opts[:author]
    @description = opts[:description]
    @owner = opts[:owner]
    @@count += 1
    @@library.push(self)
    @status = :available
    @borrower = ''
  end

  def checkout_to(user)
    if user.allowed? and status == :available
      @status = :checked_out
      @borrower = user
      user.books_out[self.title.to_sym]=self
      now = Date.today
      @due_on = now + 7 
    else
      "implement raise execption"
    end 
  end

  def checkin
    @status = :available
    @borrower.books_out.delete(self.title.to_sym)
    @borrower = nil
    @due_on = nil
    if @status == :available && @borrower == nil && @due_on == nil
     return "Book Returned"
    end
  end

  def report_lost
    self.status = :lost
  end

  def overdue?
    if status == :overdue || Date.today > @due_on
      status = :overdue 
      return true
    else
      return false
    end
  end
end

class User
  
  attr_reader :name
  attr_accessor :books_out
  
  def initialize(name)
    @name = name
    @books_out = {}
  end

  def add_book(opts = {})
    attrs = opts
    attrs[:owner] = self
    Book.new(attrs)
  end

  def allowed?
    if books_out.has_value?(true) { |book| book.overdue? }
      return false
    elsif books_out.length > 1
      return false
    else 
      return true
    end
  end
end