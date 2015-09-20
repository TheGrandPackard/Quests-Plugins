# #a_vacuous_cursebearer NPCID 296063
my $new_speed;

sub EVENT_SPAWN {
	my $rClient = $entity_list->GetRandomClient($x,$y,$z, 1500);
  $new_speed = 0.3;
	if ($rClient) {
		$rClient->Message(15,"The thoughts of a cursed trusik invade your mind, 'You will share my fate. Do not attempt to resist. I am coming for you.'");
		$npc->AddToHateList($rClient, 100000);
		quest::settimer(1,10); #gradually speed up
	}
}

sub EVENT_TIMER {
  #$new_speed = $npc->GetRunspeed();
	$new_speed = ($new_speed * 1.1);
	quest::modifynpcstat("runspeed", $new_speed);
	if (!$npc->GetTarget()) {
		quest::depop();
	}
}

sub EVENT_SLAY {
  quest::depop();
}

sub EVENT_NPC_SLAY {
	quest::depop();
}
