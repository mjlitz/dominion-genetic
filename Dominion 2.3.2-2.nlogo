breed[chromosomes chromosome]

chromosomes-own [
  genome1
  fitness
  fitness1
  fitness2
  fitness3
  deck
  hand
  playarea
  discard
  decknum
  buys
  action]

globals [
  listfitness
  num-variable
  num-variable2
  num-variable21
  num-variable22
  prob1
  prob2
  prob3
  prob4
  prob5
  prob6
  prob7
  prob8
  prob9
  parent11
  parent12
  parent21
  parent22
  parent31
  parent32
  parent41
  parent42
  parent51
  parent52
  parent61
  parent62
  parent71
  parent72
  parent81
  parent82
  gen1
  gen2
  gen3
  gen4
  gen5
  gen6
  gen7
  gen8
  gen9
  gen10
  fight1
  fight2
  supply
  buylist
  turn
  actions
  curse
  draw
  cardplay
  player1name
  player2name
  actionqueue-c
  actionqueue-t
  emptypiles
  actionindex
  king
  VP
 ]

to setprob
  set prob1 90
  set prob2 90
  set prob3 90
  set prob4 90
  set prob5 90
  set prob6 90
  set prob7 90
  set prob8 90
  set prob9 90
end  

to play-game
  set listfitness (sort-on [(- fitness)] chromosomes)
  ask item 1 listfitness [set fight1 who]
  ask item 0 listfitness [set fight2 who]
  play-dominion
  ask item 3 listfitness [set fight1 who]
  ask item 2 listfitness [set fight2 who]
  play-dominion
  ask item 5 listfitness [set fight1 who]
  ask item 4 listfitness [set fight2 who]
  play-dominion
  ask item 7 listfitness [set fight1 who]
  ask item 6 listfitness [set fight2 who]
  play-dominion
  ask item 9 listfitness [set fight1 who]
  ask item 8 listfitness [set fight2 who]
  play-dominion 
end

to determinefitness
  play-game
  ask turtles [set fitness1 fitness]
  play-game
  ask turtles [set fitness2 fitness]
  play-game
  ask turtles [set fitness3 fitness]
  ask turtles [set fitness sentence fitness1 fitness2]
  ask turtles [set fitness sentence fitness fitness3]
  ask turtles [set fitness reduce + fitness]
end

to play-once
  set-geneticalgorithm
  set fight1 0
  set fight2 1
  play-dominion
end

to set-geneticalgorithm
  clear-all
  reset-ticks
  set num-variable 144
  set num-variable2 16
  set num-variable21 6
  set num-variable22 50
  create-chromosomes 10 [hide-turtle]
  ask chromosomes [set genome1 list ( random num-variable22 + 1) ( random num-variable22 + 1)]
  ask chromosomes [repeat num-variable21 - 2 [set genome1 fput  (random num-variable22 + 1) genome1]]
  ask chromosomes [repeat 60 [set genome1 fput  (random num-variable2 + 1) genome1]]
  ask chromosomes [repeat 24 [set genome1 fput random 16 genome1]]
  ask chromosomes [repeat 12 [set genome1 fput random 14 genome1]]
  ask chromosomes [repeat 12 [set genome1 fput random 8 genome1]]
  ask chromosomes [repeat 12 [set genome1 fput random 6 genome1]]
  ask chromosomes [repeat 12 [set genome1 fput random 3 genome1]]
  ask chromosomes [repeat 12 [set genome1 fput random 2 genome1]]
end

to geneticalgorithm
  set-geneticalgorithm
  setprob
  determinefitness
end

