

# 
# Monnkey 0:
#   Starting items: 79, 98
# Operation: new = old * 19
# Test: divisible by 23
# If true: throw to monkey 2
# If false: throw to monkey 3

item_list <- list(c(79, 98), c(54, 65, 75, 74), c(9, 60, 97))
item_list

operate <- c(function(x) floor(x*19/3),  function(x) floor((x+6)/3))
operate


test <- c(function(x) x %% 23 == 0,  function(x) x %% 19 == 0)
test

throw <- function(x, item_list, monkey, item) {
  
  if(x){
    
    return(c(item_list[[2]], item_list[[monkey]][item]))
    
  } else{
    
    item_list[[3]] <<- c(item_list[[3]], item_list[[monkey]][1])
  }
  
  item_list[[monkey]] <<- item_list[[monkey]][-1]
}
  
#### Loop Through Monkeys #####
  

# Monkey 0 (1)
play <- test[[1]](operate[[1]](item_list[[1]]))
play

for (i in 1:length(play)){
  throw(play[i], item_list, 1)
}

# Monkey 1 (2)
play <- test[[2]](operate[[2]](item_list[[2]]))
play

for (i in 1:length(play)){
  throw(play[i], item_list, 2)
}

item_list


