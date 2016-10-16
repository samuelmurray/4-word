% A 4-word program in Prolog. Samuel Murray.

% Utility predicates.

sum_list(L, R) :- sum_list(L, 0, R).
sum_list([], F, F).
sum_list([H|T], F, R) :- 
		F2 is F+H,
		sum_list(T, F2, R).

letter(A) :- A = a.
letter(A) :- A = b.
letter(A) :- A = c.
letter(A) :- A = d.
letter(A) :- A = e.
letter(A) :- A = f.
letter(A) :- A = g.
letter(A) :- A = h.
letter(A) :- A = i.
letter(A) :- A = j.
letter(A) :- A = k.
letter(A) :- A = l.
letter(A) :- A = m.
letter(A) :- A = n.
letter(A) :- A = o.
letter(A) :- A = p.
letter(A) :- A = q.
letter(A) :- A = r.
letter(A) :- A = s.
letter(A) :- A = t.
letter(A) :- A = u.
letter(A) :- A = v.
letter(A) :- A = x.
letter(A) :- A = y.
letter(A) :- A = z.