to chooseparents1
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent11 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent11 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent11 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent11 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent11 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent11 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent11 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent11 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent11 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent11 (butfirst genome1) 
                          ]]]]]]]]]]
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent21 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent21 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent21 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent21 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent21 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent21 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent21 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent21 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent21 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent21 (butfirst genome1) 
                          ]]]]]]]]]]
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent31 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent31 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent31 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent31 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent31 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent31 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent31 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent31 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent31 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent31 (butfirst genome1) 
                          ]]]]]]]]]]
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent41 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent41 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent41 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent41 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent41 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent41 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent41 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent41 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent41 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent41 (butfirst genome1) 
                          ]]]]]]]]]]
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent51 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent51 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent51 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent51 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent51 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent51 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent51 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent51 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent51 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent51 (butfirst genome1) 
                          ]]]]]]]]]]
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent61 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent61 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent61 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent61 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent61 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent61 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent61 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent61 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent61 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent61 (butfirst genome1) 
                          ]]]]]]]]]]
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent71 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent71 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent71 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent71 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent71 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent71 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent71 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent71 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent71 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent71 (butfirst genome1) 
                          ]]]]]]]]]]
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent81 (butfirst genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent81 (butfirst genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent81 (butfirst genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent81 (butfirst genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent81 (butfirst genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent81 (butfirst genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent81 (butfirst genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent81 (butfirst genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent81 (butfirst genome1) ]]
                    [ask item 9 listfitness [set parent11 (butfirst genome1) 
                          ]]]]]]]]]]
end

to chooseparents2
  ifelse random 100 < prob1 [ask item 0 listfitness [set parent12 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent12 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent12 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent12 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent12 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent12 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent12 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent12 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent12 (genome1) ]]
                    [ask item 9 listfitness [set parent12 (genome1) 
                          ]]]]]]]]]]

ifelse random 100 < prob1 [ask item 0 listfitness [set parent22 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent22 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent22 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent22 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent22 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent22 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent22 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent22 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent22 (genome1) ]]
                    [ask item 9 listfitness [set parent22 (genome1) 
                          ]]]]]]]]]]

ifelse random 100 < prob1 [ask item 0 listfitness [set parent32 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent32 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent32 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent32 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent32 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent32 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent32 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent32 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent32 (genome1) ]]
                    [ask item 9 listfitness [set parent12 (genome1) 
                          ]]]]]]]]]]

ifelse random 100 < prob1 [ask item 0 listfitness [set parent42 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent42 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent42 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent42 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent42 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent42 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent42 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent42 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent42 (genome1) ]]
                    [ask item 9 listfitness [set parent12 (genome1) 
                          ]]]]]]]]]]

ifelse random 100 < prob1 [ask item 0 listfitness [set parent52 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent52 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent52 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent52 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent52 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent52 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent52 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent52 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent52 (genome1) ]]
                    [ask item 9 listfitness [set parent52 (genome1) 
                          ]]]]]]]]]]
    
ifelse random 100 < prob1 [ask item 0 listfitness [set parent62 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent62 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent62 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent62 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent62 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent62 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent62 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent62 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent62 (genome1) ]]
                    [ask item 9 listfitness [set parent52 (genome1) 
                          ]]]]]]]]]]

ifelse random 100 < prob1 [ask item 0 listfitness [set parent72 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent72 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent72 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent72 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent72 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent72 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent72 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent72 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent72 (genome1) ]]
                    [ask item 9 listfitness [set parent52 (genome1) 
                          ]]]]]]]]]]
    
