# % facts about the domain

 #     squares([cell(a, _), cell(b, _), cell(c, _), cell(d, _),  
 #              cell(e, _), cell(f, _), cell(g, _), cell(h, _),
 #              cell(i, _)]).

 #     numbers([1,2,3,4,5,6,7,8,9]).

 #     sum_of_row(15).

 #     generate_square :-
 #          % retrieve facts about the domain
 #          squares(Square),
 #          numbers(Numbers),
 #          % generate square
 #          fill_square(Numbers, Square),
 #          % test square
 #          test_square(Square),
 #          % output square
 #          display_square(Square).


 #     % 1 boundary condition
 #     fill_square([], _).
 #     % 2 recursive condition
 #     fill_square([Number|Tail], Cells) :-
 #          member(cell(_, Number), Cells),
 #          fill_square(Tail, Cells).


 #     test_square([cell(a, Cell_a), cell(b, Cell_b), cell(c, Cell_c), 
 #                  cell(d, Cell_d), cell(e, Cell_e), cell(f, Cell_f),
 #                  cell(g, Cell_g), cell(h, Cell_h), cell(i, Cell_i)]) :-
 #          sum_of_row(Sum),
 #          % test rows
 #          Sum is Cell_a + (Cell_b + Cell_c),
 #          Sum is Cell_d + (Cell_e + Cell_f),
 #          Sum is Cell_g + (Cell_h + Cell_i),
 #          % test columns
 #          Sum is Cell_a + (Cell_d + Cell_g),
 #          Sum is Cell_b + (Cell_e + Cell_h),
 #          Sum is Cell_c + (Cell_f + Cell_i),
 #          % test diagonals
 #          Sum is Cell_a + (Cell_e + Cell_i),
 #          Sum is Cell_c + (Cell_e + Cell_g).


 #     display_square([cell(a, Cell_a), cell(b, Cell_b), cell(c, Cell_c), 
 #                     cell(d, Cell_d), cell(e, Cell_e), cell(f, Cell_f),
 #                     cell(g, Cell_g), cell(h, Cell_h), cell(i, Cell_i)]) :-
 #          tab(10),
 #          writeln('-------------'),
 #          tab(10),
 #          write('| '),
 #          write(Cell_a),
 #          write(' | '),
 #          write(Cell_b),
 #          write(' | '),
 #          write(Cell_c),
 #          writeln(' |'),
 #          tab(10),
 #          writeln('-------------'),
 #          tab(10),
 #          write('| '),
 #          write(Cell_d),
 #          write(' | '),
 #          write(Cell_e),
 #          write(' | '),
 #          write(Cell_f),
 #          writeln(' |'),
 #          tab(10),
 #          writeln('-------------'),
 #          tab(10),
 #          write('| '),
 #          write(Cell_g),
 #          write(' | '),
 #          write(Cell_h),
 #          write(' | '),
 #          write(Cell_i),
 #          writeln(' |'),
 #          tab(10),
 #          writeln('-------------').


 #     % utilities

 #     % member/2 
 #     % 1 boundary condition
 #     member(Elem, [Elem|_]).
 #     % 2
 #     member(Elem, [_|Tail]) :-
 #          member(Elem, Tail).

 #     % writeln/1
 #     writeln(Arg) :-
 #          write(Arg), 
 #          nl.







sum_list([], 0).             % base case
sum_list([X|Xs], Total) :-   % recursive case
    sum_list(Xs, T),
    Total is X + T.     % always use "is" for arithmetic




 
 magic_square(Puzzle, Solution) :-
  Puzzle = [S11, S12, S13,
            S21, S22, S23,
            S31, S32, S33],

  
  /* Rows */
  R1 = [S11, S12, S13],
  R2 = [S21, S22, S23],
  R3 = [S31, S32, S33],
  
  /* Columns */  
  C1 = [S11, S21, S31],
  C2 = [S12, S22, S32],
  C3 = [S13, S23, S33],
  

  sum_list(R1, Sum1),
  sum_list(R2, Sum2),
  sum_list(R3, Sum3),
  sum_list(C1, Sum4),
  sum_list(C2, Sum5),
  sum_list(C3, Sum6),
 
  Sum1 = Sum2,
  Sum2 = Sum3,
  Sum3 = Sum4,
  Sum4 = Sum5,
  Sum5 = Sum6,
  

  Solution = Puzzle.











min_list([X], X).               % base case
min_list([Head|Tail], Min) :-   % recursive case
    min_list(Tail, Tmin),
    min(Head, Tmin, Min),
    !.

 mylen([], 0).            % base case
mylen([_|Xs], Len) :-    % recursive case
    mylen(Xs, Rest_len),
    Len is 1 + Rest_len.




min_list([X], X).               % base case
min_list([Head|Tail], Min) :-   % recursive case
    min_list(Tail, Tmin),
    min(Head, Tmin, Min),
    !.

secondSmallest(List, S2) :- 
   S is min_list(List, S), 
   delete(List, S, NewList), 
   min_list(NewList, S2).


magic_square(L9, Result) :-

L9 = [S11, S12, S13,
      S21, S22, S23,
      S31, S32, S33],

   magic_square(Puzzle, Solution, Sum) :-
  Puzzle = [S11, S12, S13,
            S21, S22, S23,
            S31, S32, S33],

  fd_all_different(Puzzle),
  fd_domain(Puzzle, 1, 9),
  fd_labeling(Puzzle),   /* This line is very important to actually seeing the answers*/
  
  /* Rows */
  R1 = [S11, S12, S13],
  R2 = [S21, S22, S23],
  R3 = [S31, S32, S33],
  
  /* Columns */  
  C1 = [S11, S21, S31],
  C2 = [S12, S22, S32],
  C3 = [S13, S23, S33],
  
  /* Diagonals */  
  Diag1 = [S11, S22, S33],
  Diag2 = [S13, S22, S31],

  sum_list(R1, Sum1),
  sum_list(R2, Sum2),
  sum_list(R3, Sum3),
  sum_list(C1, Sum4),
  sum_list(C2, Sum5),
  sum_list(C3, Sum6),
  sum_list(Diag1, Sum7),
  sum_list(Diag2, Sum8),
  
  Sum1 = Sum2,
  Sum2 = Sum3,
  Sum3 = Sum4,
  Sum4 = Sum5,
  Sum5 = Sum6,
  Sum6 = Sum7,
  Sum7 = Sum8,

  Sum = Sum8,
  Solution = Puzzle.






Go - have objects ...no classes... has arrays and slices
array of n is not a type ...slices use as pointers
parallel processing
Servers...compiler type tools... escape analyis
interfaces


Scheme - functional programming without knowing type..
function composition
curing and uncuring
closure
car cdr

haskell
map
read and wriye things 





sum_list([], 0).             
sum_list([X|Xs], Total) :-   
    sum_list(Xs, T),
    Total is X + T.  




