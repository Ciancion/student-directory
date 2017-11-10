def input_students
  puts "Please insert student names and cohort"
  #puts "Then insert the nationality, and add age of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.strip.downcase


  while !name.empty? do
    #add the student hash to the array
    cohort = gets.strip.downcase
    cohorts = ["january", "february", "march", "april", "may", "september", "october", "november", "december"]
    $cohorts = cohorts
    if cohort == ""
      cohort = "november"
    end
    while !cohorts.include?(cohort)
      if cohort == "june" || cohort == "july" || cohort == "august"
        puts "There are no cohorts in June, July, August. Insert a valid courth"
          cohort = gets.strip.downcase
      else
        puts "There is a typo, please write the cohort again"
        cohort = get.strip.downcase
      end
    end
    puts "Please insert nationality and age"
    nationality = gets.strip.downcase
    age = gets.strip.downcase
    students << {name: name, cohort: cohort, nationality: nationality, age: age }
    if students.count == 1
      puts "We have #{students.count} student"
      puts "Please enter the names and cohort of the student"
    else
      puts "We have #{students.count} students"
      puts "Please enter the names and cohort of the student"
    end
    name = gets.strip.downcase
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

 cohort_groups = names.group_by { |x| "cohort_#{x[:cohort]}".to_sym}
 cohort_groups.each do |cohort, students|
   cohort_string = "#{cohort}:"
   puts cohort_string.center(@length + ((cohort_string.length) - @header_l))
 #students.each { |student| puts student.values.join(' ') }

 students.each do |student|
   print_string = "name student: #{student[:name]}  cohort: #{student[:cohort]}  nationality: #{student[:nationality]}  age: #{student[:age]}"
   puts print_string.center(@length + ((print_string.length) - @header_l))
 end

 puts "\n"
 end
end




def print_footer(names)

  if names.count == 1
    footer_string = "Overall, we have #{names.count} great student "
  else
    footer_string = "Overall, we have #{names.count} great students "
  end
  lenght_footer = footer_string.length
  puts footer_string.center(@length + (lenght_footer - @header_l))
end

students = input_students
if students.count != 0

  print_header
  print(students)
  print_footer(students)
else
  puts "The list of students is empty!"


end