ifelse random 100 < prob1 [ask item 0 listfitness [set parent82 (genome1) ]]
    [ifelse random 100 < prob2 [ask item 1 listfitness [set parent82 (genome1) ]]
      [ifelse random 100 < prob3 [ask item 2 listfitness [set parent82 (genome1) ]]
        [ifelse random 100 < prob4 [ask item 3 listfitness [set parent82 (genome1) ]]
          [ifelse random 100 < prob5 [ask item 4 listfitness [set parent82 (genome1) ]]
            [ifelse random 100 < prob6 [ask item 5 listfitness [set parent82 (genome1) ]]
              [ifelse random 100 < prob7 [ask item 6 listfitness [set parent82 (genome1) ]]
                [ifelse random 100 < prob8 [ask item 7 listfitness [set parent82 (genome1) ]]
                  [ifelse random 100 < prob9 [ask item 8 listfitness [set parent82 (genome1) ]]
                    [ask item 9 listfitness [set parent52 (genome1) 
                          ]]]]]]]]]]
end

to crossover
  set gen3 sentence parent12 parent11
  set gen4 sentence parent22 parent21
  set gen5 sentence parent32 parent31
  set gen6 sentence parent42 parent41
  set gen7 sentence parent52 parent51
  set gen8 sentence parent62 parent61
  set gen9 sentence parent72 parent71
  set gen10 sentence parent82 parent81
end

