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

Roominfo.create(room_id: livingrooom, tool_id: basket, mess_id: no_mess)
Roominfo.create(room_id: kitchen, tool_id: vaccuum, mess_id: no_mess)
Roominfo.create(room_id: bedroom, tool_id: cloth, mess_id: no_mess)
Roominfo.create(room_id: bathroom, tool_id: mop, mess_id: no_mess)
Roominfo.create(room_id: diningroom, tool_id: no_tool, mess_id: no_mess)
Roominfo.create(room_id: inventory, tool_id: no_tool, mess_id: no_mess)