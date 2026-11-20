% Directed edges between cities
road('Madinah', 'Makkah').
road('Makkah', 'Madinah').

road('Madinah', 'Taif').
road('Madinah', 'Tabuk').

road('Tabuk', 'Taif').
road('Taif', 'Tabuk').

road('Taif', 'Dammam').

road('Makkah', 'Riyadh').

road('Riyadh', 'Dammam').
road('Dammam', 'Riyadh').

road('Dammam', 'Al-Qatif').
road('Al-Qatif', 'Dammam').

road('Al-Qatif', 'Madinah').

% Find a path between two cities

travel(Start, End, Path) :-
    find_path(Start, End, [Start], ReversePath),
    reverse(ReversePath, Path).

% Base case: destination reached

find_path(End, End, Visited, Visited).

% Recursive case: find the next city

find_path(Current, End, Visited, Path) :-
    road(Current, Next),
    \+ member(Next, Visited),
    find_path(Next, End, [Next|Visited], Path).
