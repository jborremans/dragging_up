if Rails.env.development?
  Tool.destroy_all
  
  tool_names = ['hammer', 'saw', 'screw driver', 'nail gun', 'welder', 'soldering iron']
  
  50.times do |t|
    t = Tool.new
    t.tool_name = tool_names[rand(0..(tool_names.size - 1))]
    t.tool_type = %w(power hand)[rand(0..1)]
    t.tool_price = rand(50..500)
    # t.string   "tool_condition"
    # t.text     "tool_description"
    # t.string   "tool_picture"
    t.save
  end
end
