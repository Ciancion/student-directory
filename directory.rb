def input_students
  puts "Please insert student names"
  puts "Then insert the nationality, and add age of the students"
  puts "To finish, just hit retur twice"
  #create an empty array
  students = []
  name = gets.chomp.downcase

  while !name.empty? do
    #add the student hash to the array
    nationality = gets.chomp.downcase
    age = gets.chomp.downcase

    if name.length < 12
      students << {name: name, cohort: :november, nationality: nationality, age: age }
      puts "We have #{students.count} students"
    end

    puts "Please enter the names, nationality and age of the students"
    name = gets.chomp.downcase
   end
students
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

def print(names)

index = 0

 while (names.length) > index
   names_string = "#{index}. #{names[index][:name]} (#{names[index][:cohort]} cohort) #{names[index][:nationality]} #{names[index][:age]} years old"
   length_names = names_string.length
   puts names_string.center(@length + (length_names - @header_l))
   index += 1
 end
end

def print_footer(names)

  footer_string = "Overall, we have #{names.count} students whose name is shorter than 12 characters"
  lenght_footer = footer_string.length
  puts footer_string.center(@length + (lenght_footer - @header_l))
end

students = input_students
print_header
print(students)
print_footer(students)
