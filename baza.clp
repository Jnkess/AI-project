(defrule start
   =>
   (assert (decyzja "Who are you going out for drinks with?.4.your-boss-yes.a-group-yes.a-colleague-yes.a-client-yes.Your boss.A group.A colleague.A client"))
   )

(defrule your-boss
    (your-boss-yes)
   =>
   (assert (decyzja "Did he/she ask you to drinks?.2.did-ask-yes.did-ask-no.Yes.No"))
)
(defrule did-ask
    (did-ask-yes)
   =>
   (assert (decyzja "Are you celebrating something?.2.celebrating-yes.celebrating-no.Yes.No"))
)
(defrule celebrating
    (celebrating-yes)
   =>
   (assert (koniec Bubbly))
   (printout t "Bubbly" crlf)
)
(defrule not-celebrating
    (celebrating-no)
   =>
    (assert (decyzja "Are you worried you're in trouble?.2.worried-yes.worried-no.Yes.No"))
)
(defrule worried
    (worried-yes)
   =>
    (assert (decyzja "Will you talk back?.2.talk-back-yes.talk-back-no.Yes.No"))
)
(defrule won't-talk-back
    (talk-back-no)
   =>
   (assert (koniec Wine))
   (printout t "Wine" crlf)
)
(defrule will-talk-back
    (talk-back-yes)
   =>
   (assert (koniec Non-alcoholic))
   (printout t "Non-alcoholic" crlf)
)
(defrule not-worried
    (worried-no)
   =>
    (assert (decyzja "Is he or she trying to sleep with you?.2.trying-to-sleep-yes.trying-to-sleep-no.Yes.No"))
)
(defrule trying-to-sleep
    (trying-to-sleep-yes)
   =>
   (assert (koniec Non-alcoholic))
   (printout t "Non-alcoholic" crlf)
)
(defrule not-trying-to-sleep
    (trying-to-sleep-no)
   =>
   (assert (koniec Wine))
   (printout t "Wine" crlf)
)
(defrule didnt-ask
    (did-ask-no)
   =>
   (assert (decyzja "Are you asking for a raise?.2.asking-for-raise-yes.asking-for-raise-no.Yes.No"))
)
(defrule asking-for-raise
    (asking-for-raise-yes)
   =>
   (assert (koniec Stop-do-this-in-the-office))
   (printout t "STOP Do this in the office" crlf)
)
(defrule not-asking-for-raise
    (asking-for-raise-no)
   =>
   (assert (decyzja "Just a promotion?.2.asking-for-promotion-yes.asking-for-promotion-no.Yes.No"))
)
(defrule asking-for-promotion
    (asking-for-promotion-yes)
   =>
   (assert (koniec Stop-do-this-in-the-office))
   (printout t "STOP Do this in the office" crlf)
)
(defrule not-asking-for-promotion
    (asking-for-promotion-no)
   =>
   (assert (decyzja "Are you trying to secude your boss?.2.trying-to-seduce-yes.trying-to-seduce-no.Yes.No"))
)
(defrule not-trying-to-secude
    (trying-to-seduce-no)
   =>
    (assert (decyzja "Is he or she trying to sleep with you?.2.trying-to-sleep-yes.trying-to-sleep-no.Yes.No"))
)
(defrule trying-to-secude
    (trying-to-seduce-yes)
   =>
    (assert (decyzja "Are you sure this is a good idea?.2.good-idea-yes.good-idea-no.Yes.No"))
)
(defrule good-idea
    (good-idea-yes)
   =>
   (assert (koniec Fancy-cocktail))
   (printout t "Fancy cocktail" crlf)
)
(defrule not-good-idea
    (good-idea-no)
   =>
   (assert (koniec Martini))
   (printout t "Martini" crlf)
)
(defrule A-group
    (a-group-yes)
   =>
   (assert (decyzja "Is it an official function?.2.official-function-yes.official-function-no.Yes.No"))
)
(defrule not-official-function
    (official-function-no)
   =>
   (assert (decyzja "Do you like these people?.2.like-people-yes.like-people-no.Yes.Eh"))
)
(defrule doesnt-like-people
    (like-people-no)
   =>
   (assert (koniec Fancy-cocktail))
   (printout t "Fancy cocktail" crlf)
)
(defrule does-like-people
    (like-people-yes)
   =>
   (assert (decyzja "Can you write this off?.2.can-write-off-yes.can-write-off-no.Yes.No"))
)
(defrule does-like-people
    (can-write-off-yes)
   =>
      (assert (koniec Lowball))
   (printout t "Lowball" crlf)
)
(defrule does-like-people
    (can-write-off-no)
   =>
      (assert (koniec Beer))
   (printout t "Beer" crlf)
)
(defrule official-function
    (official-function-yes)
   =>
   (assert (decyzja "It's a?.3.performance-reward.holiday-party.going-away-party.performance reward.holiday party.going-away party"))
)
(defrule it-is-performance-reward
    (performance-reward)
   =>
   (assert (decyzja "Is this a major celebration?.2.major-celebration-yes.major-celebration-no.Yes.No"))
)
(defrule not-major-celebration
    (major-celebration-no)
   =>
   (assert (koniec Highball))
   (printout t "Highball" crlf)
)
(defrule major-celebration
    (major-celebration-yes)
   =>
   (assert (decyzja "Can you comfortably get wasted?.2.can-get-wasted.cant-get-wasted.Yes.No"))
)
(defrule not-getting-wasted
    (cant-get-wasted)
   =>
   (assert (koniec Wine))
   (printout t "Wine" crlf)
)
(defrule getting-wasted
    (can-get-wasted)
   =>
   (assert (decyzja "Is it a friday night?.2.friday-night-yes.friday-night-no.Yes.No"))
)
(defrule friday-night
    (friday-night-yes)
   =>
      (assert (koniec Martini))
   (printout t "Martini" crlf)
)
(defrule not-friday-night
    (friday-night-no)
   =>
   (assert (decyzja "Are you planning on working here for a long time?.2.working-for-long-time-yes.working-for-long-time-no.Yes.No"))
)
(defrule working-for-long-time
    (working-for-long-time-yes)
   =>
   (assert (koniec Bubbly))
   (printout t "Bubbly" crlf)
)
(defrule not-working-for-long-time
    (working-for-long-time-no)
   =>
   (assert (koniec Martini))
   (printout t "Martini" crlf)
)
(defrule it-is-holiday-party
    (holiday-party)
   =>
   (assert (decyzja "Can you comfortably get wasted?.2.can-get-wasted.cant-get-wasted.Yes.No"))
)
(defrule it-is-going-away-party
    (going-away-party)
   =>
   (assert (decyzja "Do you like this person?.2.do-you-like-this-person-yes.do-you-like-this-person-no.Yes.No"))
)
(defrule liking-this-person
    (do-you-like-this-person-yes)
   =>
   (assert (koniec Bubbly))
   (printout t "Bubbly" crlf)
)
(defrule not-liking-this-person-or-not-trying-to-close-a-deal
    (or
    (do-you-like-this-person-no)
    (close-a-deal-no)
    )
   =>
   (assert (decyzja "Are you schmoozing to stay on this person's radar.2.stay-on-persons-radar-yes.stay-on-persons-radar-no.Yes.No"))
)
(defrule not-staying-on-persons-radar
    (stay-on-persons-radar-no)
   =>
   (assert (decyzja "Do you have a life?.2.do-you-have-live-yes.do-you-have-live-no.Yes.No"))
)
(defrule do-you-have-a-life-no
    (do-you-have-live-no)
   =>
   (assert (koniec Stop-get-a-life))
   (printout t "STOP Get a life" crlf)
)
(defrule do-you-have-a-life-yes
    (do-you-have-live-yes)
   =>
   (assert (koniec Stop-get-a-life))
   (printout t "You aren't being honest. Try again." crlf)
   (printout t "STOP Get a life" crlf)
)
(defrule staying-on-persons-radar
    (stay-on-persons-radar-yes)
   =>
   (assert (decyzja "Is he or she a big drinker?.2.big-drinker-yes.big-drinker-no.Yes.No"))
)
(defrule not-a-big-drinker
    (big-drinker-no)
   =>
   (assert (decyzja "Are they Mormon?.2.mormon-yes.mormon-no.Yes.No"))
)
(defrule mormon
    (mormon-yes)
   =>
   (assert (koniec Non-alkoholic))
   (printout t "Non-alkoholic" crlf)
)
(defrule not-mormon
    (mormon-no)
   =>
   (assert (koniec Wine))
   (printout t "Wine" crlf)
)
(defrule a-big-drinker
    (big-drinker-yes)
   =>
   (assert (decyzja "Do you feel obligated to keep up with this person?.2.obligated-to-keep-up-yes.obligated-to-keep-up-no.Yes.No"))
)
(defrule obligated-to-keep-up
    (obligated-to-keep-up-yes)
   =>
   (assert (koniec Highball))
   (printout t "Highball" crlf)
)
(defrule not-obligated-to-keep-up
    (obligated-to-keep-up-no)
   =>
   (assert (koniec Fancy-coctail))
   (printout t "Fancy coctail" crlf)
)
(defrule a-client
    (a-client-yes)
   =>
   (assert (decyzja "Are you trying to close a deal?.2.close-a-deal-yes.close-a-deal-no.Yes.No"))
)
(defrule trying-to-close-a-deal
    (close-a-deal-yes)
   =>
   (assert (decyzja "Is your expense account big?.2.expense-account-big-yes.expense-account-big-no.Yes.No"))
)
(defrule expense-account-big
    (expense-account-big-yes)
   =>
   (assert (decyzja "Do you have to take them to dinner after?.2.dinner-after-yes.dinner-after-no.Yes.No"))
)
(defrule dinner-after
    (dinner-after-yes)
   =>
   (assert (koniec Martini))
   (printout t "Martini" crlf)
)
(defrule no-dinner-after
    (dinner-after-no)
   =>
   (assert (koniec Wine))
   (printout t "Wine" crlf)
)
(defrule not-expense-account-big
    (expense-account-big-no)
   =>
   (assert (koniec Fancy-coctail))
   (printout t "Fancy coctail" crlf)
)
(defrule a-colleague
    (a-colleague-yes)
   =>
   (assert (decyzja "Why?.3.to-give-advice-yes.to-ask-for-advice-yes.to-gripe-about-work-yes.To give advice.To ask for advice.To gripe about work"))
)
(defrule to-give-advice
    (to-give-advice-yes)
   =>
   (assert (decyzja "Did he or she invited you?.2.invited-yes.invited-no.Yes.No"))
)
(defrule invited
    (invited-yes)
   =>
   (assert (decyzja "Can this person handle truth?.2.can-handle-truth-yes.can-handle-truth-no.Yes.No"))
)
(defrule can-handle-truth
    (can-handle-truth-yes)
   =>
   (assert (koniec Wine))
   (printout t "Wine" crlf)
)
(defrule cant-handle-truth-or-a-performance-warning
    (or
    (can-handle-truth-no)
    (performance-warning-yes)
    )
   =>
   (assert (decyzja "Is he or she a crier?.2.crier-yes.crier-no.Yes.No"))
)
(defrule crier
    (crier-yes)
   =>
   (assert (koniec Martini))
   (printout t "Martini" crlf)
)
(defrule not-crier
    (crier-no)
   =>
   (assert (koniec Fancy-coctail))
   (printout t "Fancy coctail" crlf)
)
(defrule not-invited
    (invited-no)
   =>
   (assert (decyzja "Is this a performance warning?.2.performance-warning-yes.performance-warning-no.Yes.No"))
)
(defrule not-performance-warning
    (performance-warning-no)
   =>
   (assert (koniec Lowball))
   (printout t "Lowball" crlf)
)
(defrule to-gripe-about-work
    (to-gripe-about-work-yes)
   =>
   (assert (decyzja "Can this be expensed as work drinks?.2.work-drinks-yes.work-drinks-no.Yes.No"))
)
(defrule not-work-drinks
    (work-drinks-no)
   =>
   (assert (koniec Beer))
   (printout t "Beer" crlf)
)
(defrule work-drinks
    (work-drinks-yes)
   =>
   (assert (decyzja "Is your companion male?.2.companion-male-yes.companion-male-no.Yes.No"))
)
(defrule companion-male
    (companion-male-yes)
   =>
   (assert (koniec Lowball))
   (printout t "Lowball" crlf)
)
(defrule not-companion-male
    (companion-male-no)
   =>
   (assert (decyzja "Is this a girl's night?.2.girls-night-yes.girls-night-no.Yes.No"))
)
(defrule not-girls-night
    (girls-night-no)
   =>
   (assert (koniec Beer))
   (printout t "Beer" crlf)
)
(defrule girls-night
    (girls-night-yes)
   =>
   (assert (koniec Fancy-coctail))
   (printout t "Fancy-coctail" crlf)
)
(defrule to-ask-for-advice
    (to-ask-for-advice-yes)
   =>
   (assert (decyzja "Are you about to get fired?.2.about-to-get-fired-yes.about-to-get-fired-no.Yes.No"))
)
(defrule about-to-get-fired
    (about-to-get-fired-yes)
   =>
   (assert (koniec Martini))
   (printout t "Martini" crlf)
)
(defrule not-about-to-get-fired
    (about-to-get-fired-no)
   =>
   (assert (decyzja "Just scheming for a promotion?.2.scheming-for-promotion-yes.scheming-for-promotion-no.Yes.No"))
)
(defrule scheming-for-promotion
    (scheming-for-promotion-yes)
   =>
   (assert (decyzja "Can this person help you?.2.can-help-yes.can-help-no.Yes.No"))
)
(defrule can-help
    (can-help-yes)
   =>
   (assert (koniec Wine))
   (printout t "Wine" crlf)
)
(defrule not-can-help-or-not-scheming-for-promotion
    (or
    (can-help-no)
    (scheming-for-promotion-no)
    )
   =>
   (assert (decyzja "Will this morph into a bitchfest?.2.bitchfest-yes.bitchfest-no.Yes.No"))
)
(defrule morph-into-bitchfest
    (bitchfest-yes)
   =>
   (assert (koniec Beer))
   (printout t "Beer" crlf)
)
(defrule morph-into-bitchfest
    (bitchfest-no)
   =>
   (assert (koniec Highball))
   (printout t "Highball" crlf)
)
