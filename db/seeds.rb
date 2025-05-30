10.times do |i|
  User.create!(
    email: "user#{i+1}@xd.cl",
    first_name: "User #{i+1}",
    last_name: "Last #{i+1}",
    password: "password123",  # puedes cambiar la contraseña a lo que quieras
    password_confirmation: "password123"
  )
end

10.times do |i|
  receiver_id = i + 2
  receiver_id = 1 if i == 9
  Chat.create!(
    sender_id: i + 1,
    receiver_id: receiver_id
  )
end

10.times do |i|
  Message.create!(
    chat_id: i + 1,
    user_id: i + 1,
    body: "Message #{i + 1}"
  )
end