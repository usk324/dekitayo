# require "pry"
puts "Cleaning db..."

ClaimedReward.destroy_all
User.destroy_all
Child.destroy_all
Mission.destroy_all
CompletedMission.destroy_all
Reward.destroy_all


# users (x4)
puts "Creating users..."
mao = User.create!(email: "mao@gmail.com", password: "password", first_name: "Mao", last_name: "Christie")
file = File.open(Rails.root.join("app/assets/images/avatars/mao.jpeg"))
mao.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

asha = User.create!(email: "asha@gmail.com", password: "password", first_name: "Asha", last_name: "Uchida")
file = File.open(Rails.root.join("app/assets/images/avatars/asha.jpeg"))
asha.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

sam = User.create!(email: "sam@gmail.com", password: "password", first_name: "Sam", last_name: "Stone")
file = File.open(Rails.root.join("app/assets/images/avatars/sam.jpeg"))
sam.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

yusuke = User.create!(email: "yusuke@gmail.com", password: "password", first_name: "Yusuke", last_name: "Mori")
file = File.open(Rails.root.join("app/assets/images/avatars/yusuke.jpeg"))
yusuke.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

puts "Creating children..."
# children (x5)
babyyoda = Child.create!(
  name: "Baby Yoda",
  date_of_birth: "2015/01/01",
  coins: "32",
  user: mao,
  position: 0,
)
file = File.open(Rails.root.join("app/assets/images/avatars/babyyoda.jpeg"))
babyyoda.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

maia = Child.create!(
  name: "Maia",
  date_of_birth: "2022/10/05",
  coins: "11",
  user: asha,
  position: 0,
)
file = File.open(Rails.root.join("app/assets/images/avatars/maia.jpeg"))
maia.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

henry = Child.create!(
  name: "Henry",
  date_of_birth: "2020/08/14",
  coins: "62",
  user: sam,
  position: 0,
)
file = File.open(Rails.root.join("app/assets/images/avatars/henry.jpeg"))
henry.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

iroha = Child.create!(
  name: "Iroha",
  date_of_birth: "2022/10/05",
  coins: "89",
  user: yusuke,
  position: 0,
)
file = File.open(Rails.root.join("app/assets/images/avatars/iroha.jpeg"))
iroha.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

rocky = Child.create!(
  name: "Rocky",
  date_of_birth: "2019/04/14",
  coins: "56",
  user: yusuke,
  position: 0,
)
file = File.open(Rails.root.join("app/assets/images/avatars/rocky.jpeg"))
rocky.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

puts "Creating missions and rewards..."
# missions (x10)
# Statuses - new - started - finished

Child.all.each do |child|
  Mission.create!(
    title: "Clear your study desk",
    description: "pack away all the stuff on your desk and then wipe it with cleaning wipe",
    status: "pending",
    coins: 1,
    child: child,
    category: :chore,
    required_photo: true,
    date: Date.new(2023, 11, 29)
  )

  Mission.create!(
    title: "Visit grandma after school",
    description: "walk to grandma's house after school and take a picture with grandma",
    status: "pending",
    coins: 1,
    child: child,
    category: :activity,
    required_photo: true,
    date: Date.new(2023, 11, 29)
  )

  Mission.create!(
    title: "Go to your baseball lesson",
    description: "walk to your baseball lesson",
    status: "started",
    coins: 1,
    child: child,
    category: :activity,
    required_photo: true,
    date: Date.new(2023, 11, 29)
  )

  Mission.create!(
    title: "Read for 10 pages",
    description: "read 10 pages from your reading book",
    status: "finished",
    coins: 3,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.new(2023, 11, 30)
  )
  puts "Finished!"

  Mission.create!(
    title: "Give water to the plants",
    description: "Give one cup of water to each plant in the kitchen, living room and bathroom",
    status: "started",
    coins: 2,
    child: child,
    category: :chore,
    required_photo: false,
    date: Date.new(2023, 11, 30)
  )

  Mission.create!(
    title: "Set the dinner table",
    description: "Set the dinner table with chopsticks, napkins and one cup for you, mom and dad",
    status: "finished",
    coins: 2,
    child: child,
    category: :chore,
    required_photo: true,
    date: Date.new(2023, 12, 02)
  )

  Mission.create!(
    title: "Write in your journal",
    description: "write 3 sentences about your day in your journal",
    status: "pending",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: true,
    date: Date.new(2023, 12, 02)
  )

  Mission.create!(
    title: "Clean up your bedroom",
    description: "put all your toys back in their spot and make sure the floor is cleared",
    status: "started",
    coins: 2,
    child: child,
    category: :chore,
    required_photo: true,
    date: Date.new(2023, 12, 02)
  )

  Mission.create!(
    title: "Do your math homework",
    description: "finish your math homework. If you get stuck, write down your question in your notebook.",
    status: "started",
    coins: 4,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.today
  )

  Mission.create!(
    title: "Prepare your pajamas for bedtime",
    description: "Go to your closet and choose your pajamas for tonight. Put them nicely on your bed",
    status: "started",
    coins: 1,
    child: child,
    category: :organization,
    required_photo: true,
    date: Date.today
  )

  snack = Mission.create!(
    title: "have a snack and water",
    description: "drink one cup of water and chose one snack from your snack basket",
    status: "finished",
    coins: 1,
    child: child,
    category: :other,
    required_photo: false,
    date: Date.today
  )

  baseball = Mission.create!(
    title: "Pack your bag for baseball practice",
    description: "pack your baseball shirt, pants, socks, shoes and glove in your baseball bag",
    status: "started",
    coins: 2,
    child: child,
    category: :organization,
    required_photo: false,
    date: Date.today
  )

  CompletedMission.create!(
    mission: baseball,
    completed_at: DateTime.now - 1.day,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: snack,
    completed_at: DateTime.now - 3.days,
    completed_latitude: 35.63409963579853,
    completed_longitude: 139.7156935092282,
  )

  Reward.create!(
    name: "Ice cream",
    description: "A yummy frozen treat",
    price: 20,
    inventory: 100,
    child: child
  )

  Reward.create!(
    name: "500 yen",
    description: "Choose something from the store",
    price: 15,
    inventory: 100,
    child: child
  )

  Reward.create!(
    name: "Hair bow",
    description: "Hair bow from Daiso",
    price: 10,
    inventory: 20,
    child: child  )

  Reward.create!(
    name: "Museum Trip",
    description: "Choose a museum to visit",
    price: 50,
    inventory: 25,
    child: child  )

  Reward.create!(
    name: "Beach Day",
    description: "Let's go to the beach for a day",
    price: 75,
    inventory: 10,
    child: child  )

  Reward.create!(
    name: "One Outfit",
    description: "Get a new outfit from the store",
    price: 100,
    inventory: 15,
    child: child  )

  Reward.create!(
  name: "Test",
  description: "info",
  price: 1,
  inventory: 0,
  child: child  )

  Reward.create!(
    name: "Book",
    description: "Choose something to read from the library",
    price: 25,
    inventory: 80,
    child: child  )
end

puts "Finished!"
