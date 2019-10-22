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