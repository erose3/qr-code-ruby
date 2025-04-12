# Write your solution here!

require "rqrcode"

pp "Hi! What URL would you like to make a QR Code for?"

user_url = gets.chomp 

pp "Great, we'll make a QR Code with #{user_url}. What would you like to name the file?"

file_name = gets.chomp

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("#{user_url}")

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("#{file_name}.png", png.to_s)
