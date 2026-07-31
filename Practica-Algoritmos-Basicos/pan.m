#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC ProcessTwo */
	case 3: // STATE 2 - personal_fixing_ME.pml:30 - [wantTwo = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)now.wantTwo);
		now.wantTwo = 1;
#ifdef VAR_RANGES
		logval("wantTwo", ((int)now.wantTwo));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 3 - personal_fixing_ME.pml:31 - [turn = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 2;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - personal_fixing_ME.pml:34 - [((!(wantOne)||(turn==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(( !(((int)now.wantOne))||(((int)now.turn)==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 7 - personal_fixing_ME.pml:37 - [inCriticalSectionTwo = 1] (0:0:1 - 2)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.inCriticalSectionTwo);
		now.inCriticalSectionTwo = 1;
#ifdef VAR_RANGES
		logval("inCriticalSectionTwo", ((int)now.inCriticalSectionTwo));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 8 - personal_fixing_ME.pml:38 - [assert(!((inCriticalSectionOne&&inCriticalSectionTwo)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		spin_assert( !((((int)now.inCriticalSectionOne)&&((int)now.inCriticalSectionTwo))), " !((inCriticalSectionOne&&inCriticalSectionTwo))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 9 - personal_fixing_ME.pml:39 - [printf('Proceso en la seccion critica \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		Printf("Proceso en la seccion critica \n");
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 10 - personal_fixing_ME.pml:41 - [inCriticalSectionTwo = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = ((int)now.inCriticalSectionTwo);
		now.inCriticalSectionTwo = 0;
#ifdef VAR_RANGES
		logval("inCriticalSectionTwo", ((int)now.inCriticalSectionTwo));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 11 - personal_fixing_ME.pml:42 - [wantTwo = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = ((int)now.wantTwo);
		now.wantTwo = 0;
#ifdef VAR_RANGES
		logval("wantTwo", ((int)now.wantTwo));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 15 - personal_fixing_ME.pml:44 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC ProcessOne */
	case 12: // STATE 2 - personal_fixing_ME.pml:11 - [wantOne = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.wantOne);
		now.wantOne = 1;
#ifdef VAR_RANGES
		logval("wantOne", ((int)now.wantOne));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 3 - personal_fixing_ME.pml:12 - [turn = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 1;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 4 - personal_fixing_ME.pml:15 - [((!(wantTwo)||(turn==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!(( !(((int)now.wantTwo))||(((int)now.turn)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 7 - personal_fixing_ME.pml:18 - [inCriticalSectionOne = 1] (0:0:1 - 2)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.inCriticalSectionOne);
		now.inCriticalSectionOne = 1;
#ifdef VAR_RANGES
		logval("inCriticalSectionOne", ((int)now.inCriticalSectionOne));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 8 - personal_fixing_ME.pml:19 - [assert(!((inCriticalSectionOne&&inCriticalSectionTwo)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		spin_assert( !((((int)now.inCriticalSectionOne)&&((int)now.inCriticalSectionTwo))), " !((inCriticalSectionOne&&inCriticalSectionTwo))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 9 - personal_fixing_ME.pml:20 - [printf('Proceso en la seccion critica \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		Printf("Proceso en la seccion critica \n");
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 10 - personal_fixing_ME.pml:22 - [inCriticalSectionOne = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)now.inCriticalSectionOne);
		now.inCriticalSectionOne = 0;
#ifdef VAR_RANGES
		logval("inCriticalSectionOne", ((int)now.inCriticalSectionOne));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 11 - personal_fixing_ME.pml:23 - [wantOne = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)now.wantOne);
		now.wantOne = 0;
#ifdef VAR_RANGES
		logval("wantOne", ((int)now.wantOne));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 15 - personal_fixing_ME.pml:25 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

