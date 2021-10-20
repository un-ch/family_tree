
man(the_force).
man(ruwee_naberrie).
man(anakin_skywalker).
man(luke_skywalker).
man(han_solo).
man(ben_solo).

woman(jabal_naberrie).
woman(padme_amidala).
woman(shmi_skywalker).
woman(leia_organa).
woman(rey_skywalker).

child(anakin_skywalker, the_force).
child(anakin_skywalker, shmi_skywalker).
child(padme_amidala, ruwee_naberrie).
child(padme_amidala, jabal_naberrie).
child(luke_skywalker, anakin_skywalker).
child(luke_skywalker, padme_amidala).
child(leia_organa, anakin_skywalker).
child(leia_organa, padme_amidala).
child(ben_solo, han_solo).
child(ben_solo, leia_organa).
child(rey_skywalker, luke_skywalker).

/*************************************/

parent(Parent, Child) :-
	child(Child, Parent).

grandparent(Grandparent, Grandchild) :-
      child(Parent, Grandparent),
      child(Grandchild, Parent).

grandchild(Grandchild, Grandparent) :-
      grandparent(Grandparent, Grandchild).

/* FIXME: returns correct answer, but then "false" appeares: */
father(Dad, Child) :-
      man(Dad),
      child(Child, Dad).

mother(Mom, Child) :- 
      woman(Mom),
      child(Child, Mom).

parents(Father, Mom, Child) :-
	father(Father, Child),
	mother(Mom, Child).
	
grandfather(Grandpa, Grandchild) :-
      man(Grandpa),
      grandparent(Grandpa, Grandchild).

grandmother(Grandma, Grandchild) :-
      woman(Grandma),
      grandparent(Grandma, Grandchild).

granddaugther(Granddaugther, Grandparent) :-
	woman(Granddaugther),
	grandparent(Grandparent, Granddaugther).

grandson(Grandson, Grandparent) :-
	man(Grandson),
	grandparent(Grandparent, Grandson).

sibling(Person_1, Person_2) :-
	parents(Father, Mom, Person_1),
	parents(Father, Mom, Person_2),
	Person_1 \= Person_2.

brother(Brother, Person) :-
	man(Brother),
	sibling(Brother, Person).

sister(Sister, Person) :-
	woman(Sister),
	sibling(Sister, Person).

/* FIXME: the answer printed twice: */
uncle(Uncle, Person) :-
	man(Uncle),
	grandparent(Grandparent, Person),
	grandchild(Grandchild, Grandparent),
	Grandchild \= Person,
	parent(Uncle, Grandchild).
	
/* FIXME: the answer printed twice: */
aunt(Aunt, Person) :-
	woman(Aunt),
	grandparent(Grandparent, Person),
	grandchild(Grandchild, Grandparent),
	Grandchild \= Person,
	parent(Aunt, Grandchild).

descendent(Descendent, Person_1) :-
	parent(Person_1, Descendent).
descendent(Descendent, Person_1) :-
	parent(Parent, Descendent),
	descendent(Parent, Person_1).

ansestor(Ansestor, Descendent) :-
	descendent(Descendent, Ansestor).
