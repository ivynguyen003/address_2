require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do 
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ivy','000.111.2222','ivy.awesome@possom.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ivy','000.111.2222','ivy.awesome@possom.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ivy')
      expect(new_entry.phone_number).to eq('000.111.2222')
      expect(new_entry.email).to eq('ivy.awesome@possom.com')
    end
  end

  describe "#remove_entry" do
    it "remove entry from address book" do 
      book = AddressBook.new
      book.add_entry('Alex','000.111.3333','alex.awesome@possom.com')
      
      name = 'Ivy'
      phone_number = '000.111.2222'
      email = 'ivy.awesome@possom.com'
      book.add_entry(name,phone_number,email)

      expect(book.entries.size).to eq(2)
      book.remove_entry(name,phone_number,email)
      expect(book.entries.size).to eq(1)
      expect(book.entries.first.name).to eq('Alex')
    end
  end
end