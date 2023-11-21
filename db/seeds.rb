
puts "Cleaning db..."

User.destroy_all
Child.destroy_all
Mission.destroy_all
Completed_Mission.destroy_all


# users (x4)
puts "Creating users..."
mao = User.create!(email: "mao@gmail.com", password: "mao", first_name: "Mao", last_name: "Christie")
file = File.open(Rails.root.join("app/assets/images/avatars/mao.jpeg"))
mao.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

asha = User.create!(email: "asha@gmail.com", password: "asha", first_name: "Asha", last_name: "Uchida")
file = File.open(Rails.root.join("app/assets/images/avatars/asha.jpeg"))
asha.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

sam = User.create!(email: "sam@gmail.com", password: "sam", first_name: "Sam", last_name: "Stone")
file = File.open(Rails.root.join("app/assets/images/avatars/sam.jpeg"))
sam.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

yusuke = User.create!(email: "yusuke@gmail.com", password: "yusuke", first_name: "Yusuke", last_name: "Mori")
file = File.open(Rails.root.join("app/assets/images/avatars/yusuke.jpeg"))
yusuke.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

puts "Creating children..."
# children (x5)
babyyoda = Child.create!(
  name: "Baby Yoda",
  date_of_birth: "2015/01/01",
  coins: "32",
  user: mao,
)
file = File.open(Rails.root.join("app/assets/images/avatars/babyyoda.jpeg"))
babyyoda.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

maia = Child.create!(
  name: "Maia",
  date_of_birth: "2022/10/05",
  coins: "11",
  user: asha,
)
file = File.open(Rails.root.join("app/assets/images/avatars/maia.jpeg"))
maia.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

henry = Child.create!(
  name: "Henry",
  date_of_birth: "2020/08/14",
  coins: "62",
  user: sam,
)
file = File.open(Rails.root.join("app/assets/images/avatars/henry.jpeg"))
henry.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

iroha = Child.create!(
  name: "Iroha",
  date_of_birth: "2022/10/05",
  coins: "89",
  user: yusuke,
)
file = File.open(Rails.root.join("app/assets/images/avatars/iroha.jpeg"))
iroha.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

rocky = Child.create!(
  name: "Rocky",
  date_of_birth: "2019/04/14",
  coins: "56",
  user: yusuke,
)
file = File.open(Rails.root.join("app/assets/images/avatars/rocky.jpeg"))
rocky.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

puts "Creating missions..."
# missions (x10)
# Statuses - new - started - finished

Child.all.each do |child|
  Mission.create!(
    title: "Clear your study desk",
    description: "pack away all the stuff on your desk and then wipe it with cleaning wipe",
    status: new,
    coins: 1,
    child: child,
    category: chores & responsibilities,
    required_photo: true,
  )

  Mission.create!(
    title: "Visit grandma after school",
    description: "walk to grandma's house after school and take a picture with grandma",
    status: new,
    coins: 1,
    child: child,
    category: activities,
    required_photo: true,
  )

  Mission.create!(
    title: "Go to your baseball lesson",
    description: "walk to your baseball lesson",
    status: started,
    coins: 1,
    child: child,
    category: activities,
    required_photo: true,
  )

  Mission.create!(
    title: "Read for 10 pages",
    description: "read 10 pages from your reading book",
    status: finished,
    coins: 3,
    child: child,
    category: homework & study,
    required_photo: false,
  )
  puts "Finished!"

  Mission.create!(
    title: "Give water to the plants",
    description: "Give one cup of water to each plant in the kitchen, living room and bathroom",
    status: started,
    coins: 2,
    child: child,
    category: chores & responsibilities,
    required_photo: false,
  )

  Mission.create!(
    title: "Set the dinner table",
    description: "Set the dinner table with chopsticks, napkins and one cup for you, mom and dad",
    status: finished,
    coins: 2,
    child: child,
    category: chores & responsibilities,
    required_photo: true,
  )

  Mission.create!(
    title: "Write in your journal",
    description: "write 3 sentences about your day in your journal",
    status: new,
    coins: 2,
    child: child,
    category: organisation & planning,
    required_photo: true,
  )

  Mission.create!(
    title: "Clean up your bedroom",
    description: "put all your toys back in their spot and make sure the floor is cleared",
    status: started,
    coins: 2,
    child: child,
    category: chores & responsibilities,
    required_photo: true,
  )

  Mission.create!(
    title: "Do your math homework",
    description: "finish your math homework. If you get stuck, write down your question in your notebook.",
    status: started,
    coins: 4,
    child: child,
    category: homework & study,
    required_photo: false,
  )

  Mission.create!(
    title: "Prepare your pajamas for bedtime",
    description: "Go to your closet and choose your pajamas for tonight. Put them nicely on your bed",
    status: started,
    coins: 1,
    child: child,
    category: organisation & planning,
    required_photo: true,
  )

  Mission.create!(
    title: "have a snack and water",
    description: "drink one cup of water and chose one snack from your snack basket",
    status: finished,
    coins: 1,
    child: child,
    category: other,
    required_photo: false,
  )

  Mission.create!(
    title: "Pack your bag for baseball practice",
    description: "pack your baseball shirt, pants, socks, shoes and glove in your baseball bag",
    status: started,
    coins: 2,
    child: child,
    category: organisation & planning,
    required_photo: false,
  )
end

Child.all.each do |child|
  Completed_Mission.create!(
    mission: mission,
    completed_at: 11/20/23,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  Completed_Mission.create!(
    mission: mission,
    completed_at: 11/01/23,
    completed_latitude: 35.63409963579853,
    completed_longitude: 139.7156935092282,
  )
end

puts "Finished!"
