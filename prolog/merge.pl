split_list([], [], []).
split_list([Head|[]], [Head], []).
split_list([Head1|[Head2|Tail]], X, Y) :- split_list(Tail, A, B), append([Head1], A, X), append([Head2], B, Y).

merge([], [], []).
merge(A, [], A).
merge([], B, B).
merge([HeadA|TailA], [HeadB|TailB], [HeadA|X]) :- HeadA =< HeadB, merge(TailA, [HeadB|TailB], X).
merge([HeadA|TailA], [HeadB|TailB], [HeadB|X]) :- HeadA > HeadB, merge([HeadA|TailA], TailB, X).

mergesort([], []).
mergesort([A|[]], [A]).
mergesort([Head|Tail], S) :- split_list([Head|Tail], Left, Right), mergesort(Left, LeftSort), mergesort(Right, RightSort), merge(LeftSort, RightSort, S).