to mutate

  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen3 (replace-item random 12 gen3 random 2)][
      ifelse random (150 - 12) < 12 [set gen3 (replace-item (12 + random 12) gen3 random (3))][
      ifelse random (150 - 24) < 12 [set gen3 (replace-item (24 + random 12) gen3 random (6))][
      ifelse random (150 - 36) < 12 [set gen3 (replace-item (36 + random 12) gen3 random (8))][
      ifelse random (150 - 48) < 12 [set gen3 (replace-item (48 + random 12) gen3 random (14))][
      ifelse random (150 - 60) < 24 [set gen3 (replace-item (60 + random 24) gen3 random (16))][
      ifelse random (150 - 84) < 60 [set gen3 (replace-item (84 + random 60) gen3 random (17))][
      set gen3 (replace-item (144 + random 6) gen3 random (50))]]]]]]]]
      
       ;; does random position in genome and mutates it, keeping the last 6 places with 50 variables
  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen4 (replace-item random 12 gen4 random 2)][
      ifelse random (150 - 12) < 12 [set gen4 (replace-item (12 + random 12) gen4 random (3))][
      ifelse random (150 - 24) < 12 [set gen4 (replace-item (24 + random 12) gen4 random (6))][
      ifelse random (150 - 36) < 12 [set gen4 (replace-item (36 + random 12) gen4 random (8))][
      ifelse random (150 - 48) < 12 [set gen4 (replace-item (48 + random 12) gen4 random (14))][
      ifelse random (150 - 60) < 24 [set gen4 (replace-item (60 + random 24) gen4 random (16))][
      ifelse random (150 - 84) < 60 [set gen4 (replace-item (84 + random 60) gen4 random (17))][
      set gen4 (replace-item (144 + random 6) gen4 random (50))]]]]]]]]
  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen5 (replace-item random 12 gen5 random 2)][
      ifelse random (150 - 12) < 12 [set gen5 (replace-item (12 + random 12) gen5 random (3))][
      ifelse random (150 - 24) < 12 [set gen5 (replace-item (24 + random 12) gen5 random (6))][
      ifelse random (150 - 36) < 12 [set gen5 (replace-item (36 + random 12) gen5 random (8))][
      ifelse random (150 - 48) < 12 [set gen5 (replace-item (48 + random 12) gen5 random (14))][
      ifelse random (150 - 60) < 24 [set gen5 (replace-item (60 + random 24) gen5 random (16))][
      ifelse random (150 - 84) < 60 [set gen5 (replace-item (84 + random 60) gen5 random (17))][
      set gen5 (replace-item (144 + random 6) gen5 random (50))]]]]]]]]
  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen6 (replace-item random 12 gen6 random 2)][
      ifelse random (150 - 12) < 12 [set gen6 (replace-item (12 + random 12) gen6 random (3))][
      ifelse random (150 - 24) < 12 [set gen6 (replace-item (24 + random 12) gen6 random (6))][
      ifelse random (150 - 36) < 12 [set gen6 (replace-item (36 + random 12) gen6 random (8))][
      ifelse random (150 - 48) < 12 [set gen6 (replace-item (48 + random 12) gen6 random (14))][
      ifelse random (150 - 60) < 24 [set gen6 (replace-item (60 + random 24) gen6 random (16))][
      ifelse random (150 - 84) < 60 [set gen6 (replace-item (84 + random 60) gen6 random (17))][
      set gen6 (replace-item (144 + random 6) gen6 random (50))]]]]]]]]
  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen7 (replace-item random 12 gen7 random 2)][
      ifelse random (150 - 12) < 12 [set gen7 (replace-item (12 + random 12) gen7 random (3))][
      ifelse random (150 - 24) < 12 [set gen7 (replace-item (24 + random 12) gen7 random (6))][
      ifelse random (150 - 36) < 12 [set gen7 (replace-item (36 + random 12) gen7 random (8))][
      ifelse random (150 - 48) < 12 [set gen7 (replace-item (48 + random 12) gen7 random (14))][
      ifelse random (150 - 60) < 24 [set gen7 (replace-item (60 + random 24) gen7 random (16))][
      ifelse random (150 - 84) < 60 [set gen7 (replace-item (84 + random 60) gen7 random (17))][
      set gen7 (replace-item (144 + random 6) gen7 random (50))]]]]]]]]
  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen8 (replace-item random 12 gen8 random 2)][
      ifelse random (150 - 12) < 12 [set gen8 (replace-item (12 + random 12) gen8 random (3))][
      ifelse random (150 - 24) < 12 [set gen8 (replace-item (24 + random 12) gen8 random (6))][
      ifelse random (150 - 36) < 12 [set gen8 (replace-item (36 + random 12) gen8 random (8))][
      ifelse random (150 - 48) < 12 [set gen8 (replace-item (48 + random 12) gen8 random (14))][
      ifelse random (150 - 60) < 24 [set gen8 (replace-item (60 + random 24) gen8 random (16))][
      ifelse random (150 - 84) < 60 [set gen8 (replace-item (84 + random 60) gen8 random (17))][
      set gen8 (replace-item (144 + random 6) gen8 random (50))]]]]]]]]
  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen9 (replace-item random 12 gen9 random 2)][
      ifelse random (150 - 12) < 12 [set gen9 (replace-item (12 + random 12) gen9 random (3))][
      ifelse random (150 - 24) < 12 [set gen9 (replace-item (24 + random 12) gen9 random (6))][
      ifelse random (150 - 36) < 12 [set gen9 (replace-item (36 + random 12) gen9 random (8))][
      ifelse random (150 - 48) < 12 [set gen9 (replace-item (48 + random 12) gen9 random (14))][
      ifelse random (150 - 60) < 24 [set gen9 (replace-item (60 + random 24) gen9 random (16))][
      ifelse random (150 - 84) < 60 [set gen9 (replace-item (84 + random 60) gen9 random (17))][
      set gen9 (replace-item (144 + random 6) gen9 random (50))]]]]]]]]
  if random 100 < mutation-rate [ifelse random (num-variable + num-variable21) < 12 [set gen10 (replace-item random 12 gen10 random 2)][
      ifelse random (150 - 12) < 12 [set gen10 (replace-item (12 + random 12) gen10 random (3))][
      ifelse random (150 - 24) < 12 [set gen10 (replace-item (24 + random 12) gen10 random (6))][
      ifelse random (150 - 36) < 12 [set gen10 (replace-item (36 + random 12) gen10 random (8))][
      ifelse random (150 - 48) < 12 [set gen10 (replace-item (48 + random 12) gen10 random (14))][
      ifelse random (150 - 60) < 24 [set gen10 (replace-item (60 + random 24) gen10 random (16))][
      ifelse random (150 - 84) < 60 [set gen10 (replace-item (84 + random 60) gen10 random (17))][
      set gen10 (replace-item (144 + random 6) gen10 random (50))]]]]]]]]
end

