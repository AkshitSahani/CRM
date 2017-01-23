class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(by_id)
    @@contacts.each do |contact|
      if contact.id == by_id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact

  def update(attribute, value)
    # puts "Please enter the id of the contact you want to update?"
    # user_id_input = gets.to_i
    @attribute = attribute
    @value = value

    @@contacts.each do |contact|
      # if contact.id == user_id_input
        if attribute == "first_name"
          contact.first_name = value
        elsif attribute == "last_name"
          contact.last_name = value
        elsif attribute == "email"
          contact.email = value
        elsif attribute == "note"
          contact.note = value
        end
      end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @attribute = attribute
    @value = value
    @@contacts.each do |contact|
      if attribute == "first_name"
        if contact.first_name == value
        return contact
        end
      elsif attribute == "last_name"
        if contact.last_name == value
        return contact
        end
      elsif attribute == "email"
        if contact.email == value
        return contact
        end
      elsif attribute == "note"
        if contact.note == value
        return contact
        end
      elsif attribute == "id"
        return "Sorry, cannot select by id"
      else
        return "Contact with that attribute and value doesn't exist"
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
