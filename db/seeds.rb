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
)
file = File.open(Rails.root.join("app/assets/images/avatars/babyyoda.jpeg"))
babyyoda.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

maia = Child.create!(
  name: "Maia",
  date_of_birth: "2022/10/05",
  coins: "11",
  user: yusuke,
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
  date_of_birth: "2015/07/01",
  coins: "89",
  user: yusuke,
)
file = File.open(Rails.root.join("app/assets/images/avatars/iroha.jpeg"))
iroha.photo.attach(io: file, filename: "nes.jpeg", content_type: "image/jpeg")

rocky = Child.create!(
  name: "Rocky",
  date_of_birth: "2019/04/14",
  coins: "56",
  user: asha,
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

  basketball = Mission.create!(
    title: "Pack your bag for basketball practice",
    description: "pack your basketball shirt, pants, socks, and shoes in your basketball bag",
    status: "finished",
    coins: 2,
    child: child,
    category: :organization,
    required_photo: false,
    date: Date.new(2023, 11, 15)
  )

  shopping = Mission.create!(
    title: "Go to Ozeki and grab bananas",
    description: "get the money from the counter and use it to buy small bananas",
    status: "finished",
    coins: 2,
    child: child,
    category: :organization,
    required_photo: false,
    date: Date.new(2023, 11, 14)
  )

  school = Mission.create!(
    title: "Go to school",
    description: "go to school at 8am",
    status: "finished",
    coins: 2,
    child: child,
    category: :organization,
    required_photo: false,
    date: Date.new(2023, 11, 13)
  )

  homework = Mission.create!(
    title: "Do your homework",
    description: "study math and science",
    status: "finished",
    coins: 2,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.new(2023, 11, 13)
  )

  afterschool = Mission.create!(
    title: "Go to Kids Duo",
    description: "go to kids duo",
    status: "finished",
    coins: 2,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.new(2023, 11, 14)
  )

  lunch = Mission.create!(
    title: "Get lunch from Lawson",
    description: "go to Lawson and get lunch",
    status: "finished",
    coins: 2,
    child: child,
    category: :activity,
    required_photo: false,
    date: Date.new(2023, 11, 12)
  )

  gym = Mission.create!(
    title: "Get your gym clothes",
    description: "get your gym clothes and pack them in your bag",
    status: "finished",
    coins: 2,
    child: child,
    category: :organization,
    required_photo: false,
    date: Date.new(2023, 11, 17)
  )

  math = Mission.create!(
    title: "Study math with your tutor",
    description: "study math with Ms. Anne",
    status: "finished",
    coins: 2,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.new(2023, 11, 20)
  )

  science = Mission.create!(
    title: "Study science ",
    description: "study science with Ms. Anne",
    status: "finished",
    coins: 2,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.new(2023, 11, 21)
  )

  english = Mission.create!(
    title: "Study English",
    description: "study english with Ms. Anne",
    status: "finished",
    coins: 2,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.new(2023, 11, 22)
  )

  movies = Mission.create!(
    title: "Go to the movies",
    description: "go to the movies",
    status: "finished",
    coins: 2,
    child: child,
    category: :activity,
    required_photo: false,
    date: Date.new(2023, 11, 25)
  )

  party = Mission.create!(
    title: "Clean up for the party tonight",
    description: "We have a party tonight, clean up beforehand",
    status: "finished",
    coins: 2,
    child: child,
    category: :activity,
    required_photo: false,
    date: Date.new(2023, 11, 11)
  )

  gymnastics = Mission.create!(
    title: "Go to gymnastics lesson",
    description: "We have a trial lesson for gymnastics",
    status: "finished",
    coins: 2,
    child: child,
    category: :activity,
    required_photo: false,
    date: Date.new(2023, 11, 8)
  )

  arcade = Mission.create!(
    title: "Go to the arcade with your little cousin",
    description: "Go to the arcade with your little cousin and watch him. Theres some change on the counter.",
    status: "finished",
    coins: 2,
    child: child,
    category: :other,
    required_photo: false,
    date: Date.new(2023, 11, 6)
  )

  help = Mission.create!(
    title: "Help your little cousin with their homework",
    description: "Help little Mike with his homework. It's just tracing the ABCs.",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11,3)
  )

  lesson = Mission.create!(
    title: "Go to your English lesson with Anne",
    description: "Go to your lesson afterschool. Anne will pick you up.",
    status: "finished",
    coins: 2,
    child: child,
    category: :study,
    required_photo: false,
    date: Date.new(2023, 11,1)
  )

  dance = Mission.create!(
    title: "Take your little cousin to dance class",
    description: "Go to your lesson afterschool. Anne will pick you up.",
    status: "finished",
    coins: 3,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 10, 31)
  )

  swimming = Mission.create!(
    title: "Prepare for swimming class",
    description: "Get your swimming gear and get it ready for tomorrow",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 10, 30)
  )

  swim = Mission.create!(
    title: "Go to swim class",
    description: "Get your swimming bag and go to class",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 8)
  )

  clean = Mission.create!(
    title: "Clean your room",
    description: "clean your room and put dirty clothes in the hamper",
    status: "finished",
    coins: 2,
    child: child,
    category: :chore,
    required_photo: false,
    date: Date.new(2023, 11, 14)
  )

  bread = Mission.create!(
    title: "Get bread from Ozeki",
    description: "get bread with the change on the counter",
    status: "finished",
    coins: 2,
    child: child,
    category: :chore,
    required_photo: false,
    date: Date.new(2023, 11, 24)
  )

  cereal = Mission.create!(
    title: "Get cereal from Ozeki",
    description: "get cereal with the change on the counter",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 26)
  )

  dinner = Mission.create!(
    title: "Get dinner from the conbini",
    description: "get dinner with the change on the counter",
    status: "finished",
    coins: 3,
    child: child,
    category: :activity,
    required_photo: false,
    date: Date.new(2023, 11, 23)
  )

  rice = Mission.create!(
    title: "Get rice from ozeki",
    description: "get rice with the change on the counter",
    status: "finished",
    coins: 4,
    child: child,
    category: :activity,
    required_photo: false,
    date: Date.new(2023, 11, 8)
  )

  ham = Mission.create!(
    title: "Get ham from ozeki",
    description: "get ham with the change on the counter",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 16)
  )

  dog = Mission.create!(
    title: "walk the dog",
    description: "walk the dog at the park nearby",
    status: "finished",
    coins: 2,
    child: child,
    category: :chore,
    required_photo: false,
    date: Date.new(2023, 11, 22)
  )

  walk = Mission.create!(
    title: "walk the dog afterschool",
    description: "get a leash and walk the dog",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 15)
  )

  fish = Mission.create!(
    title: "Get fish from the store",
    description: "get fish from Ozeki with the change on the counter",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 12)
  )

  bacon = Mission.create!(
    title: "Get bacon from the store",
    description: "get bacon from Ozeki with the change on the counter",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 2)
  )

  eggs = Mission.create!(
    title: "Get eggs from the store",
    description: "get eggs from Ozeki with the change on the counter",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 5)
  )

  tomato = Mission.create!(
    title: "Get tomatoes from the store",
    description: "get 3 tomatoes from Ozeki with the change on the counter",
    status: "finished",
    coins: 2,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 9)
  )

  lettuce = Mission.create!(
    title: "Get lettuce from the store",
    description: "get lettuce from Ozeki with the change on the counter",
    status: "finished",
    coins: 3,
    child: child,
    category: :responsibility,
    required_photo: false,
    date: Date.new(2023, 11, 27)
  )

  toast = Mission.create!(
    title: "Make toast for your breakfast",
    description: "I have to go to work early so make toast with jam for breakfast",
    status: "finished",
    coins: 3,
    child: child,
    category: :other,
    required_photo: false,
    date: Date.new(2023, 10, 30)
  )

  Mission.create!(
    title: "Make toast for breakfast",
    description: "I have to go to work early so make toast with butter for breakfast",
    status: "pending",
    coins: 3,
    child: child,
    category: :other,
    required_photo: false,
    date: Date.new(2023, 12, 2)
  )

  Mission.create!(
    title: "Go to your swimming lesson",
    description: "Go to your swiiming lesson at 10am.",
    status: "pending",
    coins: 3,
    child: child,
    category: :other,
    required_photo: false,
    date: Date.new(2023, 12, 2)
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

  CompletedMission.create!(
    mission: basketball,
    completed_at: DateTime.now - 13.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: shopping,
    completed_at: DateTime.now - 14.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: school,
    completed_at: DateTime.now - 15.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: homework,
    completed_at: DateTime.now - 15.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: afterschool,
    completed_at: DateTime.now - 14.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: lunch,
    completed_at: DateTime.now - 16.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: gym,
    completed_at: DateTime.now - 11.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: lunch,
    completed_at: DateTime.now - 16.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: math,
    completed_at: DateTime.now - 8.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: science,
    completed_at: DateTime.now - 7.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: english,
    completed_at: DateTime.now - 6.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: clean,
    completed_at: DateTime.now - 14.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: movies,
    completed_at: DateTime.now - 3.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: party,
    completed_at: DateTime.now - 17.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: gymnastics,
    completed_at: DateTime.now - 20.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: arcade,
    completed_at: DateTime.now - 22.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: help,
    completed_at: DateTime.now - 25.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: lesson,
    completed_at: DateTime.now - 27.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: dance,
    completed_at: DateTime.now - 28.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: swimming,
    completed_at: DateTime.now - 29.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: swim,
    completed_at: DateTime.now - 20.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: bread,
    completed_at: DateTime.now - 4.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: cereal,
    completed_at: DateTime.now - 2.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: dinner,
    completed_at: DateTime.now - 5.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: rice,
    completed_at: DateTime.now - 20.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: ham,
    completed_at: DateTime.now - 12.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: dog,
    completed_at: DateTime.now - 6.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: walk,
    completed_at: DateTime.now - 13.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: fish,
    completed_at: DateTime.now - 16.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: bacon,
    completed_at: DateTime.now - 26.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: eggs,
    completed_at: DateTime.now - 23.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: tomato,
    completed_at: DateTime.now - 19.days,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: lettuce,
    completed_at: DateTime.now - 1.day,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
  )

  CompletedMission.create!(
    mission: toast,
    completed_at: DateTime.now - 29.day,
    completed_latitude: 35.63388858566281,
    completed_longitude: 139.70823189299546,
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
  name: "Visit Tokyo Dome",
  description: "See a baseball game for this season",
  price: 75,
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
