# Pseudocode
# Deal or no deal. The user picks a a case between 1 and 20
# the money behind the case is random, and cases will use a key and value system for sotring data, possible even 2 arrays mihgt make it easier
# "The Banker" will periodically (every 5 turns?) offer the player a sum of money, which the player is able to accept or decline
# if accepted the game ends, if declined, the game continues
# the game will continue until a deal is accepted OR the users case is opened
# the game will utilize a soundboard using ruby gems and play sounds at different occasions
# a ringing noise for the banker ringing to offer a deal, crowd noises etc.

pid = fork{ exec 'afplay', "intro.mp3" }

puts "Welcome to Deal or No Deal!"
puts "The rules are simple. Each briefcase has a number in it that indicates the amount of money you'll win if when you open it. 
Periodically, the banker may offer you to take a deal. Its up to you on what you want to do!"

#arrays with case numbers and money values
cases_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
cases_values = ["$1", "$5", "$50", "$100", "$500", "$1000", "$5000", "$10,000", "$20,000", "$50,000", "$100,000", "$250,000", "$500,000", "$750,000", "$1,000,000"]
#empty array that takes already chosen values and puts prevents the user from selecting them again
used_cases = []
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

used_cases << choose_case1

puts "Alright, lets see what was in case number #{choose_case1}"

puts "Case #{choose_case1} contained #{opened_case1}." 

puts "Okay, choose another case"

choose_case2 = gets.chomp.to_i
until choose_case2 <= 15 and choose_case2 > 0
    puts "Please pick a number between 1 and 15"
    choose_case2 = gets.chomp.to_i
end
until choose_case2 != used_cases[0] and choose_case2 != users_case
    puts "You've already tried that one, please choose another"
    choose_case2 = gets.chomp.to_i
end

opened_case2 = cases_complete[choose_case2]

used_cases << choose_case2

puts "Alrighty, lets have a look at what was in case number #{choose_case2}"

puts "#{choose_case2} contained #{opened_case2}"

puts "Going good! Lets open another one"

choose_case3 = gets.chomp.to_i
until choose_case3 <= 15 and choose_case3 > 0
    puts "Please pick a number between 1 and 15"
    choose_case3 = gets.chomp.to_i
end
until choose_case3 != users_case and used_cases.include?(choose_case3) == false
    puts "You've picked that one, choose again"
    choose_case3 = gets.chomp.to_i
end

opened_case3 = cases_complete[choose_case3]

used_cases << choose_case3

banker1 = rand(10000)

puts "Lets have a look at what was in case number #{choose_case3}"

puts "#{choose_case3} contained #{opened_case3}"

pid = fork{ exec 'afplay', "banker.mp3" }

puts "Ring Ring!"

puts "It's the banker, he'd like to offer you a deal"

puts "The banker would like to offer you $#{banker1}. Deal? or no deal?"

dond1 = gets.chomp
dond1 = dond1.downcase

until dond1 == "deal" or dond1 == "no deal"
    puts "Please enter deal or no deal"
    dond1 = gets.chomp.downcase
end
    if dond1 == "deal"
        puts "Deal! Your total winnings is $#{banker1}. Thanks for playing!"
        pid = fork{ exec 'afplay', "applause.mp3" }
        exit
    end

    if dond1 == "no deal"
        puts "No deal! Lets continue!"
        pid = fork{ exec 'afplay', "applause.mp3" }
    end


puts "Okay! lets keep playing"

puts "Go ahead and choose another case"

choose_case4 = gets.chomp.to_i
until choose_case4 <= 15 and choose_case4 > 0
    puts "Please pick a number between 1 and 15"
    choose_case4 = gets.chomp.to_i
end
until choose_case4 != users_case and used_cases.include?(choose_case4) == false
    puts "You've already chosen that case before, please choose another"
    choose_case4 = gets.chomp.to_i
end

opened_case4 = cases_complete[choose_case4]

used_cases << choose_case4

puts "Lets see what's behind #{choose_case4}"

puts "#{choose_case4} contained #{opened_case4}"

