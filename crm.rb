require_relative "contact"

class CRM

  def initialize(name)
    puts "Welcome to this CRM. It has the name " + name
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then abort("Thank you for using CRM")
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp.to_s

    print 'Enter Last Name: '
    last_name = gets.chomp.to_s

    print 'Enter Email Address: '
    email = gets.chomp.to_s

    print 'Enter a Note: '
    note = gets.chomp.to_s

    new_contact = Contact.create(first_name, last_name, email, note)
    puts "Contact #{new_contact.full_name} has been created!"
  end

  def modify_existing_contact
    puts "Enter the id of the contact you want to modify"
    user_ent_id = gets.to_i
    contact = Contact.find(user_ent_id)
      puts "First name: #{contact.first_name}    Last name: #{contact.last_name}    Email: #{contact.email}    Note: #{contact.note} "
      puts "Is this the contact you want to modify? Enter yes or no"
      user_input = gets.chomp.to_s
      if user_input == "yes"
        puts "What attribute would you like to change?
        first_name
        last_name
        email
        note"
        attribute = gets.chomp.to_s
        puts "Please enter a new value for the #{attribute}"
        value = gets.chomp.to_s
        contact.update(attribute, value)
        puts "The contact has successfully been modified"
        puts "First name: #{contact.first_name}    Last name: #{contact.last_name}    Email: #{contact.email}    Note: #{contact.note}"
      end
    end

  def delete_contact
    puts "Do you want to delete a certain contact or all the contacts? Enter one or all"
    user_del = gets.chomp.to_s
    if user_del == "one"
      while true
       puts "Enter the id of the contact you want to delete"
       user_ent_id = gets.to_i
       a = Contact.find(user_ent_id)
       puts "Full name: #{a.full_name}    Email: #{a.email}    id: #{a.id}    Note: #{a.note} "
       puts "Is this the contact you want to delete? Enter yes or no"
       user_input = gets.chomp.to_s
       if user_input == "yes"
         a.delete
         puts "The intended contact has been successfully deleted!"
         break
       elsif user_input == "no"
         true
       else
         puts "Please enter a valid input"
       end
      end
    elsif user_del == "all"
      Contact.delete_all
      puts "All contacts have successfully been deleted!"
    else
      puts "Invalid input"
    end
  end

  def display_all_contacts
    puts "Here is a list of all your contacts"
    all_contacts = Contact.all
    all_contacts.each do |contact|
      puts "FULL NAME: #{contact.full_name}    EMAIL: #{contact.email}    ID: #{contact.id}    NOTE: #{contact.note}"
    end
  end

  def search_by_attribute
    puts "What attribute do you want to search by?"
    attribute = gets.chomp.to_s
    puts "Enter the #{attribute}"
    value = gets.chomp.to_s
    a = Contact.find_by(attribute, value)
    puts "FULL NAME: #{a.full_name}    EMAIL: #{a.email}    ID: #{a.id}    NOTE: #{a.note}"
  end


end

app = CRM.new("sahani")

app.main_menu
