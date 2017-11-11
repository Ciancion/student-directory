def print_own_sorce_code
  File.open(__FILE__ , "r") { |file| puts file.read }
end

print_own_sorce_code