puts "Alright, another case down. Choose another"

choose_case5 = gets.chomp.to_i
until choose_case5 <= 15 and choose_case5 > 0
    puts "Please pick a number between 1 and 15"
    choose_case5 = gets.chomp.to_i
end
until choose_case5 != users_case and used_cases.include?(choose_case5) == false
    puts "You've already chosen that case before, please choose another"
    choose_case5 = gets.chomp.to_i
end

opened_case5 = cases_complete[choose_case5]

used_cases << choose_case5

puts "lets see what was in #{choose_case5}!"

puts "#{choose_case5} contained #{opened_case5}"

puts "Alright, we're a third of the way there"

puts "Time to open another case"

choose_case6 = gets.chomp.to_i
until choose_case6 <= 15 and choose_case6 > 0
    puts "Please pick a number between 1 and 15"
    choose_case6 = gets.chomp.to_i
end
until choose_case6 != users_case and used_cases.include?(choose_case6) == false
    puts "You've already chosen that case before, please pick again"
    choose_case6 = gets.chomp.to_i
end

opened_case6 = cases_complete[choose_case6]

used_cases << choose_case6

puts "Ok, lets see what was in #{choose_case6}"

puts "#{choose_case6} contained #{opened_case6}"

puts "Ok, going strong. Lets open some more cases"

choose_case7 = gets.chomp.to_i
until choose_case7 <= 15 and choose_case7 > 0
    puts "Please pick a number between 1 and 15"
    choose_case7 = gets.chomp.to_i
end
until choose_case7 != users_case and used_cases.include?(choose_case7) == false
    puts "That case has already been chosen, please pick another"
    choose_case7 = gets.chomp.to_i
end

opened_case7 = cases_complete[choose_case7]

used_cases << choose_case7

puts "Alright, time to see what was behind #{choose_case7}"

puts "#{choose_case7} contained #{opened_case7}"

puts "Getting closer, lets open some more"

choose_case8 = gets.chomp.to_i
until choose_case8 <= 15 and choose_case8 > 0
    puts "Please pick a number between 1 and 15"
    choose_case8 = gets.chomp.to_i
end
until choose_case8 != users_case and used_cases.include?(choose_case8) == false
    puts "That case has already been chosen, please pick another"
    choose_case8 = gets.chomp.to_i
end

opened_case8 = cases_complete[choose_case8]

used_cases << choose_case8

puts "Ok, lets have a look at what was in case number #{choose_case8}"

puts "#{choose_case8} contained #{opened_case8}"

puts "Ring Ring!"

pid = fork{ exec 'afplay', "banker.mp3" }

banker2 = rand(70000)

puts "That'll be the banker again, I think he'd like to offer you another deal!"

puts "The banker would like to offer you $#{banker2}. Deal? or no deal?"

dond2 = gets.chomp.downcase


until dond2 == "deal" or dond2 == "no deal"
    puts "Please enter deal or no deal"
    dond2 = gets.chomp.downcase
end 

    if dond2 == "deal"
        puts "Deal! your total winnings is $#{banker2}. Thanks for playing!"
        pid = fork{ exec 'afplay', "applause.mp3" }
        exit
    end

    if dond2 == "no deal"
        puts "No deal! Lets continue!"
        pid = fork{ exec 'afplay', "applause.mp3" }
    end

puts "Time to pick another case, what will it be?"

choose_case9 = gets.chomp.to_i

until choose_case9 <= 15 and choose_case9 > 0
    puts "Please put a number between 1 and 15"
    choose_case9 = gets.chomp.to_i
end

until choose_case9 != users_case and used_cases.include?(choose_case9) == false
    puts "You've already chosen that case, please pick another one"
    choose_case9 = gets.chomp.to_i
end

opened_case9 = cases_complete[choose_case9]

used_cases << choose_case9

puts "Ok, let's see what was behind case number #{choose_case9}"

puts "#{choose_case9} contained #{opened_case9}"

puts "9 cases down, lets continue"

