human(pam).
human(liz).
human(julie).
human(ann).

female(pam).
female(liz).
female(julie).
female(ann).

bodyshape(pam, niceass, badtits).
bodyshape(liz, badass, badtits).
bodyshape(ann, badass, nicetits).
bodyshape(julie, niceass, nicetits).


niceass(pam).
niceass(liz).

goodindoggy(Q) :-
  female(Q),
  bodyshape(Q, niceass, _).

