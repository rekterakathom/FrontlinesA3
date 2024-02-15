player createDiarySubject ["frontlinespage", "Frontlines"];

player createDiaryRecord ["frontlinespage", ["Sectors", 
"
	<font size='24'>Sectors</font>
	<br/>Sectors are the main objective of Frontlines. The game is considered won when all of them have been captured.
	<br/>
	<br/>There are three types of sectors (Village, Town and Capital). You can distinguish between them by the marker size and look.
	<br/>
	<br/>To capture a sector, overpower the initial set of defenders to contest the sector, after which you have to defeat the counter-attack force.
	<br/>
	<br/>Sectors can be in multiple states. To briefly explain these states:
	<br/>
	<br/><font color='#ff0000'>Inactive / active</font>: The sector is controlled by the enemy. If the sector is active, the enemies have spawned.
	<br/>
	<br/><font color='#f300ff'>Contested</font>: The sector is currently being fought over, and the owner is undetermined. This state triggers when the spawned enemies have been defeated and the counter-attack is in progress.
	<br/>
	<br/><font color='#a9a9a9'>Cooling</font>: The sector was recently fought over, and can't be triggered again for some time.
"
]];

player createDiaryRecord ["frontlinespage", ["Saving", 
"
	<font size='24'>Saving and loading</font>
	<br/>Frontlines features seamless saving, and aims to keep your save up-to-date without having to manually do anything.
	<br/>
	<br/>The auto-save runs every 15 minutes, and progress is automatically saved when important things happen, such as a sector changing ownership.
	<br/>
	<br/>The save is also loaded automatically when starting the game.
	<br/>
	<br/>Saves are stored in the ArmA 3 profile of the server in a separate file. You can use this file to back-up your save or transfer it between owners.
"
]];

player createDiaryRecord ["frontlinespage", ["Getting started", 
"
	<font size='24'>Getting started</font>
	<br/>To begin playing, it is strongly recommended that you pick yourself a 'branch'. They will provide you with various benefits (and disadvantages). It doesn't cost anything to change between them, so experiment freely!
	<br/>
	<br/>To briefly explain all branches (more on them in their respective pages):
	<br/>
	<br/>Infantry: They are the backbone of any unit. They are stronger and thus able to carry heavier weapons and more ammunition, but they aren't very stealthy.
	<br/>
	<br/>Recon: They are sneaky, and operate behind enemy lines, carrying out special missions such as destroying emplacements.
	<br/>
	<br/>Support: They keep the wheels of war turning. They are trained medics, explosive specialists and engineers, and thus very valuable members of your unit.
	<br/>
	<br/>Every branch has their own insignia, and you can often times quickly check the branch of a player by looking at their insignia, if their worn uniform has place for one.
"
]];

player createDiaryRecord ["frontlinespage", ["Welcome", 
"
	<font size='24'>Welcome to Frontlines!</font>
	<br/>Frontlines is a co-op combined-arms CTI scenario that aims to cover most aspects of modern combat, including varied infantry roles, support and logistics and combined-arms combat.
	<br/>
	<br/>Success requires the co-operation of all present elements. To get started, read up on the mechanics of the scenario. Good luck and have fun!
"
]];