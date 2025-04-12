# Write your solution here!

require "rqrcode"

puts "-----------------------------"
puts "     QR CODE GENERATOR"
puts"-----------------------------"
puts
puts "What would you like to encode? Please respond with a number."
puts
puts "1. URL"
puts "2. Join Wifi Network"
puts "3. SMS"
puts
puts "4. Exit"
puts

user_selection = gets.chomp.to_i

puts 

if user_selection == 1
  puts "Hi! What URL would you like to make a QR Code for?"
  user_url = gets.chomp 
  puts "Great, we'll make a QR Code with #{user_url}. What would you like to name the file?"
  file_name = gets.chomp
  qrcode = RQRCode::QRCode.new("#{user_url}")

elsif user_selection == 2
  puts "Hi! What is the Wifi Name?"
  wifi_name = gets.chomp 
  puts "And the password?"
  wifi_pw = gets.chomp
  puts "Great, we'll make a QR Code with that wifi info. What would you like to name the file?"
  file_name = gets.chomp
  qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi_name};P:#{wifi_pw};;")

elsif user_selection == 3
  puts "Hi! What is the Phone Number?"
  phone = gets.chomp 
  puts "What message preset would you like to have?"
  message = gets.chomp
  puts "Great, we'll make a QR Code with that text. What would you like to name the file?"
  file_name = gets.chomp
  qrcode = RQRCode::QRCode.new("SMSTO:#{phone}:#{message}")

else user_selection == 4
  exit
end

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("#{file_name}.png", png.to_s)
