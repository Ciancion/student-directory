def input_students (let)
  @let = let
  puts "Please enter the names of the students"
  puts "To finish, just hit retur twice"
  #create an empty array
  students = []
  name = gets.chomp.downcase
  while !name.empty? do
    #add the student hash to the array
    if name.start_with?(@let)
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
  puts "Overall, we have #{names.count} students who the name begins with #{@let}"
end

students = input_students("m")
print_header
print(students)
print_footer(students)
