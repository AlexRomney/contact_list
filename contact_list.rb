require 'colorize'

@contacts = []

def welcome
  puts "Welcome to Contact List!".colorize(:color => :green)
  puts "What is your name?"
  @user_name = user_input
  puts "Hey #{@user_name}! Let's get started!"
  contact_menu
end

def contact_menu
  puts "\n*** Contact Menu ***\n".colorize(:color => :green)
  puts "1) Create a Contact"
  puts "2) View All Contacts"
  puts "3) Edit Contacts"
  puts "4) Delete Contact"
  puts "5) Type 'quit' to exit the program"
  puts "\nPick an option\n"

  case user_input
    when '1'
      create_contact
    when '2'
      view_contacts
    when '3'
      edit_contact
    when '4'
      delete_contact
    when '5', 'quit'
      puts "Thanks for using our services! Come again! Goodbye!".colorize(:color => :green)
      exit
    else
      puts "Sorry, Please pick a valid option".colorize(:color => :red)
      contact_menu
    end
end

def create_contact
  puts "Let's add some contacts! Who would you like to add?"
  new_contact = user_input
  @contacts << new_contact
  puts "\n#{new_contact} has been added!\n"
  contact_menu
end

def view_contacts
  puts @contacts
  puts "Those are some nice contacts you got there!"
  puts "\nType 'back' to get back to the main menu.\n"
  if user_input == 'back'
    contact_menu
  else
    puts "Oops! Typo! Try again #{@user_name}!".colorize(:color => :light_blue)
    view_contacts
  end
end

def edit_contact
  puts "Who would you like to edit?"
  iterator
  edit_choice = user_input.to_i - 1
  puts "\nAlright, how do you want to edit #{@contacts[edit_choice]}?\n"
  new_edit = user_input
  @contacts[edit_choice] = new_edit
  puts "\n#{new_edit} has been successfully edited.\n"
  puts "\nWould you like to edit another contact? (yes/no)\n"
  if user_input == 'yes'
    edit_contact
  else
    contact_menu
  end
end

def delete_contact
  puts "Which contact would you like to delete?"
  iterator
  destroy_contact = user_input.to_i - 1
  puts "\nAre you sure you want to delete #{@contacts[destroy_contact]}?\n".colorize(:color => :yellow)
  if user_input == 'yes'
    puts "\n#{@contacts[destroy_contact]} has been removed!".colorize(:color => :orange)
    @contacts.delete_at(destroy_contact)
    puts "Would you like to delete another contact? (yes/no)"
    if user_input == 'yes'
      delete_contact
    else
      contact_menu
    end
  else
    puts "#{@contacts[destroy_contact]} was not properly deleted".colorize(:color => :red)
    contact_menu
  end
end

def iterator
  i = 1
  @contacts.each do |name|
    puts "#{i}. #{name}"
    i += 1
  end
end

def user_input
  print "> "
  gets.strip
end

welcome
