# Margolus

## About

This repo contains the source code of the [Haskell](https://haskell.org) powered [Cellular Automata](https://en.wikipedia.org/wiki/Cellular_automaton) engine with the ruleset
inspired by "[Margolus](https://en.wikipedia.org/wiki/Norman_Margolus) neighborhood" automata [rules](http://www.mirekw.com/ca/rullex_marg.html).

Example "screenshot" of the "sand" simulation:

```
   $                                     
   .      $                  $$      $$  
                             .        .  
   .      ..              # ...      ... 
         ...               #..        ..#
   .    ......              #..      ..# 
       #.....#               #        #  
   .    ##### ..              #.    .#   
             ...               #    #    
   .        ...#.               .  .     
           #...#                         
   .        ### .               .  .     
                                         
   .            .               .  .     
                                         
   .            .               .  .     
                                .  .     
  ..            .             ........   
 ....                         ........   
......          .           ............ 
 ......         .           ............ 
........       ...          ............ 
 ........      ....        ..............
```

## Build

```shell
$ cabal sandbox init
$ cabal install --dependencies-only
$ cabal build
```

## Run

```shell
$ dist/build/Margolus/Margolus
```

