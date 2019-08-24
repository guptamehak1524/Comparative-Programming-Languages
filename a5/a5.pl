/* ASSIGNMENT 5 */
/* MEHAK GUPTA */
/* 301311972 */
/* mga76@sfu.ca */
/* References */
/* function min and min_list taken from prolog class notes */
/* mymember function taken from class notes */
/* summing_list function taken from class notes */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

makelist(0 ,_, []) :- !.           /* Base case */
makelist(N ,X, [X|Lst]) :-         /* recursive case */
     New is N - 1, 
     makelist(New, X, Lst).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

min(X, Y, X) :- X =< Y, !.   
min(X, Y, Y) :- X > Y.       

min_list([X], X).               
min_list([Head|Tail], Min) :-   
    min_list(Tail, Tmin),
    min(Head, Tmin, Min),
    !.

second_min([_]) :- !.              /* Base case */
second_min(Lst, M) :-              /* recursive case - deleted the min of the list and then find the min again */ 
    min_list(Lst, M1), 
    delete(Lst, M1, List1), 
    min_list(List1, M).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mynumlist(Hi, Hi, Result) :- !,   /* Base case */
    Result = [Hi].
mynumlist(Lo, Hi, [Lo|Rest]) :-    /* recursive case - take the low number , add 1 and make it the new low until it is equal to high */
    Lo2 is Lo+1,
    mynumlist(Lo2, Hi, Rest).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mymember(X, [X|_]).                       /* Base case */
mymember(X, [_|Rest]) :- mymember(X, Rest). /* recursive case */

all_diff([]).                           /* Base case */
all_diff([X|Lst]) :-                    /* recursive case - using mymember function to check if there is any duplicate in the list*/   
     \+mymember(X,Lst),
     all_diff(Lst).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

negpos([], [], []).                     /* Base case */
negpos([L|Ls], [L|Neg], NonNeg) :-       /* recursive case - if the first element is less than 0 put it in the list Negative numbers else list of positive numbers */
  L < 0,
  negpos(Ls, Neg, NonNeg).
negpos([L|Ls], Neg, [L|NonNeg]) :-  
  L >= 0,
  negpos(Ls, Neg, NonNeg).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

summing_list([], 0).             /* Base case */
summing_list([X|Xs], Total) :-   /* recursive case */
    summing_list(Xs, T),
    Total is X + T.     
  


magic(L9, Result) :-
L9 = [S11, S12, S13,
      S21, S22, S23,
      S31, S32, S33],

Result = [A, B, C, D, E, F, G, H, I],

/* permutation */
 permutation([S11, S12, S13, S21, S22, S23, S31, S32, S33], [A, B, C, D, E, F, G, H, I]),
 /* Rows */
  R1 = [A, B, C],
  R2 = [D, E, F],
  R3 = [G, H, I],
  
  /* Columns */  
  C1 = [A, D, G],
  C2 = [B, E, H],
  C3 = [C, F, I],

 /* taking sum of the rows and columns */
  summing_list(R1, Sum1),
  summing_list(R2, Sum2),
  summing_list(R3, Sum3),
  summing_list(C1, Sum4),
  summing_list(C2, Sum5),
  summing_list(C3, Sum6),
  
 /* equating all the sum values */
  Sum1 = Sum2,
  Sum2 = Sum3,
  Sum3 = Sum4,
  Sum4 = Sum5,
  Sum5 = Sum6,
  
  Result = [A, B, C, D, E, F, G, H, I].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
is_sorted([]).
is_sorted([_]).
is_sorted([X, Y|Tail]) :-
    X =< Y,
    is_sorted([Y|Tail]).



quick_sort([],[]).
quick_sort([H|T],Sorted):-
pivoting(H,T,L1,L2),quick_sort(L1,Sorted1),quick_sort(L2,Sorted2),
append(Sorted1,[H|Sorted2]).

pivoting(H,[],[],[]).
pivoting(H,[X|T],[X|L],G):-X=<H,pivoting(H,T,L,G).
pivoting(H,[X|T],L,[X|G]):-X>H,pivoting(H,T,L,G).








  