to newgeneration
  ask chromosome 0 [set genome1 (gen1)]
  ask chromosome 1 [set genome1 (gen2)]
  ask chromosome 2 [set genome1 (gen3)]
  ask chromosome 3 [set genome1 (gen4)]
  ask chromosome 4 [set genome1 (gen5)]
  ask chromosome 5 [set genome1 (gen6)]
  ask chromosome 6 [set genome1 (gen7)]
  ask chromosome 7 [set genome1 (gen8)]
  ask chromosome 8 [set genome1 (gen9)]
  ask chromosome 9 [set genome1 (gen10)]
end

To Reproduce
  set listfitness (sort-on [(- fitness)] chromosomes)
  ask item 0 listfitness [set gen1 (genome1)]
  ask item 1 listfitness [set gen2 (genome1)] ;; keeps most fit genomes
  chooseparents1 ;; chooses random parents based on most fit

  repeat random num-variable - 2 [set parent11 (butfirst parent11)]
  repeat random num-variable - 2 [set parent21 (butfirst parent21)]
  repeat random num-variable - 2 [set parent31 (butfirst parent31)]
  repeat random num-variable - 2 [set parent41 (butfirst parent41)] ;; set up parent1 for random crossing over
  repeat random num-variable - 2 [set parent51 (butfirst parent51)]
  repeat random num-variable - 2 [set parent61 (butfirst parent61)]
  repeat random num-variable - 2 [set parent71 (butfirst parent71)]
  repeat random num-variable - 2 [set parent81 (butfirst parent81)]
  
  chooseparents2
  
  repeat length parent11 [set parent12 (butlast parent12)]
  repeat length parent21 [set parent22 (butlast parent22)]
  repeat length parent31 [set parent32 (butlast parent32)]
  repeat length parent41 [set parent42 (butlast parent42)] ;; sets up parent2 for random crossing over based on length of parent1, so the genome will remain the same size
  repeat length parent51 [set parent52 (butlast parent52)]
  repeat length parent61 [set parent62 (butlast parent62)]
  repeat length parent71 [set parent72 (butlast parent72)]
  repeat length parent81 [set parent82 (butlast parent82)]
  
  crossover
  mutate
  ask item 2 listfitness [set gen3 (genome1)]
  ask item 3 listfitness [set gen4 (genome1)]
  newgeneration
end

To Go
  Reproduce  
  determinefitness
  tick
  if ticks = numgen [stop]
end

to-report deck-compile
  set deck (shuffle ["COPPER" "COPPER" "COPPER" "COPPER" "COPPER" "COPPER" "COPPER" "ESTATE" "ESTATE" "ESTATE"])
  set discard []
  set playarea []
  set hand []
  report deck
  
end

to draw-cards [cards]
  set decknum length(deck)
  ifelse cards > length (sentence deck discard) [set cards decknum][
  ifelse decknum < cards [
    let cardsleft cards - decknum
    set hand (sentence hand deck)
    set deck discard
    set discard []
    set deck shuffle deck
    set hand (sentence hand (sublist deck 0 cardsleft))
    set deck sublist deck cardsleft length(deck)
    if print? = true [print "  You reshuffle."]
  ]
  [
    set hand (sentence hand (sublist deck 0 cards))
    set deck sublist deck cards length(deck)
  ]]
end

to actionformat
  type "    " type actions type " Action"
  ifelse actions = 1
    [print ""]
    [type "s" print ""]
end
    
to buyformat
  type "    " type buys type " Buy"
  ifelse buys = 1
    [print ""]
    [type "s" print ""]
end

to play-dominion []
  if print? = true
