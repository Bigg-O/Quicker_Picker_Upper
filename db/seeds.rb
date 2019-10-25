Room.destroy_all
Mess.destroy_all
Tool.destroy_all
Gamestat.destroy_all
User.destroy_all

livingroom = Room.create(name: "Living Room")
kitchen = Room.create(name: "Kitchen")
bedroom = Room.create(name: "Bedroom")
bathroom = Room.create(name: "Bathroom")
diningroom = Room.create(name: "Dining Room")
inventory = Room.create(name: "Inventory")

basket = Tool.create(name: "Basket", room: kitchen)
vaccuum = Tool.create(name: "Vaccuum", room: livingroom)
cloth = Tool.create(name: "Sponge", room: bedroom)
mop = Tool.create(name: "Mop", room: inventory)

toys = Mess.new(name: "Toy Spill")
draw = Mess.new(name: "Drawing on the Wall")
snack_spill = Mess.new(name: "Snack Spill")
juice_spill = Mess.new(name: "Juice Spill")

snack_spill.tool = vaccuum
juice_spill.tool = mop
toys.tool = basket
draw.tool = cloth

toys.save
draw.save
snack_spill.save
juice_spill.save

# mrclean = User.create(user_name: "Mr. Clean", password:"clean" )
# queenclean = User.create(user_name: "Queen of Clean", password: "queen" )
# averagejoe = User.create(user_name: "Average Joe", password:"joe" )
# subpar = User.create(user_name: "Subpar Steve", password:"notgood" )
# dirtydude = User.create(user_name: "Dirty Dude", password:"dirt" )
# Gamestat.create( messes_cleaned: 250, user: queenclean, elapsed_time: 600)
# Gamestat.create( messes_cleaned: 200, user: mrclean, elapsed_time: 500)
# Gamestat.create( messes_cleaned: 150, user: averagejoe, elapsed_time: 400)
# Gamestat.create( messes_cleaned: 100, user: subpar, elapsed_time: 300 )
# Gamestat.create( messes_cleaned: 50, user: dirtydude, elapsed_time: 200 )



