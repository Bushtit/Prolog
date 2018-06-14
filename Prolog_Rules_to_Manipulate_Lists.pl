% Write a rule that will take any list and return only the even numbers in the list

all_even( [] , [] ):- !.
all_even( [H|T] , [H|T1] ) :- 0 is H mod 2, !, all_even(T,T1).
all_even( [_H|T] , T1 ) :- all_even(T,T1).

% sample output:
% all_even([1,2,3,4,5,6,7,8,9,10],X).
% X = [2, 4, 6, 8, 10].


% -----------------------------------------------------------------------------------------------

% Write a rule that will take any list and swap any negative numbers with the word "negative":

swap_negative([],[]) :- !.
swap_negative( [H | T] , [H | X] ) :- H > 0, swap_negative(T,X).
swap_negative( [H | T] , [negative | X] ) :- H < 0, swap_negative(T,X).
swap_negative( [atom(H) | T] , [H | X] ) :- swap_negative(T,X).

% sample output:
% swap_negative([1, 2, 3, 4, -4, -3, -2, -1],X).
% X = [1, 2, 3, 4, negative, negative, negative, negative] ;


% ---------------------------------------------------------------------------------------------------

%Write a rule that will take in a list and output every number bigger than the one you entered:

bigger_than([],_,[]):-!.
bigger_than( [H | T], Y, [H | T1] ) :- H > Y, !, bigger_than(T,Y,T1).
bigger_than( [_H | T], Y, T1 ) :- bigger_than(T,Y,T1).
  
% sample output: 
% bigger_than([1,2,3,4],2,X).
% X  = [3, 4].


% -----------------------------------------------------------------------------------------------------

% Write a rule that will take in a list and remove each duplicate of a number already in the list:

remove_dups([],[]):-!.
remove_dups([H|T],List):- member(H,T) , ! , remove_dups(T,List).
remove_dups([H|T],[H|T1]):- remove_dups(T,T1).

% sample output:
% ?- remove_dups([1,2,3,4,3,1,4],X).
% X = [2, 3, 1, 4].


% -------------------------------------------------------------------------------------------------------

% Write a rule that will return the car of the cdr as in the programming language scheme:

cadr([_H1, H2,_T],H2):-!. 

% sample output:

% cadr([1,2,3],X).
% X = 2.

% cadr([1,3,5],X).
% X = 3.


% -------------------------------------------------------------------------------------------------------

% Write a rule that will return multiples of N in the list:
show_multiples([],_N,[]):-!.
show_multiples([H|T],N,[H|T1]):- 0 is H mod N, !, show_multiples(T,N,T1).
show_multiples([_H|T],N,Result):- show_multiples(T,N,Result).

% sample output:
% show_multiples([1,2,3,4,5,6,7,8,9,10,11,11,12],3,X).
% X = [3, 6, 9, 12].


% -------------------------------------------------------------------------------------------------------

fbscore(Touchdowns,FieldGoals,Safety,ExtraPoint,TotalScore):-
		member(Touchdowns,[0,1,2,3,4,5,6,7,8,9,10]),
		member(FieldGoals,[0,1,2,3,4,5,6,7,8,9,10]),
		member(Safety,[0,1,2,3,4,5,6,7,8,9,10]),
		member(ExtraPoint,[0,1,2,3,4,5,6,7,8,9,10]),
		ExtraPoint =< Touchdowns, !,
		TotalScore is 6*Touchdowns + 3*FieldGoals + 2*Safety + ExtraPoint.

% sample Output:		

% fbscore(1,2,0,1,SeaHawks).
% SeaHawks = 13.

% fbscore(3,1,0,3,Cardinals).
% Cardinals = 24.


% -------------------------------------------------------------------------------------------------------

% Write a rule that will take a list and reverse every pair of numbers in the list:
pair_reverse([],[]):-!.
pair_reverse([H],[H]):-!.
pair_reverse([H,H1|T], [H1,H|T1]):- pair_reverse(T,T1).

% sample output:
% pair_reverse([1,2,3,4],X).
% X = [2, 1, 4, 3].

% pair_reverse([1,2,3],X).
% X = [2, 1, 3].


% -------------------------------------------------------------------------------------------------------

% Write a rule that will return the number in the list at a certain index:
at_position(0,[H|_],H) :-!.
at_position(N,[_|T],H) :-
    N > 0, 
    N1 is N-1,
    at_position(N1,T,H).

% sample output:

% at_position(0,[2,4,6,8,10],X).
% X = 2.

% at_position(2,[2,4,6,8,10],X).
% X = 6.


% -------------------------------------------------------------------------------------------------------

% Write a rule that takes in two lists and returns the distance between the two as if they were points on an x,y plane:
distance([H|T], [H1|T1], [H2|T2]):- H2 is abs(H-H1), T2 is abs(T-T1).

% distance([4,8],[3,5],X).
% X = [1|3].

% ?- distance([9,9],[7,5],X).
% X = [2|4].


% -------------------------------------------------------------------------------------------------------

% Write a rule that will take in a list and return only those that are integers:

clean_list([],[]):- !.
clean_list([H|T],[H|T1]):- integer(H), !, clean_list(T,T1).
clean_list([_H|T],T1):- clean_list(T,T1).
	
% sample output:
	
% clean_list([1,2,3,"string",4,5,'atom',6,7,also_an_atom,8],X).
% X = [1, 2, 3, 4, 5, 6, 7, 8].


% -------------------------------------------------------------------------------------------------------
	
% Write a rule that takes in a list and returns each number in the list squared:
squares([],[]):- !.
squares( [H|T] , [H1|T1] ) :- number(H), !, H1 is H ** 2, squares(T,T1).
squares( [_H|T] , [_H1|T1] ) :- squares(T,T1).

% sample output:

% squares([1,2,3,4,5],X).
% X = [1, 4, 9, 16, 25].


% -------------------------------------------------------------------------------------------------------

% Write a rule that will take in a list, square all the numbers in the list, and return the sum of all those numbers:

sum_squares([],0):-!.
sum_squares([H],H1):- number(H), H1 is H**2.
sum_squares([H|T],X):-
		number(H),
		H1 is H ** 2,
		sum_squares(T,SumTail), !,
		X is H1 + SumTail.
sum_squares([_H|T],X):- sum_squares(T,X).

%sample output:
	
% sum_squares([1,2,3,4,5],X).
% X = 55


% -------------------------------------------------------------------------------------------------------
	
% Write a rule that will take in a list and return the sum of the numbers in the list:

sum_list([H],H):-!.
sum_list([H|T],X):- sum_list(T,SumTail), X is H + SumTail.		

% sample output:

% sum_list([2,4,6,8],X).
% X = 20

% sum_list([1,3,5,7],X).
% X = 16


% -------------------------------------------------------------------------------------------------------

% Write a rule that takes in a list full of sublists, sums the numbers inside the sublists, and returns one list:

get_values([],[]) :- !.
get_values([H|T], [H1|T1]) :- is_list(H), !, sum_list(H, H1),
get_values(T, T1).
get_values([H|T], [H|T1]) :- get_values(T, T1).

% sample output:

% get_values([[1,2],3,[4,5]], X).
% X = [3, 3, 9].

% get_values([[2,4,5],7,9,[3,8,22]],X).
% X = [11, 7, 9, 33].

% -------------------------------------------------------------------------------------------------------

% Write a rule that will take in two lists, and return a list of only the numbers that didn't match each other in each index:
nomatch([],[],[]):-!.
nomatch([_H],[],[]):-!.
nomatch( [H|T],[H1|T1],[H|T2] ) :- \==(H,H1), !, nomatch(T,T1,T2).
nomatch( [H|T],[H1|T1],[H|T2] ) :- H =\= H1, nomatch(T,T1,T2).
nomatch( [_H|T],[_H1|T1],T2) :- nomatch(T,T1,T2). 

% sample output:

% nomatch([1,2,3,4,5],[0,2,7,4,9],X).
% X = [1, 3, 5].

% nomatch([1,2,3,4,5,6,7,8],[1,1,3,3,5,5,7,7],X).
% X = [2, 4, 6, 8].


% -------------------------------------------------------------------------------------------------------

% Write a rule that will take in a list full of combined lists and return a list with all the combined lists removed:

flatten([],[]) :- !.

flatten([H|T], Flattened) :- !,
    flatten(H, H1),
    flatten(T, T1),
    append(H1, T1, Flattened).
flatten(H, [H]).

flatten([H],[H]):-!.

% sample output

% flatten([a,b,c,[d,e],f,[c, a, b]],X).
% X = [a, b, c, d, e, f, c, a, b].

% flatten([1,2,3,4,[5,6,[7,8]]], X).
% X = [1, 2, 3, 4, 5, 6, 7, 8].

