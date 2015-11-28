Rules: [to be added]

A single player input is called a "bet".
A "deal" contains several bets. A new deal implies new cards for each player.
A "game" contains several deals.

X is a vector containing the full deck of cards, 2 (Two) through 14 (Ace), times 4.

Bets are handled like that: 
TYPE (length 1) means the type of bet made by a player
'1' means High Card, '2' is a Pair, '3' is Two Pairs, '4' - Three-of-a-kind '5' - Straight, '6' - Full, '7' - Four-of-a-kind
VALUE (length 1-2) is the card that is bet. 
TYPE = 2, VALUE = 2 means a pair of dues
TYPE = 6, VALUE = 11, 3 means a full with three Jacks and two sixes.  

******************************

Functions:
numplayers: requests that the user specifies the number of players in the game

check: checks if the last bet (TYPE and VALUE) was true or not.

ishigher: checks if the this bet is actually higher than the last one (which means either of a greater TYPE or of the same TYPE but greater VALUE

gettype: requests the TYPE of the bet

getvalue: requests the VALUE of the bet. Different types will request either one or two values.

getbet: requests the TYPE and VALUE of the bet, by calling appropriate functions. Additionally, checks if the bet is correct ('ishigher')

intelligence (to be created) - as for now works the same way as 'getbet'

****************************
The first player is player 1.

'history' is created as a list. Here historical bets within the same deal will be recorded for the intelligence to process.

'pcards' is a vector with numeric values. It records how many cards does each player have. At the beginning, every player has the same amount of cards: 1. Thus, the line introduces 'pcards' as a vector made by replicating '1' for 
'numplayer()' times. Numplayer, as said before, returns the number of players and is called only once in a game.

BEFORE A DEAL:
'betnumber' is equal to one during the first bet in the deal. The number of a bet is essential to recording the history of bets in a single deal.

'last' is the last bet (the one to be possibly checked). For now it is lower than the lowest possible, so it doesn't interfere with the next bet by terurning false 'ishigher'

The next line requests the first player to make a bet

'numcard' is the sum of all player cards.

The next line draws cards (without replacement)

REPETITIVE PART OF THE DEAL:

The bet is recorded into the history

The next bet will naturally have a higher 'betnumber'.

Currentplayer is switched to the next player. 
If all the players have bet, the first player is next.

Scan if the player wants to check ('1') or not ('2')

IF YES: then show every player's cards

If check is equal to 1, currentplayer gets a card.
If check is equal to 0 (the bet was wrong), the function gets the previous player a cards.
(a slightly different code if the currentplayer is 1 and the previous player is not 0 but length(pcards), which means the numebr of players)

The player that got a card will be beginning a new deal.

The loop breaks, allowing for a new deal

IF NO: request a bet from the current player. If this is not the first player, use INTELLIGENCE.



If someone has 4 cards, he/she loses.