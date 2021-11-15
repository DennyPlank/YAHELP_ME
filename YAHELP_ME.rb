# a restaruant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES) ie 'mon,tue,wed',
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }


user1 = {
  id: 1,
  name: "Tony",
}
user2 = {
  id: 2,
  name: "Sally",
}
res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}

# returns the name of a user -DONE-
def find_a_user (user)
  return user[:name]
end

#returns the name of a user through a review -Done-
@users = [user1, user2]
def get_nested_name(review)
  user_id = review[:reviews][0][:user_id]
  user_id.class
  user = @users.find { |users| users[:id] == user_id }
  return user[:name]
end

# Access reviews -DONE-
def reviews(restaraunt)
  return restaraunt[:reviews].each do |review|
  puts " #{review[:rating]}"
  end
end

# print out the name of dishes in res1 -DONE-
 def name_of_dishes(restaraunt)
   return restaraunt[:dishes].each do |dish|
    puts "#{dish[:name]} "
   end
  end

# print out just the name or res1 dishes along with ingredients -DONE-
def name_and_ing(res)
       res[:dishes].each do |dish|
         puts "#{dish[:name]}"
       dish[:ingredients].each do |ing|
         puts "#{ing}"
     end
  end 
end

  # create a function that takes a user and return a string with the users name and id -DONE-
  def find_user_id (user)
     user_id = user[:id]
     user_name = user[:name]
     puts "user# #{user_id} is named '#{user_name}'"
  end
 
  #create a method that takes a res and returns the menu of that res -DONE-
  def find_menu (res)
    puts "Menu:"
      res[:dishes].each do |dish|
       puts dish[:name]
    end
  end

  #create a function that takes a res and returns average review -DONE-
  def avrg_rev (res)
    total = 0
    length = 0
    res[:reviews].each do |rate|
      total += rate[:rating]
      length += 1
    end 
    average = total / length
    puts "The average rating is #{average}"
  end

# Create an array of restaurants and do CRUD (Create, Read, Update, Destroy) actions on that array


# Create: a method  that takes a restaurant and adds to your array -DONE-

@my_restaraunts = [res1, res2]

def add_res (new_res)
  @my_restaraunts.push(new_res)
end
add_res(res1)

# Read: a method that display all res info -DONE-
def res_info (res)
  dish_name = []
  res[:dishes].each do |dish|
  dish_name.push(dish[:name])
  end
  location = "#{res[:location][:city]}, #{res[:location][:state]}"
  puts "The name is #{res[:name]}, ID=#{res[:id]}"
  puts "#{res[:name]} is in #{location}"
  puts "#{res[:name]} serves #{dish_name[0]} and #{dish_name[1]}"
end

# First Attempt to retrun 500 likes only
def res_rating (res)
   if res[:likes] > 500
   puts "#{res[:name]} has over 500 likes"
  else
   puts "Sorry, your restauraunt is not popular"
  end
end


# Second Attempt at returning 500 likes -DONE- (but wrong method)
res3 = [res1, res2]

def return_if_popular (arr)
  puts "Searching..."
  arr.each do |res|
    if res[:likes] > 500
      puts "#{res[:name]} is popular and has #{res[:likes]} good reviews"
    end
  end
end
return_if_popular(res3)