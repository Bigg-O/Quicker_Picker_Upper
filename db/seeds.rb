Room.destroy_all
Mess.destroy_all
Tool.destroy_all

livingroom = Room.create(name: "Living Room")
kitchen = Room.create(name: "Kitchen")
bedroom = Room.create(name: "Bedroom")
bathroom = Room.create(name: "Bathroom")
diningroom = Room.create(name: "Diningroom")
inventory = Room.create(name: "Inventory")

basket = Tool.create(name: "Basket", room: kitchen)
vaccuum = Tool.create(name: "Vaccuum", room: livingroom)
cloth = Tool.create(name: "Cloth", room: bedroom)
mop = Tool.create(name: "Mop", room: inventory)

toys = Mess.create(name: "Toy Spill")
draw = Mess.create(name: "Drawing on the Wall")
snack_spill = Mess.create(name: "Snack Spill")
juice_spill = Mess.create(name: "Juice Spill")
no_mess = Mess.create(name: "The Room Is Clean")

snack_spill.tool = vaccuum
juice_spill.tool = mop
toys.tool = basket
draw.tool = cloth

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


Roominfo.create(room: livingroom, mess: juice_spill)
Roominfo.create(room: kitchen, mess: snack_spill)
Roominfo.create(room: bedroom, mess: no_mess)
Roominfo.create(room: bathroom, mess: no_mess)
Roominfo.create(room: diningroom, mess: no_mess)
Roominfo.create(room: inventory, mess: no_mess)



