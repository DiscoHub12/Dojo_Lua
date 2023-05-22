# Dojo_Lua
Functional programming project 3 Year Camerino University.

##Dojo
In Japanese culture the Dojo is the space where students practice to reach
the balance between mind and body. Space is represented by a square chessboard with side N.
The positions on the board are occupied exclusively by:
- (S) Sempai
- (U) Vase symbolizing Humility
- (C) Wooden sword symbolizing Courage
- (G) Handkerchief symbolizing Kindness
- (R) Broom which symbolizes Respect
In an initial configuration, an arbitrary number of elements are arranged on the board
S,U,C,G,R. Each Sempai has associated 4 integer values relating to humility, courage,
kindness and respect at the beginning all equal to zero. The game consists of reaching the
final configuration where the sum of the values associated with the only Sempai present is maximum.
The game is punctuated by a gong that can make each Sempai move from one position to one
of the four directions (North, South, East, West). If a Sempai occupies the square occupied by a
item (U,C,G,R) increases its virtue by one and the item disappears. When two Sempai
are in bypass boxes, the Sempai that has the highest value in a quality increases it.
After comparing the Sempai with the total score, i.e. the sum of all values relating to the
Sempai, minor fuck. In case of equal scores, the following function applies:
f(n,m) = ( ( (n+m) * (n+m-1) ) / 2 ) + n - m
where n and m are the positions on the Sempai board.
The minor value associated with the Sempia disappears from the board. A configuration is said to be final
when there is only one Sempai on the board.

###Configuration 
The configuration is stored in a file that has the following structure
N = 10
D = {
  S={{2,4},{3,8},{4,1},{9,6}},
  U={{7,7},{1,1}},
  C={{5,1},{9,9}},
  G={{4,3},
  R={{8,7},{6,1},{4,5}}
}
N is the size of the board D, Each list contains the coordinates of the elements
present in the chessboard. The program can output the list of configurations up to
final configuration or just the final configuration.
