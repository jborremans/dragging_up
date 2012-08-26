if Rails.env.development?
  Tool.destroy_all
  
  tool_names = ['Hammer', 'Saw', 'Cordless Drill', 'Nail Gun', 'Welder', 'Mixer', 'Jig Saw', 'Air Compressor', 'Pneumatic Staple', 'Construction Calculator', 'Bellt Sander', 'Extension Ladder', 'Step Ladder', 'Air Hose', 'Pick Axe', 'Wrenches', 'Torpedo Level', 'Speed Square', 'Messuring Equipment']
  
  tool_conditions = ['Excellent', 'Good', 'Average', 'Poor']
  
  50.times do |t|
    t = Tool.new
    t.tool_name = tool_names[rand(0..(tool_names.size - 1))].to_s
    t.tool_type = %w(power hand)[rand(0..1)].to_s
    t.tool_price = rand(50..950)
    t.tool_condition = tool_conditions[rand(0..(tool_conditions.size - 1))].to_s
        t.tool_picture = rand(10000..100000)
    # t.string   "tool_condition"
    # t.text     "tool_description"
    # t.string   "tool_picture"
    t.save
  end
  
  user_names = ['Scott Hugeus', 'Emily Ellison', 'Noah Gordon', 'Kati Lee', 'Jeff Cohen', 'Greg Meza', 'Enrique Quiroga', 'Joseph Borremans', 'Pauline Gijse', 'Kasper Vandevaardekenshoeve', 'Greg Williams', 'Samir Merchant']
   
   user_names.each do |u|
     # u => 'Scott Hugeus'
     v = User.new
     # u => 'Scott Hugues'
     # v => User.new
     v.name = u
     # User.new.name = 'Scott Hugeus'
     v.password = rand(10000..100000).to_s
     v.email = Faker::Internet.email
     v.save
     
     c = Cart.new
     c.user_id = v.id
     c.save
   end
end
