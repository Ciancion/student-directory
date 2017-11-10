def input_students
  puts "Please insert student names and cohort"
  #puts "Then insert the nationality, and add age of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp.downcase


  while !name.empty? do
    #add the student hash to the array
    cohort = gets.chomp.downcase
    cohorts = ["january", "february", "march", "april", "may", "september", "october", "november", "december"]
    $cohorts = cohorts
    if cohort == ""
      cohort = "november"
    end
    while !cohorts.include?(cohort)
      if cohort == "june" || cohort == "july" || cohort == "august"
        puts "There are no cohorts in June, July, August. Insert a valid courth"
          cohort = gets.chomp
      else
        puts "There is a typo, please write the cohort again"
        cohort = gets.chomp
      end
    end
    puts "Please insert nationality and age"
    nationality = gets.chomp.downcase
    age = gets.chomp.downcase
    students << {name: name, cohort: cohort, nationality: nationality, age: age }
    puts "We have #{students.count} students"
    puts "Please enter the names and cohort of the students"
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

  footer_string = "Overall, we have #{names.count} great students "
  lenght_footer = footer_string.length
  puts footer_string.center(@length + (lenght_footer - @header_l))
end

students = input_students
print_header
print(students)
print_footer(students)
