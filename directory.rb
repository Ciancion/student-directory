def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit retur twice"
  #create an empty array
  students = []
  name = gets.chomp.downcase
  while !name.empty? do
    #add the student hash to the array
    if name.length < 12
      students << {name: name, cohort: :november}
      puts "We have #{students.count} students"

    end
    name = gets.chomp.downcase
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "_________________"
end

def print(names)
  names.each do |student|
  puts " #{student[:name]} (#{student[:cohort]} cohort) "
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} students whose name is shorter than 12 characters"
end

students = input_students
print_header
print(students)
print_footer(students)