[  print "Dominion 2.1.1 Feb 11 2013 20:29"
  print "Genetic Algorithm. Computer run."]
  set supply 
   ["COPPER" 60 "SILVER" 40 
    "GOLD" 30 "ESTATE" 8 
    "DUCHY" 8 "PROVINCE" 8 
    "VILLAGE" 10 "SMITHY" 10 
    "LAB" 10 "WOODCUTTER" 10 
    "MARKET" 10 "FESTIVAL" 10
    "COUNCILROOM" 10 "WITCH" 10
    "CURSE" 10 "ADVENTURER" 10
    "MONEYLENDER" 10 "NOTHING" 150
    ]
  set buylist 
   ["COPPER" 0 "SILVER" 3 
    "GOLD" 6 "ESTATE" 2 
    "DUCHY" 5 "PROVINCE" 8 
    "VILLAGE" 3 "WOODCUTTER" 3 
    "SMITHY" 4 "LAB" 5 
    "MARKET" 5 "FESTIVAL" 5
    "COUNCILROOM" 5 "WITCH" 5
    "ADVENTURER" 6 "MONEYLENDER" 4
    "NOTHING" 0]
  ;create initial deck for each player
  ask turtles [
    set deck deck-compile
    if print? = true [print deck]
  ]
  set turn 0
  set emptypiles 0
  set curse 0
  set draw 0
set player1name sentence "Chromosome " fight1
  set player2name sentence "Chromosome " fight2
  while [item 11 supply != 0 and emptypiles < 3]
  [
    set turn turn + 1
  ;; start of turn
  ask chromosome fight1 [take-turn player1name player2name]
  if playernumber = 2 [ask chromosome fight2 [take-turn player2name player1name]]
 ]
  ask chromosome fight1 [
  let allcards sentence hand deck
  set allcards sentence allcards discard
  set VP ((length(filter [? = "PROVINCE"] allcards) * 6) + (length(filter [? = "DUCHY"] allcards) * 3) + (length(filter [? = "ESTATE"] allcards) * 1))
  type player1name type " had " type VP type " points."
  ask chromosome fight1 [set fitness VP]
  ]
    if playernumber = 2 [ask chromosome fight2 [
  let allcards sentence hand deck
  set allcards sentence allcards discard
  set VP ((length(filter [? = "PROVINCE"] allcards) * 6) + (length(filter [? = "DUCHY"] allcards) * 3) + (length(filter [? = "ESTATE"] allcards) * 1))
  type player2name type " had " type VP print " points."
  ]
    ask chromosome fight2 [
  set fitness VP]
    ]
end

