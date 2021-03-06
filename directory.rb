require "csv"

@students = []
def students_details(name, cohort, nationality, age)
  @students << {name: name,
    cohort: cohort,
    nationality: nationality,
    age: age }

  end

def input_students
  puts "Please insert student names and cohort"
  #puts "Then insert the nationality, and add age of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  name = STDIN.gets.chomp.downcase
  while !name.empty? do
    #add the student hash to the array
    cohort = STDIN.gets.chomp.downcase
    cohorts = ["january", "february", "march", "april", "may", "september", "october", "november", "december"]
    if cohort == ""
      cohort = "november"
    end
    while !cohorts.include?(cohort)
      if cohort == "june" || cohort == "july" || cohort == "august"
        puts "There are no cohorts in June, July, August. Insert a valid cohort"
          cohort = STDIN.gets.chomp.downcase
      else
        puts "There is a typo, please write the cohort again"
        cohort = STDIN.gets.chomp.downcase
      end
    end
    puts "Please insert nationality and age"
    nationality = STDIN.gets.chomp.downcase
    age = STDIN.gets.chomp.downcase
    students_details(name, cohort, nationality, age)
    if @students.count == 1
      puts "We have #{@students.count} student"
      puts "Please enter the names and cohort of the student"
    else
      puts "We have #{@students.count} students"
      puts "Please enter the names and cohort of the student"
    end
    name = STDIN.gets.chomp.downcase
  end
  # students
end

def print_header
  length = 80
  @length = length
  header_l = "The students of Villains Academy".length
  @header_l = header_l
  space_l = "_________________".length
  puts "The students of Villains Academy".center(@length)
  puts "_________________".center(@length + ((space_l - @header_l)))
end

def print_student_list
cohort_groups = @students.group_by { |x| "cohort_#{x[:cohort]}".to_sym}
cohort_groups.each do |cohort, people|
   cohort_string = "#{cohort}:"
   puts cohort_string.center(@length + ((cohort_string.length) - @header_l))
   people.each do |student|
   print_string = "name student: #{student[:name]}  cohort: #{student[:cohort]}  nationality: #{student[:nationality]}  age: #{student[:age]}"
   puts print_string.center(@length + ((print_string.length) - @header_l))
 end
 puts "\n"
 end
end

def print_footer

  if @students.count == 1
    footer_string = "Overall, we have #{@students.count} great student "
  else
    footer_string = "Overall, we have #{@students.count} great students "
  end
  lenght_footer = footer_string.length
  puts footer_string.center(@length + (lenght_footer - @header_l))
end

def show_student
  if @students.count != 0
    print_header
    print_student_list
    print_footer
  else
  puts "The list of students is empty!"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list in a file"
  puts "4. Load the list in a file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      #input student
      puts "You have chosen to input the student details"
      input_students

    when "2"
      #show the students
      puts "You have chosen to show the students details"
      show_student

    when "3"
      save_students(file_name)
      puts "#{@students.count} students have been saved in the file #{@filename} "

    when "4"
     load_students(file_name)
      puts "Loaded #{@students.count} students"

    when "9"
      exit #this will terminate the program

    else
      puts "I don\'t lnow what you ment, try again"
    end
  end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students(filename = "students.csv" )
  #open the file for writing
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort], student[:nationality], student[:age]]
    end
  end
end

def file_name
  puts "Insert a file"
  @filename = STDIN.gets.chomp
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    name, cohort, nationality, age = line
    students_details(name, cohort, nationality, age)
    end
    puts "#{@students.count} students have been loaded in total"
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
    load_students
    # puts "Loaded #{@students.count} from default file"
  elsif File.exist?(filename)
    load_students(filename)
    # puts "Loaded #{@students.count} from #{filename}"
  else #if it does not exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
