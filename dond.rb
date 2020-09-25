# Pseudocode
# Deal or no deal. The user picks a a case between 1 and 20
# the money behind the case is random, and cases will use a key and value system for sotring data, possible even 2 arrays mihgt make it easier
# "The Banker" will periodically (every 5 turns?) offer the player a sum of money, which the player is able to accept or decline
# if accepted the game ends, if declined, the game continues
# the game will continue until a deal is accepted OR the users case is opened
# the game will utilize a soundboard using ruby gems and play sounds at different occasions
# a ringing noise for the banker ringing to offer a deal, crowd noises etc.


puts "Welcome to Deal or No Deal!"
puts "The rules are simple. Each briefcase has a number in it that indicates the amount of money you'll win if when you open it. 
Periodically, the banker may offer you to take a deal. Its up to you on what you want to do!"

#arrays with case numbers and money values
cases_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
cases_values = ["$1", "$5", "$50", "$100", "$500", "$1000", "$5000", "$10,000", "$20,000", "$50,000", "$100,000", "$250,000", "$500,000", "$750,000", "$1,000,000"]

#code to convert both arrays into a key and value pair. randomizes the value of the key
cases_complete = Hash[cases_arr.zip(cases_values.shuffle)]


    puts "Lets start by choosing a case! Please pick between 1 and 15"


    #user input loops until numbers is between 1 and 15
    users_case = gets.chomp.to_i
    until users_case > 0
        puts "Please pick a number higher then 0"
        users_case = gets.chomp.to_i 
    end
    until users_case <= 15
        puts "Please enter a number between 1 and 15"
        users_case = gets.chomp.to_i
    end


    #users case with random value inside
users_complete_case = cases_complete[users_case]

puts "Okay, your case is #{users_case}. Please pick a case you'd like to open"

choose_case1 = gets.chomp.to_i
until choose_case1 <= 15 and choose_case1 > 0
    puts "Please pick a number between 1 and 15"
    choose_case1 = gets.chomp.to_i
end
until choose_case1 != users_case
    puts "You can't choose your own case! Pick another"
    choose_case1 = gets.chomp.to_i
end

opened_case1 = cases_complete[choose_case1]

puts "Alright, lets see what was in case number #{choose_case1}"

puts "Case #{choose_case1} contained #{opened_case1}." 

puts "Okay, choose another case"

choose_case2 = gets.chomp.to_i
until choose_case2 <= 15 and choose_case2 > 0
    puts "Please pick a number between 1 and 15"
    choose_case2 = gets.chomp.to_i
end
until choose_case2 != choose_case1 and choose_case2 != users_case
    puts "You've already tried that one, please choose another"
    choose_case2 = gets.chomp.to_i
end

opened_case2 = cases_complete[choose_case2]

puts "Alrighty, lets have a look at what was in case number #{choose_case2}"

puts "#{choose_case2} contained #{opened_case2}"

puts "Going good! Lets open another one"

choose_case3 = gets.chomp.to_i
until choose_case3 <= 15 and choose_case3 > 0
    puts "Please pick a number between 1 and 15"
    choose_case3 = gets.chomp.to_i
end
until choose_case3 != users_case and choose_case3 != choose_case1 and choose_case3 != choose_case2
    puts "You've picked that one, choose again"
    choose_case3 = gets.chomp.to_i
end

opened_case3 = cases_complete[choose_case3]

puts "Lets have a look at what was in case number #{choose_case3}"

puts "#{choose_case3} contained #{opened_case3}"

puts "Ring Ring!"

puts "It's the banker, he'd like to offer you a deal"

puts "The banker would like to offer you $#{rand(10000)}. Deal? or no deal?"

dond1 = gets.chomp
dond1 = dond1.downcase

unless dond1 == "no deal"
    puts "Deal! Thanks for playing!"
    exit
end
if dond1 == "no deal"
    puts "No Deal! Lets Continue!"
end

puts "Okay! lets keep playing"

puts "Go ahead and choose another case"

choose_case4 = gets.chomp.to_i
until choose_case4 <= 15 and choose_case4 > 0
    puts "Please pick a number between 1 and 15"
    choose_case4 = gets.chomp.to_i
end
until choose_case4 != users_case and choose_case4 != choose_case1 and choose_case4 != choose_case2 and choose_case4 != choose_case3
    puts "You've already chosen that case before, please choose another"
    choose_case4 = gets.chomp.to_i
end

opened_case4 = cases_complete[choose_case4]

puts "Lets see what's behind #{choose_case4}"

puts "#{choose_case4} contained #{opened_case4}"

puts "Alright, another case down. Choose another"

choose_case5 = gets.chomp.to_i
until choose_case5 <= 15 and choose_case5 > 0
    puts "Please pick a number between 1 and 15"
    choose_case5 = gets.chomp.to_i
end
until choose_case5 != users_case and choose_case5 != choose_case4 and choose_case5 != choose_case3 and choose_case5 != choose_case2 and choose_case5 != choose_case1
    puts "You've already chosen that case before, please choose another"
    choose_case5 = gets.chomp.to_i
end

opened_case5 = cases_complete[choose_case5]

puts "lets see what was in #{choose_case5}!"

puts "#{choose_case5} contained #{opened_case5}"

puts "Alright, we're a third of the way there"

puts "Time to open another case"

choose_case6 = gets.chomp.to_i
until choose_case6 <= 15 and choose_case6 > 0
    puts "PLease pick a number between 1 and 15"
    choose_case6 = gets.chomp.to_i
end
until choose_case6 != users_case and choose_case6 != choose_case5 and choose_case6 != choose_case4 and choose_case6 != choose_case3 and choose_case6 != choose_case2 and choose_case6 != choose_case1
    puts "You've already chosen that case before, please pick again"
    choose_case6 = gets.chomp.to_i
end

opened_case6 = cases_complete[choose_case6]

puts "Ok, lets see what was in #{choose_case6}"

puts "#{choose_case6} contained #{opened_case6}"

puts "Ok, going strong. Lets open some more cases"

