
Message.destroy_all
Chat.destroy_all
User.destroy_all


users = []

10.times do |i|
  users << User.create!(
    email: "user#{i + 1}@xd.cl",
    first_name: "User #{i + 1}",
    last_name: "Last #{i + 1}",
    password: "password123",
    password_confirmation: "password123",
    admin: i == 0 # Solo el primer usuario será admin
  )
end


chats = []

10.times do |i|
  sender = users[i]
  receiver = users[(i + 1) % 10]  # wraparound: el último habla con el primero

  chats << Chat.create!(
    sender: sender,
    receiver: receiver
  )
end


10.times do |i|
  Message.create!(
    chat: chats[i],
    user: chats[i].sender,
    body: "Message #{i + 1} from #{chats[i].sender.first_name}"
  )
end

