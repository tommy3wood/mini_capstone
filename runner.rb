# require 'http'

# system 'clear'

# puts "For full catalogue enter ALL"
# puts "If you know your item index, please enter:"
# user_input = gets.chomp

# if user_input.downcase == "all"
#   response = HTTP.get("http://localhost:3000/api/shoes")
# else
#   response = HTTP.get("http://localhost:3000/api/shoes/#{user_input}")
# end