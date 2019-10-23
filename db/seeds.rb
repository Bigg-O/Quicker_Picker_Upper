Room.destroy_all
Mess.destroy_all
Tool.destroy_all

Room.create(name: "Living Room")
Room.create(name: "Kitchen")
Room.create(name: "Bedroom")
Room.create(name: "Bathroom")
Room.create(name: "Inventory")

Tool.create(name: "Basket")
Tool.create(name: "Mop")
Tool.create(name: "Vaccuum")
Tool.create(name: "Cloth")
Tool.create(name: "No_tool")

Mess.create(name: "Toy Spill")
Mess.create(name: "Juice Spill")
Mess.create(name: "Snack Spill")
Mess.create(name: "Drawing on the Wall")
Mess.create(name: "No_mess")

mrclean = User.create(user_name: "Mr. Clean", password:"clean" )
queenclean = User.create(user_name: "Queen of Clean", password: "queen" )
averagejoe = User.create(user_name: "Average Joe", password:"joe" )
subpar = User.create(user_name: "Subpar Steve", password:"notgood" )
dirtydude = User.create(user_name: "Dirty Dude", password:"dirt" )
Gamestat.create( messes_cleaned: 250, user: queenclean, elapsed_time: Time.parse("00:45:00"))
Gamestat.create( messes_cleaned: 200, user: mrclean, elapsed_time: Time.parse("00:30:00"))
Gamestat.create( messes_cleaned: 150, user: averagejoe, elapsed_time: Time.parse("00:20:00"))
Gamestat.create( messes_cleaned: 100, user: subpar, elapsed_time: Time.parse("00:15:00"))
Gamestat.create( messes_cleaned: 50, user: dirtydude, elapsed_time: Time.parse("00:10:00"))
