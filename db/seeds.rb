Room.destroy_all
Mess.destroy_all
Tool.destroy_all

livingrooom = Room.create(name: "Living Room")
kitchen = Room.create(name: "Kitchen")
bedroom = Room.create(name: "Bedroom")
bathroom = Room.create(name: "Bathroom")
diningroom = Room.create(name: "Diningroom")
inventory = Room.create(name: "Inventory")


basket = Tool.create(name: "Basket")
vaccuum = Tool.create(name: "Vaccuum")
cloth = Tool.create(name: "Cloth")
mop = Tool.create(name: "Mop")
no_tool = Tool.create(name: "No_tool")

Mess.create(name: "Toy Spill")
Mess.create(name: "Snack Spill")
Mess.create(name: "Drawing on the Wall")
Mess.create(name: "Juice Spill")
no_mess = Mess.create(name: "No_mess")

Roominfo.create(room: livingrooom, tool: basket, mess: no_mess)
Roominfo.create(room: kitchen, tool: vaccuum, mess: no_mess)
Roominfo.create(room: bedroom, tool: cloth, mess: no_mess)
Roominfo.create(room: bathroom, tool: mop, mess: no_mess)
Roominfo.create(room: diningroom, tool: no_tool, mess: no_mess)
Roominfo.create(room: inventory, tool: mop, mess: no_mess)