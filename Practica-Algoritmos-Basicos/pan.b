	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC ProcessTwo */

	case 3: // STATE 2
		;
		now.wantTwo = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 3
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 6: // STATE 7
		;
		now.inCriticalSectionTwo = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 9: // STATE 10
		;
		now.inCriticalSectionTwo = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 11
		;
		now.wantTwo = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 15
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC ProcessOne */

	case 12: // STATE 2
		;
		now.wantOne = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 3
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 7
		;
		now.inCriticalSectionOne = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 18: // STATE 10
		;
		now.inCriticalSectionOne = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 11
		;
		now.wantOne = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 15
		;
		p_restor(II);
		;
		;
		goto R999;
	}

