package com.qdum.llhb.companyScore;

import java.util.TimerTask;

public class CompanyScoreTimerTask extends TimerTask{

	@Override
	public void run() {
		CountScore cs = new CountScore();
		cs.run();
	}

}
