Product_Status = 'closed'
unless Product_Status == 'open'
    check_change = 'can'
else
    check_change = 'can open'
end
puts "You #{check_change} change the product."