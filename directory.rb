def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit retur twice"
  #create an empty array
  students = []
  name = gets.chomp
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "We have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "_________________"
end

def print(names)
  names.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort) "
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
