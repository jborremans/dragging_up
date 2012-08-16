if Rails.env.development?
  Tool.destroy_all
  
  tool_names = ['Hammer', 'Saw', 'Cordless Drill', 'Nail Gun', 'Welder', 'Mixer', 'Jig Saw', 'Air Compressor', 'Pneumatic Staple', 'Construction Calculator', 'Bellt Sander', 'Extension Ladder', 'Step Ladder', 'Air Hose', 'Pick Axe', 'Wrenches', 'Torpedo Level', 'Speed Square', 'Messuring Equipment']
  
  tool_conditions = ['Excellent', 'Good', 'Average', 'Poor']
  
  50.times do |t|
    t = Tool.new
    t.tool_name = tool_names[rand(0..(tool_names.size - 1))]
    t.tool_type = %w(power hand)[rand(0..1)]
    t.tool_price = rand(50..950)
    t.tool_condition = tool_conditions[rand(0..(tool_conditions.size - 1))]
        t.tool_picture = rand(10000..100000)
    # t.string   "tool_condition"
    # t.text     "tool_description"
    # t.string   "tool_picture"
    t.save
  end
end