choose_case10 = gets.chomp.to_i
    until choose_case10 <= 15 and choose_case10 > 0
        puts "Please pick a number between 1 and 15"
        choose_case10 = gets.chomp.to_i
    end

until choose_case10 != users_case and used_cases.include?(choose_case10) == false
    puts "You've already chosen that case, please pick another"
    choose_case10 = gets.chomp.to_i
end

opened_case10 = cases_complete[choose_case10]

used_cases << choose_case10

puts "Time to look inside case #{choose_case10}"

puts "#{choose_case10} contained #{opened_case10}"

puts "Okay, we're heading into the end game now. Lets continue"

choose_case11 = gets.chomp.to_i
    until choose_case11 <= 15 and choose_case11 > 0
        puts "Please pick a number between 1 and 15"
        choose_case11 = gets.chomp.to_i
    end

until choose_case11 != users_case and used_cases.include?(choose_case11) == false
    puts "You've already chosen that case, please pick another"
    choose_case11 = gets.chomp.to_i
end

opened_case11 = cases_complete[choose_case11]

used_cases << choose_case11

puts "Lets see what was inside case number #{choose_case11}"

puts "#{choose_case11} contained #{opened_case11}"

puts "Alright, lets keep marching on. Pick another case"

choose_case12 = gets.chomp.to_i
    until choose_case12 <= 15 and choose_case12 > 0
        puts "Please pick a number between 1 and 15"
        choose_case12 = gets.chomp.to_i
    end

until choose_case12 != users_case and used_cases.include?(choose_case12) == false
    puts "You've already chosen that case, please pick another"
    choose_case12 = gets.chomp.to_i
end

opened_case12 = cases_complete[choose_case12]

used_cases << choose_case12

puts "Let's see whats behind case number #{choose_case12}"

puts "#{choose_case12} contained #{opened_case12}"

banker3 = rand(500000)

pid = fork{ exec 'afplay', "banker.mp3" }

puts "Ring Ring!"

puts "Looks like it's the banker again. This will be the last deal he's going to offer you"

puts "The banker would like to offer you $#{banker3}. Deal? or no deal?"

dond3 = gets.chomp.downcase


until dond3 == "deal" or dond3 == "no deal"
    puts "Please enter deal or no deal"
    dond3 = gets.chomp.downcase
end 

    if dond3 == "deal"
        puts "Deal! your total winnings is $#{banker3}. Thanks for playing!"
        pid = fork{ exec 'afplay', "applause.mp3" }
        exit
    end

    if dond3 == "no deal"
        puts "No deal! Lets continue!"
        pid = fork{ exec 'afplay', "applause.mp3" }
    end


puts "2 cases remain. Lets continue"

puts "Please choose a case"

choose_case13 = gets.chomp.to_i
    until choose_case13 <= 15 and choose_case13 > 0
        puts "Please pick a number between 1 and 15"
        choose_case13 = gets.chomp.to_i
    end

until choose_case13 != users_case and used_cases.include?(choose_case13) == false
    puts "You've already chosen that case, please pick another"
    choose_case13 = gets.chomp.to_i
end

opened_case13 = cases_complete[choose_case13]

used_cases << choose_case13

puts "Alright, lets have a peek behind case number #{choose_case13}"

puts "#{choose_case13} contained #{opened_case13}"

puts "Ok, this is the last case to choose before we open up yours"

puts "Please choose your last case"

choose_case14 = gets.chomp.to_i
    until choose_case14 <= 15 and choose_case14 > 0
        puts "Please pick a number between 1 and 15"
        choose_case14 = gets.chomp.to_i
    end

until choose_case14 != users_case and used_cases.include?(choose_case14) == false
    puts "You've already chosen that case, please pick another"
    choose_case14 = gets.chomp.to_i
end

opened_case14 = cases_complete[choose_case14]

used_cases << choose_case14

puts "Alright, this is it. Lets see how you did"

puts "#{choose_case14} contained #{opened_case14}"

puts "Which means your case contained #{users_complete_case}"

puts "Congratulations! Thanks for playing Deal or no Deal!"

pid = fork{ exec 'afplay', "intro.mp3" }

