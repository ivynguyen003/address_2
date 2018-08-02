require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View entry number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    
  case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2 
      system "clear"
      entry_by_number
      main_menu
    when 3 
      system "clear"
      create_entry
      main_menu
    when 4 
      system "clear"
      search_entries
      main_menu
    when 5
      system "clear"
      read_csv
      main_menu
    when 6
      puts "Good-bye!"
      exit(0) #terminate the program
    else
      system "clear"
      puts "Sorry, that is not a valid"
      main_menu #invalid entry and prompt user to retry
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu(entry)
    end

      system "clear"
      puts "End of entries"
  end

  def entry_by_number
    print "Enter entry number: "
    entry_number = gets.chomp
    convert_number = entry_number.to_i

    entry = address_book.entries[convert_number-1]
    count_el = address_book.entries.count
    if convert_number <= count_el
      puts entry.to_s 
    else 
      puts "Sorry, that is not a valid entry!"
      entry_by_number
    end
  end


  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection 
      when "n"
    
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end    

  end
end