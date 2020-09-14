
#######################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# 
# RIDE_SHARE
# DRIVER_ID
# DATE
# COST
# RIDER_ID
# RATING
#
# Which layers are nested in each other?
# ride_share >> driver_id >> ride_num - date - rider_id - cost - rating
# Which layers of data "have" within it a different layer?
# *see above*
# Which layers are "next" to each other?
# date/rider_id/cost/rating

#######################################################
# Step 2: Assign a data structure to each layer
# ride_share:hash >> driver_id >> ride_num >> date - rider_id - cost - rating
# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################
# Step 3: Make the data structure!
# a Hash of arrays w/ hashes in it
ride_share = {
  DR0004: [
       { rider_id: 'RD0022'	, date: '3rd Feb 2016'	, cost: 5 , rating: 5 },
       { rider_id: 'RD0022'	, date: '4th Feb 2016	'	, cost: 10 , rating: 4 },
       { rider_id: 'RD0022'	, date: '5th Feb 2016'	, cost: 20 , rating: 5 }],
  
  DR0001: [
       { rider_id: 'RD0003	'	, date: '3rd Feb 2016'	, cost: 10 , rating: 3 },
       { rider_id: 'RD0015'	, date: '3rd Feb 2016'	, cost: 30 , rating: 4 },
       { rider_id: 'RD0003'	, date: '5th Feb 2016'	, cost: 45 , rating: 2 }],
  
  DR0002: [
       { rider_id: 'RD0073'	, date: '3rd Feb 2016'	, cost: 25 , rating: 5 },
       { rider_id: 'RD0013'	, date: '4th Feb 2016'	, cost: 15 , rating: 1 },
       { rider_id: 'RD0066'	, date: '5th Feb 2016'	, cost: 35 , rating: 3 }],
  
  DR0003: [
       { rider_id: 'RD0066'	, date: '4th Feb 2016'	, cost: 5 , rating: 5 },
       { rider_id: 'RD0003'	, date: '5th Feb 2016'	, cost:  50 , rating: 2 }]
      }

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

#######################################################
# Step 4: Total Driver's Earnings and Number of Rides
# Use an iteration blocks to print the following answers:

def line
  puts "#######################################################"
end

line

# - the number of rides each driver has given

def num_ride(ride_share)
  ride_share.each do |key, value|
    puts "#{key} has #{value.length} rides."
    end
end

num_ride(ride_share)

line

# - the total amount of money each driver has made

def driver_earn(ride_share)
  ride_share.each do | driver, array |
    total = 0
     array.each do |ride|
       total += ride[:cost]
    end
    puts "#{driver} made $#{total}"
  end
end

driver_earn(ride_share)

line

# - the average rating for each driver

def driver_avg(ride_share)
  ride_share.each do | driver, array |
    total = 0
     array.each do |ride|
       total += ride[:rating]
     end
    average = total.to_f / array.length
    puts "#{driver} made #{average.round(1)}"
  end
end

driver_avg(ride_share)

line

# - Which driver made the most money?

def driver_max_earn(ride_share)
  totals_hash = {}
  ride_share.each do | driver, array |
    total = 0
     array.each do |ride|
       total += ride[:cost]
    end
    totals_hash[driver] = total
    # max_arr << totals_hash
  end
  return totals_hash
end

highest_earner = driver_max_earn(ride_share).max_by { | driver, ride_totals | ride_totals }
puts "#{highest_earner[0]} earned the most with $#{highest_earner[1]}, BALLIN'!!!"

line

# - Which driver has the highest average rating?eb 2016", cost: "5", rating: "5"}]}

def driver_max_rate(ride_share)
  totals_rating_hash = {}
  ride_share.each do | driver, array |
    total = 0
    array.each do |ride|
      total += ride[:rating]
    end
    average = total.to_f / array.length
    totals_rating_hash[driver] = average.round(1)
  end
  return totals_rating_hash
end

highest_rating = driver_max_rate(ride_share).max_by { | driver, rate_totals| rate_totals}

puts "#{highest_rating[0]} had the highest rating with #{highest_rating[1]}"

line