to take-turn [playername1 playername2]
    if print? = true [print ""
    type playername1 type "'s Turn " print turn]
    ;; PRE-TURN PREPARATIONS
    if turn = 1 [draw-cards 5]
    while [curse > 0 and item 29 supply != 0]
     [
      set discard (lput "CURSE" discard) 
      set curse (curse - 1)
     ]
    while [draw > 0]
     [draw-cards 1 set draw (draw - 1)]
    set actions 1
    set buys 1
    let coins 0
    while [actions > 0] 
    [
      set action ""
      if print? = true [
      type "  Deck " type length(deck) print " Cards"
      type "  Hand " print hand
      actionformat
      buyformat
      ]
      let coppers filter [? = "COPPER"] hand
      let silvers filter [? = "SILVER"] hand
      let golds filter [? = "GOLD"] hand
      let moneytotal (length(coppers) + length(silvers) * 2 + length(golds) * 3)
      if print? = true [type "    $" print (moneytotal + coins)]
      ;;COMPUTER CONTROLLED ACTION PLAYING
      let chainlist ["FESTIVAL" "MARKET" "LAB" "VILLAGE"]
      set actionqueue-c []
      let index 0
      while [index < length(hand) and actions > 0]
        [
       if (member? (item index hand) chainlist) = true
      [set actionqueue-c (lput (item index hand) actionqueue-c)]
      set index (index + 1)
      ]
      set index 0
      while [length(actionqueue-c) > index]
       [
        set action (item index actionqueue-c)
        set cardplay false
        if action = "VILLAGE" [set actions (actions + 2) draw-cards 1 set cardplay true]
        if action = "FESTIVAL" [set actions (actions + 2) set coins (coins + 2) set buys (buys + 1) set cardplay true]
        if action = "LAB" [set actions (actions + 1) draw-cards 2 set cardplay true]
        if action = "MARKET" [set actions (actions + 1) draw-cards 1 set coins (coins + 1) set buys (buys + 1) set cardplay true]
        if cardplay = true [
            set playarea (lput action playarea) 
            set hand (remove-item (position action hand) hand) 
            set actions (actions - 1)]
        if print? = true [
            type "  You play a " type action print "."
            type "  Deck " type length(deck) print " Cards"
            type "  Hand " print hand
            actionformat
            buyformat
        ]
            set coppers filter [? = "COPPER"] hand
            set silvers filter [? = "SILVER"] hand
            set golds filter [? = "GOLD"] hand
            set moneytotal (length(coppers) + length(silvers) * 2 + length(golds) * 3)
            if print? = true [type "    $" print (moneytotal + coins)]
        set actionqueue-c (remove-item index actionqueue-c)
       ]
      ;;TERMINAL ACTION PLAYER
      let terminallist ["ADVENTURER" 6 "COUNCILROOM" 5 "WITCH" 5 "MONEYLENDER" 4 "SMITHY" 4]
      set actionqueue-t []
      set index 0
      set king 0
      while [index < length(hand) and actions > 0]
        [
       if (member? (item index hand) terminallist) = true
      [set actionqueue-t (lput (item index hand) actionqueue-t)
        let testking ((position (item index hand) terminallist) + 1)
        if item testking terminallist > king [set king (item testking terminallist)]]
      set index (index + 1)
      ]
      if king = 6 [set action "ADVENTURER"]
      if king = 5 [
        if (member? "COUNCILROOM" hand) = true  and (member? "WITCH" hand) = false [set action "COUNCILROOM"]
        if (member? "COUNCILROOM" hand) = false and (member? "WITCH" hand) = true [set action "WITCH"]
        if (member? "COUNCILROOM" hand) = true  and (member? "WITCH" hand) = true [let rand random (2) ifelse rand = 1 [set action "COUNCILROOM"][set action "WITCH"]]
      ]
      if king = 4 [
        if (member? "MONEYLENDER" hand) = true  and (member? "SMITHY" hand) = false [set action "MONEYLENDER"]
        if (member? "MONEYLENDER" hand) = false and (member? "SMITHY" hand) = true [set action "SMITHY"]
        if (member? "MONEYLENDER" hand) = true  and (member? "SMITHY" hand) = true [let rand random (2) ifelse rand = 1 [set action "SMITHY"][set action "MONEYLENDER"]]
      ]
      set cardplay false
      if action = "WOODCUTTER" [set coins (coins + 2) set buys (buys + 1) set cardplay true]
      if action = "COUNCILROOM" [draw-cards 3 set buys (buys + 1) set draw (draw + 1) set cardplay true]
      if action = "SMITHY" [draw-cards 3 set cardplay true]
      if action = "MONEYLENDER" [
        let copperposition position "COPPER" hand
        if (copperposition) != false 
        [set hand (remove-item copperposition hand) set coins (coins + 3)]
        set cardplay true
        ]
      if action = "ADVENTURER" [
          let loopindex 0
          while [loopindex < 2]
          [
            draw-cards 1
            ifelse member? (item (length(hand) - 1) hand) ["COPPER" "SILVER" "GOLD"]
            [set loopindex (loopindex + 1)]
            [set discard (lput (item (length(hand) - 1) hand) discard) set hand remove-item (length(hand) - 1) hand]
          ]
          set cardplay true
        ]
      
      if action = "WITCH" [
        draw-cards 2 set cardplay true
        ifelse item 29 supply = 0 
        [if print? = true [type "There are no curses remaining for " type playername2 print " to gain."]]
        [
          if print? = true [type playername2 type " gains a curse. There are " type ((item 29 supply) - 1) print " remaining." ]
          set supply replace-item 29 supply ((item 29 supply) - 1)
          set curse (curse + 1)
         ]
        ]
      if cardplay = true [
          if print? = true [type "  You play a " type action print "."]
          set playarea (lput action playarea) 
          set hand (remove-item (position action hand) hand) 
          set actions (actions - 1)
          if print? = true
          [
          type "  Deck " type length(deck) print " Cards"
          type "  Hand " print hand
          actionformat
          buyformat
          ]
          set coppers filter [? = "COPPER"] hand
          set silvers filter [? = "SILVER"] hand
          set golds filter [? = "GOLD"] hand
          set moneytotal (length(coppers) + length(silvers) * 2 + length(golds) * 3)
          if print? = true [type "    $" print (moneytotal + coins)]
      ]
      if (length(actionqueue-c) = 0) and (length(actionqueue-t) = 0) [set actions 0]
    ]
      ;;BUY PHASE
      while [buys > 0]
      [
        let coppers filter [? = "COPPER"] hand
        let silvers filter [? = "SILVER"] hand
        let golds filter [? = "GOLD"] hand
        let moneytotal (length(coppers) + length(silvers) * 2 + length(golds) * 3)
        let provincesleft (item 11 supply)
     ;;finding the correct base for the appropriate decision
        if moneytotal <= 1
        [set actionindex 0]
        if moneytotal >= 2 and moneytotal <= 9
        [set actionindex ((moneytotal - 1) * 12)]
        if moneytotal >= 10 and moneytotal <= 15
        [set actionindex (((floor (moneytotal / 2)) + 4) * 12)]
        if moneytotal > 15
        [set actionindex 132]
        set actionindex actionindex + ((4 - (ceiling (provincesleft / 2))) * 3)
        set actionindex actionindex + emptypiles
     ;;assigning to the appropriate buy
        let buyassign [
          "NOTHING" "COPPER" "ESTATE" "SILVER"
          "VILLAGE" "WOODCUTTER" "MONEYLENDER"
          "SMITHY" "COUNCILROOM" "DUCHY" "FESTIVAL"
          "LAB" "MARKET" "WITCH" "ADVENTURER"
          "GOLD" "PROVINCE"
          ]
        set action item (item actionindex genome1) buyassign
        if item ((position action supply) + 1) supply = 0
          [set emptypiles emptypiles + 1]
        ifelse ((moneytotal + coins) >= (item ((position action buylist) + 1) buylist)) and (item ((position action supply) + 1) supply) > 0
         [
         if action != "NOTHING" [
         set discard (lput action discard)]
         set supply replace-item ((position action supply) + 1) supply ((item ((position action supply) + 1) supply) - 1)
         if print? = true[
         type "  You buy a " type action print "."
         type "  There are " type (item ((position action supply) + 1) supply) print " remaining."]
         set buys buys - 1 set actions 0 set coins coins - (item ((position action buylist) + 1) buylist)
         ]
         [
         if print? = true [print "Invalid Buy"]
         set buys 0 set actions 0
         ]
       ]
      ;;CLEAN-UP PHASE
      set discard (sentence hand discard)
      set discard (sentence discard playarea)
      set playarea []
      set hand []
      ;;PREPARATION FOR NEXT TURN
      draw-cards 5
end

to-report occurrences [x the-list]
  report reduce
    [ifelse-value (?2 = x) [?1 + 1] [?1]] (fput 0 the-list)
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
649
470
16
16
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
1
1
1
ticks
30.0

SLIDER
0
87
172
120
mutation-rate
mutation-rate
0
100
61
1
1
NIL
HORIZONTAL

SLIDER
0
126
172
159
playernumber
playernumber
1
2
2
1
1
NIL
HORIZONTAL

BUTTON
42
13
170
46
Genetic Algorithm
geneticalgorithm
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
5
49
91
82
NIL
play-once\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
3
238
203
388
Fitness
Generations
Fitness
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "ask turtles [plot fitness3]"

BUTTON
95
51
158
84
NIL
Go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
3
162
175
195
numgen
numgen
0
100
70
1
1
NIL
HORIZONTAL

SWITCH
57
198
160
231
print?
print?
1
1
-1000

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
