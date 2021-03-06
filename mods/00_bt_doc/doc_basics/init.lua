--[[
- TODO: Allow to disable images to save bandwidth
- TODO: Add API for subgame-specific changes so the entries are not too awfully generic
   - Support for landing page
   - Support to modify some parts of existing entries
- TODO: Add introduction to online play (if possible)
- TODO: Ideas for advanced entries:
   - Sneak Glitch?
   - Rendering (far view, etc.)
-- TODO: Better (official) support for customizable creative page
]]

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

doc.add_category("beerarchy",
{
	name = S("The Beerarchy"),
	description = S("Specific information about the Beerarchy server and game"),
	sorting = "custom",
	sorting_data = {"introduction", "start", "physics", "ranks", "subranks", "terrain", "armory", "farming", "mobs", "special"},
--	sorting_data = {"introduction", "start", "physics", "armory", "jgdfjshgskdhfsk"},
	build_formspec = doc.entry_builders.text_and_gallery,
})

doc.add_category("basics",
{
	name = S("Basics"),
	description = S("Everything you need to know about Minetest to get started with playing"),
	sorting = "custom",
	sorting_data = {"quick_start", "minetest", "controls", "point", "items", "inventory", "hotbar", "tools", "weapons", "nodes", "mine", "build", "craft", "cook", "minimap", "cam", "sneak", "players", "liquids", "light", "groups", "glossary"},
	build_formspec = doc.entry_builders.text_and_gallery,
})

doc.add_category("advanced",
{
	name = S("Advanced usage"),
	description = S("Advanced information about Minetest which may be nice to know, but is not crucial to gameplay"),
	sorting = "custom",
	sorting_data = {"console", "commands", "privs", "movement_modes", "coordinates", "settings", "online"},
	build_formspec = doc.entry_builders.text_and_gallery,
})


doc.add_entry("beerarchy", "introduction", {
	name = S("Introduction"),
	data = { text =
S("You are approached by a dark figure. Something is amiss. It is not whole, missing an eye, radiating darkness. Its eye, shimmering in the starlight, stares straight into your being, burning your soul, turning your heart into brimstone and ashes, and with a voice of 6000 years old it starts to speak: “I offer you a choice: Live your boring life and achieve nothing, or be cast to Beerarchy to start over and get a chance to gain unfathomable riches and eternal fame. Rot away like a feeble cowardly dog, or defile the gods, conquer their thrones and become the lord master of these desolate lands.“").."\n\n"..

S("You are blinded by the promise of countless bars of gold, endless amounts of diamonds and eternal supplies of mithril, by the promise of immortality, everlasting glory and lordship over a world. You do not need to think about this decision. You take it and grasp the opportunity with your greedy hands.").."\n\n"..

S("A you awaken, you find yourself in a scorching desert. There is nothing but sand and you are stripped of what little Earthly belongings you had. Recalling the dark figure's words, “Start over“, “Get a chance“, you realize all too well that such words should have been taken literally. There is no way back, but now you are more determined than ever. You clench your fists, ready to take on this world, and as you look at the Sun approaching the horizon, you discern some ungodly shapes slowly moving towards you ...")
}})

doc.add_entry("beerarchy", "start", {
	name = S("Survival 101 in “The Beerarchy“"),
	data = { text =
S("On this server, the first order of business it to:").."\n\n"..

S("• Get away from spawn! Now! You may find a farm with some crops near spawn, but don't bet on it").."\n"..
S("• Walk normally. Avoid running, sprinting, jumping and swimming: This all costs hunger").."\n"..
S("• While getting away from spawn, be on the lookout for food or houses which may have a farm. Also look for a red flower and pick one if you find one").."\n"..
S("• Stop reading this help until you find some food. So hit escape, start walking and return to this topic after you found food").."\n\n"..

S("So you are away from spawn, escaped the desert, found some food and are now back to this topic. Great! Did you make a farm? No? Then:").."\n\n"..

S("• If you have food left that you can plant (crops), try to make a mini farm").."\n"..
S("• Craft a hoe and use it on some dirt or dirt with grass next to a water source").."\n"..
S("• Plant your crops on the soil blocks you created using the hoe").."\n"..
S("• The planted crops will take a while to grow, so build a minimal shelter to hide from the mobs at night").."\n"..
S("• Craft a basic sword (wood or stone) and try to kill some spiders to get cotton string needed for a bed").."\n"..
S("• Keep farming and keep trying to get enough cotton string so you can craft a bed. Sleep when you get the chance").."\n\n"..

S("You have shelter, a bed, set your spawn point away from the desert spawn, you have a small farm running for your food. You are good to go! Now you can make a choice: Stay where you are and risk our base being destroyed by griefers, or gather all your resources and start walking yet again to some place far away where you will start building your new base. The choice is yours! Read the other topics for more detailed information about the game mechanics")
}})

doc.add_entry("beerarchy", "physics", {
	name = S("Physics"),
	data = { text =
S("The Beerarchy physics are a bit different from vanilla Minetest survival and are as follows:").."\n\n"..

S("• Standing still: You lose hunger, but you can survive quite a while").."\n"..
S("• Walking: You lose hunger a bit more quickly than standing still").."\n"..
S("• Jumping: You lose hunger a bit more quickly when you jump").."\n"..
S("• Sprinting: Hit the E key to sprint. Sprinting costs stamina and you lose hunger points very quickly. Only sprint when you are in immediate danger or have lots of food").."\n"..
S("• Swimming: When you are under water, you lose breath. Without breath you are hurt. When swimming on or under water you also lose hunger points more quickly").."\n"..
S("• Climbing: Climb using ladders, ropes, rope ladders or handholds. You can use the climbing pick to make handholds in stone and ice. You can use the handholds to climb. When you climb in general (so also when using ladders or ropes) you lose hunger points more quickly").."\n"..
S("• Sneak glitch: Sorry, there is no sneak glitch unfortunately. The old code allows you to glitch through ceilings, the new sneak, well, it just sucks").."\n"..
S("• Stamina: Sprinting costs stamina, when the stamina is all gone, you can no longer run until you regain some stamina").."\n"..
S("• Hunger: You lose hunger points and when you have none left, you starve (damage) and then die if you do not eat something quickly").."\n"..
S("• Health: When you are attacked, when starving or falling from too high, you lose health. Health is regenerated by making sure the hunger is 20 or above. Armor regenerates health as well").."\n"..
S("• Brass city and roads: In one of the underworlds (the “brass city“) you can sprint without losing stamina or hunger. Bring some hot iron and hot brass, and you might be able to do the same above ground!").."\n"..
S("• Blocks/ nodes that hurt you: Some nodes hurt you or pretty much kill you outright. These are hot cobble, poison water, deadly water and of course lava").."\n"..
S("• Upper atmosphere and space: You need a space suit at altitude/ elevation 5000 and above. Without a space suite you get hurt between 5000 and 10000, above 10000 you pretty much die instantly without one. Gravity is less in space").."\n"..
S("• Carrying weight: Don't worry! Your inventory combined with 6 large bags still allows you to carry around 40 - 50 million kilograms (getting close to 100 million pounds) of cobble, which is approximately 2 fully loaded freighter ships or twice the statue of liberty. Inventory does not affect any physics such as speed, stamina or hunger").."\n\n"..

S("Please note, some of the above effects are combined. E.g. if you are in water and swim upward and forward while sprinting, you lose tons and tons of hunger points very very quickly!")
}})

doc.add_entry("beerarchy", "ranks", {
	name = S("The Ranking System"),
	data = { text =
S("The Beerarchy sports a ranking system and one of the goals of the game is to gain as much experience as possible. Higher XP gives you gifts and certain advantages such as more stamina, more powerful arrows. It also unlocks more and more advanced crafts for weapons, armor, tools and special devices. The system consists of your overall experience (XP) and a number of subranks. The subranks make up the total XP. The ranks are weighted, meaning one rank adds more to the total XP than the other, depending on how much effort it takes to get points for the subrank. Within some of the subranks, you get more points for certain items. E.g. constructing items using the advanced constructor gives more intelligence points than using the electronics constructor, because advanced constructor items are very expensive to make. Killing a sand monster adds less points to the hunter rank than killing a cyberdemon or satan since the latter have a lot more health and armor.").."\n\n"..

S("The experience ranks are as follows:").."\n\n"..

S("0 - 1: Baby; Your starting rank, fetal matter, you have a long way to go").."\n\n"..
S("2 - 4: N00b; Yeah you leveled up, congratz but you are still new here. This rank grants you 3 white wool and unlocks steel crafts").."\n\n"..
S("5 - 9: Newfag; Rusher lost the war, you joined the ranks of the losers. This rank grants you a mese sword and unlocks bronze crafts").."\n\n"..
S("10 - 16: Mostly harmless; It might be better if you run from some of the mobs instead of fighting them. But hey why not give it a try. This rank grants you a mithril sword and unlocks mese crafts and simple bows and arrows").."\n\n"..
S("17 - 25: Outsider; Still not really part of the group of veterans on this server. They probably look down on you. This rank grants you a mese block and unlocks diamond crafts").."\n\n"..
S("26 - 36: Familiar face; Have I seen you before? You look vaguely familiar ... Oh it's you again! Mister/ miss “what's your name“! This rank grants you a diamond block and unlocks more bows and arrows and the electronics and small devices constructor").."\n\n"..
S("37 - 49: Local; Howdy pall, how's the mining these days, ran into anything interesting? The mobs leaving you alone? This rank grants you a medium inventory bag and unlocks fire arrows and basic machines").."\n\n"..
S("50 - 66: Oldfag; Been there, done that, got the t-shirt eh? What are you up to now!? Sky diving in the float lands? This rank grants you moon juice and unlocks mithril crafts").."\n\n"..
S("67 - 87: Vetrain; All aboard the vetrain, you've seen lots on this server now, and lots more to see but that don't scare you! Nothing scares veterans! This rank grants you a mithril bow and unlocks more bows and arrows and the space suit").."\n\n"..
S("88 - 112: Elder; People come to you for advice since you know a lot of the secrets on this server. This rank grants you 32 mithril arrows and unlocks the digtron and advanced weapons constructor").."\n\n"..
S("113 - 141: The great; Your name is known across The Beerarchy, you have conquered many lands and instill fear on mobs and players alike. This rank grants you 32 hot stone and unlocks TNT and nyan arrows. At this stage, all crafts are unlocked").."\n\n"..
S("142 - 174: Ancient one; For almost as long as The Beerarchy has existed, you have been around. This rank grants you 64 hot stone").."\n\n"..
S("175 - 215: Legendary; Legend, myth and lore surround you. This rank grants you 32 mithril arrows").."\n\n"..
S("216 - 264: Demi god; Almost untouchable, people whisper your name in awe. This rank grants you 64 mithril blocks").."\n\n"..
S("265 - 346: God; Invincible, divine being, able to use your Godly powers to protect what is yours (or steal what belongs to others). This rank grants you protectors").."\n\n"..
S("347 - 460: Titan; Those who gave birth to the Gods, undefeatable towering power houses. This rank grants you protectors").."\n\n"..
S("461 - 999: Primordial Being; The ones who gave rise to Titans and Gods, the first structures of the universe. This rank grants you protectors").."\n\n"..
S("1000 - 1600: Chaos; All originates from chaos, and chaos is all around us. This rank grants you protectors").."\n\n"..
S("1601 - 1703: Of Unknown Origin; Mysterious, no one knows what you are or where you come from. Is there anything beyond the unknown? This rank grants you protectors").."\n\n"..
S("1704 - 65535: The True Definition of Cheater; If you reach this many points, you have cheated as you cannot get more than 1700 points. This rank grants you a doobie").."\n\n"..

S("The next article describes the subranks and how to gain points for each subrank.")
}})

doc.add_entry("beerarchy", "subranks", {
	name = S("Subranks"),
	data = { text =
S("The subranks work as follows:").."\n\n"..

S("Hunter: For each mob killed, you gain points. The more base health(!) the mob has as per its definition (so excluding mob health gains from being farther away from spawn), the more points you get per kill capped at 50. You get an additional 5 points for killing it with bow and arrow.").."\n\n"..
S("Farmer: For each crop that you dig you get points. Not fully grown crops do not give points! The more “effort“ you need to put in growing crops (slow growing or extra crafts for grapes/ beans), the more points you get.").."\n\n"..
S("Miner: You get points for digging special nodes. So stone does not count towards the mining rank, but ores do. The rarer or more difficult it is to mine the ore, the more points you get.").."\n\n"..
S("Builder: For each building material placed, you get points. Dirt does not count. Rarer or more difficult to get materials give more points.").."\n\n"..
S("Traveler: Absolute distance traveled. The system checks your current and last position and gives you points for the difference between the two. This excludes distances traveled using travelnet teleporter boxes!").."\n\n"..
S("Mountaineer: Absolute height climbed. Whenever ascending above ground(!) you will get points for the difference between your last height and current height. This excludes elevation gained using teleporters or elevators!").."\n\n"..
S("Caving: Absolute depth gained. Whenever descending below ground(!) you will get points for the difference between your last depth and current depth. This excludes depth gained using teleporters or elevators!").."\n\n"..
S("Intelligence: When crafting the electronics, basic machines or digtron constructor, you gain intelligence, as well as when you construct items using these constructors. More expensive constructors or crafts give more points.").."\n\n"..
S("The game keeps track of which nodes were dug and placed, so if you think you can quickly rank up using builder and miner ranks by continuously placing and digging the same node on the same position, you are out of luck.")
}})

doc.add_entry("beerarchy", "terrain", {
	name = S("The Beerarchy Terrain and Underworlds"),
	data = { text =
S("The terrain of The Beerarchy consists of the surface terrain and mountains, the float lands and a number of underworlds. In the over world (positive Y) you will find:").."\n\n"..

S("The surface: Map generator parameters have been tweaked to give rise to extremely shaped mountains that reach all the way to the float lands").."\n\n"..
S("Surface mountains: Difficult to navigate but majestic, sometimes offering spectacular views. At around +700 - +800 high, you will find strata of coal blocks, the best fuel source for running some of the basic machines or furnaces that need to burn slow cooking items").."\n\n"..
S("Float lands: The float lands are basically a network of lands and mountains that float in the sky. They start at around +1200 high. They are a great hiding place for your base and all types of ores can be found there").."\n\n"..
S("Upper atmosphere: At +5000 high, the upper atmosphere starts. The terrain changes, biomes disappear. You need the space suit here due to the low pressure and lack of oxygen, or you receive damage").."\n\n"..
S("Space: At +10000 high, you are in space. This is a rocky landscape with decreased gravity. You can find ores sometimes in plain sight and exposed on the rock surface. You need the space suit here, or you will pretty much instantly die").."\n\n"..

S("Below the surface are the underworlds, endless caves with their own terrain, enemies and special nodes. They have a lot more riches but getting there and navigating them is increasingly dangerous to the extreme:").."\n\n"..

S("Caina (-1600 to -1720): The ice world, with steel blocks everywhere but golems as well. This will be your first taste of things to come, and the first time you will devise a way to get down. I am sure however you will fall to your death the first time you try!").."\n\n"..
S("Dis (-2400): The brass world or brass city if you will. If you need bronze and copper, this is the place to be. You always sprint here without losing stamina or hunger due to the special powers of hot iron and hot brass. Bring some to the surface, place them in a special arrangement and see what happens!").."\n\n"..
S("Phlegethos (-3200 to -3320): The first hell, also known as “fake hell“, in case you need some diamond and obsidian. There is nothing fake about this hell however, with its flying rainbow pooping mobs. Some say they were created in some evil Nyan Cat genetic experiment on humans and moths").."\n\n"..
S("Minauros (-4000 to -4120): The polluted world, or poison world if you will. Get your mese here but don't drink the water. Oh, and watch out for those 8 legged creeps as they may explode into something even more terrifying").."\n\n"..
S("Styx (-4800 to -4920): An underground ocean. Move along, nothing to see here. Just a big obstacle you need to traverse in order to get to the next underworld. Just make sure you don't drown").."\n\n"..
S("Nessus (-5840 to -6000): The second hell, for all your diamond, mese and gold needs if Satan let's you. Just don't be too greedy when you see some of that good stuff in the water. Better still, stay away from water here").."\n\n"..
S("Mantellum (-9600 to -10000): Need obsidian? This lava ocean will give you all the obsidian you need, if you just bring enough water buckets. And that is pretty much all there is here, but you will have to traverse it to get to even worse places. Good luck with that, and I hope you have lots of patience. But maybe you are “intelligent“ enough to find a quicker way down this hellish pit of lava").."\n\n"..
S("Coreum (-13600 to -15200): You read that right ... A whopping 1600 block descend into what is commonly know as the rainbow world or rainbow hell. You can imagine what you will find here. It is butt ugly and hurting the eyes, just like the rockets that will explode in your face when you meet our dear old rocket launcher wielding friend, mister Cyber Demon").."\n\n"..
S("Gaia (-18400 to -20000): Gaia ... Mother earth ... But she is one hell of a pissed off mother if you get here! You need a dragon? Try and catch one if you can ... At least you will be able to see what you're up against")
}})

doc.add_entry("beerarchy", "armory", {
	name = S("The Armory"),
	data = { text =
S("Welcome to the armory. Here you will learn about the various weapons and armor the game has to offer. In general, the rarer the material, the more effective it is. From steel onward, you need to unlock the crafts by reaching certain XP levels (see also the article about the ranking system):").."\n\n"..

S("• Wood: For the real n00bs ... -_-").."\n"..
S("• Cactus (armor only): You really want to walk around like that?? O_o").."\n"..
S("• Stone (tools and weapons only): When you start, once you dig some cobble, throw away your wooden pick and upgrade to one of these immediately. Slow, weak, wears quickly but hey you gotta start somewhere! Otherwise, do not bother crafting stone tools and weapons").."\n"..
S("• Steel: More like it, using easy to find materials to craft cheap protection and weapons. They are good for some of the simpler mobs, but I still think you are a n00b for wearing steel armor").."\n"..
S("• Bronze: You will want to upgrade to these durable yet easier to get armors, weapons and tools quickly. Good, cheap, easy, effective! No shame in using these, keep a spare set around in cae you lose your main armor").."\n"..
S("• Mese (tools and weapons only): Durable, powerful and high speed, but you might want to save mese for other things like bags, machines, etc.").."\n\n"..
S("• Diamond: Extremely durable, offering good protection and packing a punch!").."\n"..
S("• Mithril: The rarest material around, but offering the highest damage and protection of them all. Don't leave home without a mithril sword and set of armor!").."\n\n"..

S("Now that we discussed the materials, let's have a look at the standard and special weapons we have on offer.").."\n\n"..

S("The sword: Your basic weapon of choice for melee battle. Always use a mithril one as soon as you can craft it. Nuff said.").."\n\n"..

S("Bows: These are obviously for ranged attack. Be careful: When you hit a mob, its viewing distance is temporarily increased, making sniping a bit more challenging. The bow has a reload time determined by the bow itself and the type of arrow you shoot:").."\n\n"..

S("• Wooden bow: Slow reload especially with the steel point arrows, almost no durability").."\n"..
S("• Steel bow: Faster reload and bit more durable than wood").."\n"..
S("• Mithril bow: Quite fast reload, especially with the faster arrows such as mithril or rainbow arrows").."\n"..
S("• MTG9000 Rapid Fire Heavy Crossbow Mk II: The best there is! The quickest bow around, firing rapidly regardless of the type of arrow as all arrow reload times are the same with this baby! You need the advanced constructor to make one of these").."\n\n"..

S("Reload times of better arrows decreases, except for the TNT arrow. Extra damage is dealt by the arrow based on your XP. A random critical hit is sometimes granted on top of that. The TNT arrow has an bigger blast radius when you have higher XP and there is a random extra radius added to it, so be careful! The following arrows are available in The Beerarchy:").."\n\n"..

S("• Steel arrow: Good for starters and as backup arrow source since iron is so easily found. They do not deal a lot of damage however and are slow to reload").."\n"..
S("• Fire arrow: Sets things on fire. Good for hurting other players (and griefing)").."\n"..
S("• Mithril arrow: Deals quite a bit of damage and reloads quickly").."\n"..
S("• Nyan Cat arrow: Also know as the rainbow arrow, it is made of the bits and pieces of a Nyan Cat. Fastest arrow for use with the conventional bows and very high damage").."\n"..
S("• TNT arrow: Why? Because we can! Shoot these babies using the MTG9000 and you will understand why! So get a MTG9000 in your nearest advanced constructor now! The arrows cause an explosion on impact destroying nearby blocks and damaging nearby enemies. Great for shooting at packs of enemies, if you are not that accurate or just for fun. Extremely dangerous (don't blow up yourself) and extremely slow reload time when used with a normal bow however ...").."\n\n"..

S("There are some special weapons as well:").."\n\n"..

S("• TNT: Good old TNT. Blows things up in a radius of 3. Rank does not influence the blast radius or damage dealt by TNT").."\n"..
S("• Dig arrow: Digs a node, handy in case you cannot reach some blocks you would like to dig or to remove nodes underneath enemies lol").."\n"..
S("• Build arrow: Places a node (first one next to the arrow), for those places you cannot reach and in case you are too lazy building some scaffolding").."\n"..
S("• Teleport arrow: Teleports you to the place where the arrow hits another block. Please note that the last arrow to hit a node counts, and be careful when shooting at a vertical drop that would kill you, although it would make for a great escape from falling as well!").."\n"..
S("• Mines: Triggered by players (not mobs!) when stepping on one or when nearby. They will cause an explosion hurting or immediately killing the player that triggered it and any players nearby. You can make mines that look like dirt or grass and make an invisible minefield").."\n"..
S("• Ball spawner: The basic machines ball spawner, shoots balls in a given direction, but only useful against other players (for now) and you need to program it to set the direction. Still good to make a trap with one of these by having it controlled by a detector. See also the basic machines article").."\n\n"..

S("Note: Some nodes are more or less resistant to TNT and TNT based weapons, e.g. obsidian and obsidian based construction materials deflects the blast of TNT arrows")

}})

doc.add_entry("beerarchy", "farming", {
	name = S("Farming"),
	data = { text =
S("Before we get into the details of farming, we first dive into some specifics for this server:").."\n\n"..

S("• Food is extremely scarce in this world. This applies to grass, crops, apples, etc.").."\n"..
S("• Crops grow in groups, so good chance that if you find a crop there are others nearby").."\n"..
S("• Crop yields are limited, so when you farm a crop you will only get a limited amount of food/ seeds").."\n"..
S("• Melons are extremely rare, but have the highest yield. He who controls the melons controls the Beerarchy").."\n\n"..

S("Basically, farming on the Beerarchy takes more effort but the biggest challenge is to find food in the first place. To farm crops, you need dirt, water, a hoe, light and of course some crops/ seeds").."\n\n"..

S("• Make sure the dirt block is next to or close to a water source and that there is enough light").."\n"..
S("• Use the hoe on the dirt. It will now change into soil. The soil is dry and light brown at first and then turns into the dark brown wet soil").."\n"..
S("• Place the seeds or the crop on the soil").."\n"..
S("• Wait until the crops are fully grown. If they are not growing, make sure nothing blocks the sunlight and that the soil is wet (dark brown)").."\n"..
S("• When the crops are ready, dig them. Some crops (e.g. wheat, cocoa) yield seeds besides the food").."\n"..
S("• For crops that yield seeds, replant the seeds. For crops that do not, replant the crop output").."\n"..
S("• Rinse and repeat").."\n\n"..

S("Some special considerations are:").."\n\n"..

S("• The extremely rare melons grow between Y = 0 and 200 and near water. Melons are also gifted when you rank up to Chaos level").."\n"..
S("• Some of the crops also grow under certain conditions such as elevation, biome, the type of node they grow on").."\n"..
S("• Apple trees rarely have apples. Trees grown from saplings will have apples however").."\n"..
S("• Mese lamps give enough light for growing crops under ground or in dark areas").."\n"..
S("• As said before, make sure there is enough light and that water is nearby. Sometimes the float lands or mountain overhangs can block sunlight").."\n"..
S("• Hemp can be used to craft rope and rope ladders, as well as doobies. They are not edible").."\n"..
S("• Cocoa needs to be planted against jungle tree").."\n"..
S("• Beans and grapes need talks in order to grow. Place beans under and grapes against these stalks")

}})

doc.add_entry("beerarchy", "mobs", {
	name = S("Animals and Monsters"),
	data = { text =
S("As with crops, getting food from animals is more difficult as they do not always drop meat. Meat is however a very nutritious food. Eating meat raw is less nutritious and causes some damage. The following animals (passive mobs) exist on this world:").."\n\n"..

S("• Bees: Can be found near flowers, can be captured and combined to create honey. When placing a beehive it will spawn many bees").."\n"..
S("• Rats: Can be found underground near stone").."\n"..
S("• Chicken: Can be found on grass, lays eggs, tameable using wheat seeds or cotton seeds").."\n"..
S("• Bunny: Can be found on grass, tameable using carrots").."\n"..
S("• Penguin: Can be found in snow biomes, tameable using fish").."\n"..
S("• Sheep: Can be found on grass, tameable using wheat or (fully grown) grass. Use shears to get the wool from the sheep").."\n"..
S("• Warthog: Can be found on grass, tameable using apples. Attack you when you attack it").."\n"..
S("• Cow: Can be found on grass, tameable using wheat, source of leather. Attack you when you attack it").."\n"..
S("• Horse: Can be found on grass, tameable using wheat, source of leather. Use a saddle on a horse in order to be able to ride it").."\n"..
S("• Cash's World Feline Overlord: A.k.a. kitten, spawns near grass, needs tons and tons of fish to be tamed. Most powerful animal in the game. Extremely fast, deadly and shooting fireballs when turned aggressive by nearby monster or by being attacked by the player").."\n"..

S("Monsters").."\n\n"..

S("• Sand, stone and dirt monster, the easiest of the bunch, only dangerous to n00bs").."\n"..
S("• Oerkki, easy to kill but beware as they are fast and can hurt when you are unprepared").."\n"..
S("• Spiders, such as the normal spiders and the giant spider which explode into lots of mini spiders when killed").."\n"..
S("• Tree monster, always lurking in thick forest ready to jump you from above or behind").."\n"..
S("• Lava flan, which dwell in lava lakes but not much of a challenge").."\n"..
S("• Golems, tough and dangerous. At least you can hear their heavy footsteps from far away. Sometimes they drop a golem stone which can be grown into a friendly golem").."\n"..
S("• Mese monsters, flying chunks of mese, easy to kill but shooting mese crystals rapidly which can quickly drain your HP").."\n"..
S("• Dungeon master, dangerous fireball shooting monster that destroy nodes, so make sure that you protect important items with obsidian").."\n"..
S("• Moth man, half moth half man, flying and shitting rainbows while attacking you in the air").."\n"..
S("• Manticore, half scorpion half man, but looks more dangerous than it actually is").."\n"..
S("• Hell baron, extremely tough demon that shoots fire balls punches hard").."\n"..
S("• Cyber demon, biotechnically engineered and enhanced demon with rocket launchers that shoot exploding rockets").."\n"..
S("• Various dragons, extremely rare and super dangerous, but tameable! Tame one of these babies and you can use a saddle to fly the dragon").."\n\n"..

S("Some special considerations are:").."\n\n"..

S("• Use the net to capture small animals, use the magic lasso to capture larger animals").."\n"..
S("• Be careful riding tamed animals in water such as horses and dragons. They will get stuck in the water and may even die").."\n"..
S("• Mobs farther away have higher HP, armor, speed and difficulty").."\n"..
S("• Dungeon master's fireballs cannot penetrate obsidian").."\n"..
S("• The cyber demon's rocket have actual TNT explosions with a blast and damage radius. Stay away from those rockets!").."\n"..
S("• You may want to kill giant spiders from a distance using arrows. It explodes into small spiders when it dies, something which can get you into a lot of trouble").."\n\n"..

S("To tame a dragon:").."\n\n"..

S("• Kill some dragons until you have a dragon egg and dragon gem").."\n"..
S("• Create a nest which consists of one 3x3 layer of lava source blocks, with another layer on top with the dragon egg in the middle").."\n"..
S("• Basically it should be a sort of bowl of lava with the lava all around the egg (below and on the sides)").."\n"..
S("• Feed it a dragon gem until you see a message in chat stating that it took the gem. If nothing happens, wait and try again later").."\n"..
S("• After feeding the gem, wait again until a dragon spawns. Be careful, sometimes the dragon gets stuck in the bowl -_-").."\n"..
S("• Dragons are finicky, when you are having problems breeding one, ask around on the forums. After all, this server only hosts this mod created by someone else")

}})

doc.add_entry("beerarchy", "special", {
	name = S("Special Topics"),
	data = { text =
S("Banners, armor banners and painted armor canvas:").."\n\n"..
S("Banners can be used to make decorative flags and you can wear the banner as decoration on your shield and armor. There is no additional functionality associated with banners, i.e. there is no such thing as factions. Of course you can team up with other players and wear the same banner. The simplest form is the armor banner:").."\n\n"..
S("• Craft paper in the shape of a shield with a wooden banner in the middle").."\n"..
S("• Punch the banner in the air and start playing around with the banner user interface until you have a banner you like").."\n"..
S("• Double click outside of the banner creation window (sorry this mod did not come with a close button -_-)").."\n"..
S("• Place the armor banner in the (last) remaining free armor slot and the banner will be placed on your shield and chest plate").."\n\n"..

S("If you feel a bit more creative, you can create a custom painted armor banner:").."\n\n"..

S("• Craft an easel and one of the armor canvases (6x6, 12x12 or 24x24). Make sure it is *armor canvas*, normal canvas will NOT work properly").."\n"..
S("• Craft brushes in the colors you want to use in your painted armor using sticks and dye").."\n"..
S("• Left click with the brush in the color of choice to place a pixel on the canvas").."\n"..
S("• Keep shift pressed while painting to draw lines").."\n"..
S("• When ready, take the canvas by digging it on the side or the back (front does not work as that is the painting area). It will appear in the inventory as a painted canvas").."\n"..
S("• Place the painted canvas in the (last) remaining free armor slot and the painting will be placed on your shield and chest plate")

}})



doc.add_entry("basics", "quick_start", {
	name = S("Quick start"),
	data = { text =
S("This is a very brief introduction to the basic gameplay:").."\n\n"..

S("• Move mouse to look").."\n"..
S("• [W], [A], [S] and [D] to move").."\n"..
S("• [Space] to jump or move upwards").."\n"..
S("• [Shift] to sneak or move downwards").."\n"..
S("• Mouse wheel or [0]-[9] to select item").."\n"..
S("• Left-click to mine blocks or attack").."\n"..
S("• Recover from swings to deal full damage").."\n"..
S("• Right-click to build blocks and use things").."\n"..
S("• [I] for the inventory").."\n"..
S("• First items in inventory appear in hotbar below").."\n"..
S("• [F9] for the minimap").."\n"..
S("• Put items into crafting grid (usually 3×3 grid) to craft").."\n"..
S("• Use a crafting guide mod to learn crafting recipes or visit <http://wiki.minetest.net/wiki/Crafting>").."\n"..
S("• Read entries in this help to learn the rest").."\n"..
S("• [Esc] to close this window")
}})

doc.add_entry("basics", "minetest", {
	name = S("Minetest"),
	data = {
		text =
S("Minetest is a free software game engine for games based on voxel gameplay, inspired by InfiniMiner, Minecraft, and the like. Minetest was originally created by Perttu Ahola (alias “celeron55”).").."\n\n"..

S("The player is thrown into a huge world made out of cubes or blocks. These cubes usually make the landscape they blocks can be removed and placed almost entirely freely. Using the collected items, new tools and other items can be crafted. Games in Minetest (also called “subgames”) can, however, be much more complex than this.").."\n\n"..

S("A core feature of Minetest is the built-in modding capability. Mods modify existing gameplay. They can be as simple as adding a few decorational blocks or be very complex by e.g. introducing completely new gameplay concepts, generating a completely different kind of world, and many other things.").."\n\n"..

S("Minetest can be played alone or online together with multiple players. Online play will work out of the box with any mods, with no need for additional software as they are entirely provided by the server.").."\n\n"..

S("Minetest is usually bundled with a simple default game, named “Minetest Game” (shown in images 1 and 2). You probably already have it. Other games for Minetest can be downloaded from the official Minetest forums <https://forum.minetest.net/viewforum.php?f=48>.").."\n\n"..

S("Minetest as well as Minetest Game are both unfinished at the moment, so please forgive us when not everything works out perfectly."),
		images = {{image="doc_basics_gameplay_mtg_1.png"}, {image="doc_basics_gameplay_mtg_2.png"}, {image="doc_basics_gameplay_carbone_ng.png"}, {image="doc_basics_gameplay_lott.png"}, {image="doc_basics_gameplay_pixture.png"}, {image="doc_basics_gameplay_outback.png"}, {image="doc_basics_gameplay_moontest.png"},
{image="doc_basics_gameplay_hades.png"}, {image="doc_basics_gameplay_xtraores_xtension.png"},}
}})

doc.add_entry("basics", "sneak", {
	name = S("Sneaking"),
	data = { text =
S("Sneaking makes you walk slower and prevents you from falling off the edge of a block.").."\n"..
S("To sneak, hold down the sneak key (default: [Shift]). When you release it, you stop sneaking. Careful: When you release the sneak key at a ledge, you might fall!").."\n\n"..

S("• Sneak: [Shift]").."\n\n"..

S("Sneaking only works when you stand on solid ground, are not in a liquid and don't climb.").."\n\n"..

S("If you jump while holding the sneak key, you also jump slightly higher than usual.").."\n\n"..

S("Sneaking might be disabled by mods. In this case, you still walk slower by sneaking, but you will no longer be stopped at ledges."),
		images = { { image = "doc_basics_sneak.png" } },
}})

doc.add_entry("basics", "controls", {
	name = S("Controls"),
	data = { text =
S("These are the default controls:").."\n\n"..

S("Basic movement:").."\n"..
S("• Moving the mouse around: Look around").."\n"..
S("• W: Move forwards").."\n"..
S("• A: Move to the left").."\n"..
S("• D: Move to the right").."\n"..
S("• S: Move backwards").."\n\n"..

S("While standing on solid ground:").."\n"..
S("• Space: Jump").."\n"..
S("• Shift: Sneak").."\n\n"..

S("While on a ladder, swimming in a liquid or fly mode is active").."\n"..
S("• Space: Move up").."\n"..
S("• Shift: Move down").."\n\n"..

S("Extended movement (requires privileges):").."\n"..
S("• J: Toggle fast mode, makes you run or fly fast (requires “fast” privilege)").."\n"..
S("• K: Toggle fly mode, makes you move freely in all directions (requires “fly” privilege)").."\n"..
S("• H: Toggle noclip mode, makes you go through walls in fly mode (requires “noclip” privilege)").."\n"..
S("• E: Walk fast in fast mode").."\n\n"..

S("World interaction:").."\n"..
S("• Left mouse button: Punch / mine blocks / take items").."\n"..
S("• Right mouse button: Build or use pointed block").."\n"..
S("• Shift+Right mouse button: Build").."\n"..
S("• Roll mouse wheel: Select next/previous item in hotbar").."\n"..
S("• 0-9: Select item in hotbar directly").."\n"..
S("• Q: Drop item stack").."\n"..
S("• Shift+Q: Drop 1 item").."\n"..
S("• I: Show/hide inventory menu").."\n\n"..

S("Inventory interaction:").."\n"..
S("See the entry “Basics > Inventory”.").."\n\n"..

S("Camera:").."\n"..
S("• Z: Zoom (requires “zoom” privilege)").."\n"..
S("• F7: Toggle camera mode").."\n"..
S("• F8: Toggle cinematic mode").."\n\n"..

S("Interface:").."\n"..
S("• Esc: Open menu window (pauses in single-player mode) or close window").."\n"..
S("• F1: Show/hide HUD").."\n"..
S("• F2: Show/hide chat").."\n"..
S("• F9: Toggle minimap").."\n"..
S("• Shift+F9: Toggle minimap rotation mode").."\n"..
S("• F10: Open/close console/chat log").."\n"..
S("• F12: Take a screenshot").."\n\n"..

S("Server interaction:").."\n"..
S("• T: Open chat window (chat requires the “shout” privilege)").."\n"..
S("• /: Start issuing a server command)").."\n\n"..

S("Technical:").."\n"..
S("• R: Toggle far view (disables all fog and allows viewing far away, can make game very slow)").."\n"..
S("• +: Increase minimal viewing distance").."\n"..
S("• -: Decrease minimal viewing distance").."\n"..
S("• F3: Enable/disable fog").."\n"..
S("• F5: Enable/disable debug screen which also shows your coordinates").."\n"..
S("• F6: Only useful for developers. Enables/disables profiler").."\n"..
S("• P: Only useful for developers. Writes current stack traces")
}})

doc.add_entry("basics", "players", {
	name = S("Players"),
	data = {
		text =
S("Players (actually: “player characters”) are the characters which users control.").."\n\n"..

S("Players are living beings which occupy a space of about 1×2×1 cubes. They start with 20 health points (HP) and 10 breath points (BP).").."\n"..
S("Players are capable of walking, sneaking, jumping, climbing, swimming, diving, mining, building, fighting and using tools and blocks.").."\n"..

S("Players can take damage for a variety of reasons, here are some:\
• Taking fall damage\
• Touching a block which causes direct damage\
• Drowning\
• Being attacked by another player\
• Being attacked by a computer enemy").."\n\n"..

S("At a health of 0, the player dies. The player can just respawn in the world.").."\n"..
S("Other consequences of death depend on the subgame. The player could lose all items, or lose the round in a competitive game.").."\n\n"..

S("Some blocks reduce breath. While being with the head in a block which causes drowning, the breath points are reduced by 1 for every 2 seconds. When all breath is gone, the player starts to suffer drowning damage. Breath is quickly restored in any other block.").."\n\n"..

S("Damage can be disabled on any world. Without damage, players are immortal and health and breath are unimportant.").."\n\n"..

S("In multi-player mode, the name of other players is written above their head."),
		images = {{image="doc_basics_players_sam.png"}, {image="doc_basics_players_lott.png"}, {image="doc_basics_players_flat.png"}},
}})

doc.add_entry("basics", "items", {
	name = S("Items"),
	data = {
		text =
S("Items are things you can carry along and store in inventories. They can be used for crafting, smelting, building, mining, and more. Types of items include blocks, tools, weapons and items only used for crafting.").."\n\n"..

S("An item stack is a collection of items of the same type which fits into a single item slot. Item stacks can be dropped on the ground. Items which drop into the same coordinates will form an item stack.").."\n\n"..

S("Items have several properties, including the following:\
\
• Maximum stack size: Number of items which fit on 1 item stack\
• Pointing range: How close things must be to be pointed while wielding this item\
• Group memberships: See “Basics > Groups”\
• May be used for crafting or cooking").."\n\n"..

S("A dropped item stack can be collected by punching it."),
		images = {{image="doc_basics_inventory_detail.png"}, {image="doc_basics_items_dropped.png"}},
}})

doc.add_entry("basics", "tools", {
	name = S("Tools"),
	data = { text =
S("Some items may serve as a tool when wielded. Any item which has some special use which can be directly used by its wielder is considered a tool.").."\n\n"..

S("A common tool in Minetest are, of course, mining tools. These are important to break all kinds of blocks. Weapons are a kind of tool in Minetest. There are of course many other possible tools. Special actions of tools are usually done by left-click or right-click.").."\n\n"..

S("When nothing is wielded, players use their hand which may act as tool and weapon. The hand is capable of collecting dropped items by punching.").."\n\n"..

S("Many tools will wear off when using them and may eventually get destroyed. The damage is displayed in a damage bar below the tool icon. If no damage bar is shown, the tool is in mint condition. Tools may be repairable by crafting, see “Basics > Crafting”."),
		images = {{image="doc_basics_tools.png"}, {image="doc_basics_tools_mining.png"}},
}})

doc.add_entry("basics", "weapons", {
	name = S("Weapons"),
	data = { text =
S("Some items are usable as a melee weapon when wielded. Weapons share most of the properties of tools.").."\n\n"..

S("Melee weapons deal damage by punching players and other animate objects. There are two ways to attack:").."\n"..
S("• Single punch: Left-click once to deal a single punch").."\n"..
S("• Quick punching: Hold down the left mouse button to deal quick repeated punches").."\n\n"..

S("There are two core attributes of melee weapons:").."\n"..
S("• Maximum damage: Damage which is dealt after a hit when the weapon was fully recovered)").."\n"..
S("• Full punch interval: Time it takes for fully recovering from a punch").."\n\n"..

S("A weapon only deals full damage when it has fully recovered from a previous punch. Otherwise, the weapon will deal only reduced damage. This means, quick punching is very fast, but also deals rather low damage. Note the full punch interval does not limit how fast you can attack.").."\n\n"..

S("There is a rule which sometimes makes attacks impossible: Players, animate objects and weapons belong to damage groups. A weapon only deals damage to those who share at least one damage group with it. So if you're using the wrong weapon, you might not deal any damage at all.")
}})


doc.add_entry("basics", "point", {
	name = S("Pointing"),
	data = {
		text =
S("“Pointing” means looking at something in range with the crosshair. Pointing is needed for interaction, like mining, punching, using, etc. Pointable things include blocks, dropped items, players, computer enemies and objects.").."\n\n"..

S("To point something, it must be in the pointing range (also just called “range”) of your wielded item. There's a default range when you are not wielding anything. A pointed thing will be outlined or highlighted (depending on your settings). Pointing is not possible with the 3rd person front camera.").."\n\n"..

S("A few things can not be pointed. Most blocks are pointable. A few blocks, like air, can never be pointed. Other blocks, like liquids can only be pointed by special items."),
		images = {{ image = "doc_basics_pointing.png" }},
}})

doc.add_entry("basics", "cam", {
	name = S("Camera"),
	data = {
		text =
S("Minetest has 3 different views which determine the way you see the world. The modes are:\
\
• 1: First-person view (default)\
• 2: Third-person view from behind\
• 3: Third-person view from the front").."\n\n"..

S("You can change the camera mode by pressing [F7].").."\n"..
S("There is also Cinematic Mode which can be toggled with [F8]. With Cinematic Mode enabled, the camera movements become more smooth. Some players don't like it, it is a matter of taste.").."\n"..
S("By holding down [Z], you can zoom the view at your crosshair. You need the “zoom” privilege to do this.").."\n\n"..

S("• Switch camera mode: [F7]").."\n"..
S("• Toggle Cinematic Mode: [F8]").."\n"..
S("• Zoom: [Z]"),
		images = {{image="doc_basics_camera_ego.png"}, {image="doc_basics_camera_behind.png"}, {image="doc_basics_camera_front.png"}}
}})

doc.add_entry("basics", "nodes", {
	name = S("Blocks"),
	data = {
		text =
S("The world of Minetest is made entirely out of blocks (voxels, to be precise). Blocks can be added or removed with the correct tools.").."\n\n"..

S("Blocks can have a wide range of different properties which determine mining times, behavior, looks, shape, and much more. Their properties include:").."\n\n"..

S("• Collidable: Collidable blocks can not be passed through; players can walk on them. Non-collidable blocks can be passed through freely").."\n"..
S("• Pointable: Pointable blocks show a wireframe or a halo box when pointed. But you will just point through non-pointable blocks. Liquids are usually non-pointable but they can be pointed at by some special tools").."\n"..
S("• Mining properties: By which tools it can be mined, how fast and how much it wears off tools").."\n"..
S("• Climbable: While you are at a climbable block, you won't fall and you can move up and down with the jump and sneak keys").."\n"..
S("• Drowning damage: See the entry “Basics > Player”").."\n"..
S("• Liquids: See the entry “Basics > Liquids”").."\n"..
S("• Group memberships: Group memberships are used to determine mining properties, crafting, interactions between blocks and more"),
		images = {{image="doc_basics_nodes.png"}}
}})

-- TODO: Oh jeez, this explanation is WAY too difficult. Maybe we need to find some way to make it easier to understand.
doc.add_entry("basics", "mine", {
	name = S("Mining"),
	data = {
		text =
S("Mining (or digging) is the process of breaking blocks to remove them. To mine a block, point it and hold down the left mouse button until it breaks.").."\n\n"..

S("Short explanation:").."\n\n"..

S("Blocks require a mining tool to be mined. Different blocks are mined by different mining tools, and some blocks can not be mined by any tool. Blocks vary in toughness and tools vary in strength. Mining tools will wear off over time. The mining time and the tool wear depend on the block and the mining tool. The fastest way to find out how efficient your mining tools are is by just trying them out on various blocks. Any items you gather by mining go straight into your inventory.") .. "\n\n"..

S("Detailed explanation:").."\n\n"..

S("Mineable blocks have mining properties (based on groups) and a toughness level. Mining tools have the same properties. Each mining property of a block also has a rating, while tools can be able to break blocks within a range of ratings.").."\n\n"..

S("In order to mine a block, these conditions need to be met:").."\n"..
S("• The block and tool share at least one mining property for which they have a matching rating").."\n"..
S("• The tool's toughness level is equal or less than the block's toughness level").."\n\n"..

S("Example: A block with the mining property “cracky”, rating 3 and toughness level 0 can only be broken by a tool which is able to break “cracky” blocks at rating 3 and it must have a toughness level of 0 or larger.").."\n\n"..

S("The time it takes to mine a block depends on the ratings and the toughness levels of both tool and block.").."\n"..
S("• The base mining time depends on the ratings of the block and the mining speed of the tool").."\n"..
S("• The mining speed of the tool differs for each mining property and its rating").."\n"..
S("• The toughness level further modifies the mining speed for this mining proeprty").."\n"..
S("• A high difference in toughness levels decreases the mining time considerably").."\n"..
S("• If the toughness level difference is 2, the mining time is half of the base mining time").."\n"..
S("• If the a difference of 3, the mining time is a third, and so on").."\n\n"..

S("The item help shows the mining times of a tool listed by its mining properties and its ratings. The mining times are often expressed as a range. The low number stands for the mining time for toughness level 0 and the high number for the highest level the tool can mine.").."\n\n"..

S("Mining usually wears off tools. Each time you mine a block, your tool takes some damage until it is destroyed eventually. The wear per mined block determined by the difference between the tool's toughness level and the block's toughness level. The higher the difference, the lower the wear. This means:").."\n"..
S("• High-level blocks wear off your tools faster").."\n"..
S("• You can use high-level tools to compensate this").."\n"..
S("• The highest wear is caused when the level of both tool and block are equal").."\n\n"..

S("After mining, a block may leave a “drop” behind. This is a number of items you get after mining. Most commonly, you will get the block itself. There are other possibilities for a drop which depends on the block type. The following drops are possible:").."\n"..
S("• Always drops itself (the usual case)").."\n"..
S("• Always drops the same items").."\n"..
S("• Drops items based on probability").."\n"..
S("• Drops nothing").."\n\n"..

S("The drop goes directly into your inventory, unless there's no more space left. In that case, the items literally drop on the floor."),
		images = {{image="doc_basics_tools_mining.png"}},
}})

doc.add_entry("basics", "build", {
	name = S("Building"),
	data = {
		text =
S("Almost all blocks can be built (or placed). Building is very simple and has no delay.").."\n\n"..

S("To build your wielded block, point at a block in the world and right-click. If this is not possible because the pointed block has a special right-click action, hold down the sneak key before right-clicking.").."\n\n"..

S("Blocks can almost always be built at pointable blocks. One exception are blocks attached to the floor; these can only be built on the floor.").."\n\n"..

S("Normally, blocks are built in front of the pointed side of the pointed block. A few blocks are different: When you try to build at them, they are replaced."),
		images = {{image="doc_basics_build.png"}},
}})



doc.add_entry("basics", "liquids", {
	name = S("Liquids"),
	data = {
		text =
S("Liquids are special dynamic blocks. Liquids like to spread and flow to their surrounding blocks. Players can swim and drown in them.").."\n\n"..

S("Liquids usually come in two forms: In source form (S) and in flowing form (F).").."\n"..
S("Liquid sources have the shape of a full cube. A liquid source will generate flowing liquids around it from time to time, and, if the liquid is renewable, it also generates liquid sources. A liquid source can sustain itself. A long it is left alone, a liquid source will normally keep its place and does not drain out.").."\n"..
S("Flowing liquids take a sloped form. Flowing liquids spread around the world until they drain. A flowing liquid can not sustain itself and always comes from a liquid source, either directly or indirectly. Without a liquid source, a flowing liquid will eventually drain out and disappear.").."\n"..

S("All liquids share the following properties:").."\n"..
S("• All properties of blocks (including drowning damage").."\n"..
S("• Renewability: Renewable liquids can create new sources").."\n"..
S("• Flowing range: How many flowing liquids are created at maximum per liquid source, it determines how far the liquid will spread. Possible are ranges from 0 to 8. At 0, no flowing liquids will be created. Image 5 shows a liquid of flowing range 2").."\n"..
S("• Viscosity: How slow players move through it and how slow the liquid spreads").."\n\n"..

S("Renewable liquids create new liquid sources at open spaces (image 2). A new liquid source is created when:\
• Two renewable liquid blocks of the same type touch each other diagonally\
• These blocks are also on the same height\
• One of the two “corners” is open space which allows liquids to flow in").."\n\n"..

S("When those criteria are met, the open space is filled with a new liquid source of the same type (image 3).").."\n\n"..

S("Swimming in a liquid is fairly straightforward: The usual direction keys for basic movement, the jump key for rising and the sneak key for sinking.").."\n\n"..

S("The physics for swimming and diving in a liquid are:").."\n"..
S("• The higher the viscosity, the slower you move").."\n"..
S("• If you rest, you'll slowly sink").."\n"..
S("• There is no fall damage for falling into a liquid as such").."\n"..
S("• If you fall into a liquid, you will be slowed down on impact (but don't stop instantly). Your impact depth is determined by your speed and the liquid viscosity. For a safe high drop into a liquid, make sure there is enough liquid above the ground, otherwise you might hit the ground and take fall damage").."\n\n"..

S("Liquids are often not pointable. But some special items are able to point all liquids."),
		images = {
			{ image="doc_basics_liquids_types.png",
			  caption="A source liquid and its flowing liquids" },
			{ image="doc_basics_liquids_renewable_1.png",
			  caption="Renewable liquids need to be arranged like this to create a new source block" },
			{ image="doc_basics_liquids_renewable_2.png",
			  caption="A new liquid source is born" },
			{ image="doc_basics_liquids_nonrenewable.png",
			  caption="Non-renewable liquids creates a flowing liquid (F) instead" },
			{ image="doc_basics_liquids_range.png",
			  caption="Liquid with a flowing range of 2" },
		},
	},
})

doc.add_entry("basics", "craft", {
	name = S("Crafting"),
	data = {
		text =
S("Crafting is the task of combining several items to form a new item.").."\n\n"..

S("To craft something, you need one or more items, a crafting grid (C) and a crafting recipe. A crafting grid is like a normal inventory which can also be used for crafting. Items need to be put in a certain pattern into the crafting grid. Next to the crafting grid is an output slot (O). Here the result will appear when you placed items correctly. This is just a preview, not the actual item. Crafting grids can come in different sizes which limits the possible recipes you can craft.").."\n\n"..

S("To complete the craft, take the result item from the output slot, which will consume items from the crafting grid and creates a new item. It is not possible to place items into the output slot.").."\n\n"..

S("A description on how to craft an item is called a “crafting recipe”. You need this knowledge to craft. There are multiple ways to learn crafting recipes. One way is by using a crafting guide, which contains a list of available crafting recipes. Some subgames provide crafting guides. There are also some mods which you can download online for installing a crafting guide. Another way is by reading the online manual of the subgame (if one is available).").."\n\n"..

S("Crafting recipes consist of at least one input item and exactly one stack of output items. When performing a single craft, it will consume exactly one item from each stack of the crafting grid, unless the crafting recipe defines replacements.").."\n\n"..

S("There are multiple types of crafting recipes:\
\
• Shaped (image 2): Items need to be placed in a particular shape\
• Shapeless (images 3 and 4): Items need to be placed somewhere in input (both images show the same recipe)\
• Cooking: Explained in “Basics > Cooking”\
• Repairing (image 5): Place two damaged tools into the crafting grid anywhere to get a tool which is repaired by a certain percentage. This recipe may not be available in all subgames").."\n\n"..

S("In some crafting recipes, some input items do not need to be a concrete item, instead they need to be a member of a group (see “Basics > Groups”). These recipes offer a bit more freedom in the input items. Images 6-8 show the same group-based recipe. Here, 8 items of the “stone” group are required, which is true for all of the shown items.").."\n\n"..

S("Rarely, crafting recipes have replacements. This means, whenever you perform a craft, some items in the crafting grid will not be consumed, but instead will be replaced by another item."),
		images = {
			{image="doc_basics_craft_grid.png"}, {image="doc_basics_craft_shaped.png"},
			{image="doc_basics_craft_shapeless_1.png"}, {image="doc_basics_craft_shapeless_2.png"}, {image="doc_basics_craft_repair.png"},
			{image="doc_basics_craft_groups_1.png"}, {image="doc_basics_craft_groups_2.png"}, {image="doc_basics_craft_groups_3.png"},
		},
}})

doc.add_entry("basics", "cook", {
	name = S("Cooking"),
	data = {
		text =
S("Cooking (or smelting) is a form of crafting which does not involve a crafting grid. Cooking is done with a special block (like a furnace), an cookable item, a fuel item and time in order to yield a new item.").."\n\n"..

S("Each fuel item has a burning time. This is the time a single item of the fuel keeps a furnace burning.").."\n\n"..

S("Each cookable item requires time to be cooked. This time is specific to the item type and the item must be “on fire” for the whole cooking time to actually yield the result.")
}})

doc.add_entry("basics", "hotbar", {
	name = S("Hotbar"),
	data = {
		text =
S("At the bottom of the screen you see some squares. This is called the “hotbar”. The hotbar allows you to quickly access the first items from your player inventory.").."\n"..
S("You can change the selected item with the mouse wheel or the number keys.").."\n\n"..

S("• Select previous item in hotbar: [Mouse wheel up]").."\n"..
S("• Select next item in hotbar: [Mouse wheel down]").."\n"..
S("• Select item in hotbar directly: [0]-[9]").."\n\n"..

S("The selected item is also your wielded item."),
		images = {{image="doc_basics_hotbar.png"}, {image="doc_basics_hotbar_relations.png"}},
}})

doc.add_entry("basics", "minimap", {
	name = S("Minimap"),
	data = {
		text =
S("Press [F9] to make a minimap appear on the top right. The minimap helps you to find your way around the world. Press it again to select different minimap modes and zoom levels. The minimap also shows the positions of other players.").."\n\n"..

S("There are 2 minimap modes and 3 zoom levels.").."\n\n"..

S("Surface mode (image 1) is a top-down view of the world, roughly resembling the colors of the blocks this world is made of. It only shows the topmost blocks, everything below is hidden, like a satellite photo. Surface mode is useful if you got lost.").."\n\n"..

S("Radar mode (image 2) is more complicated. It displays the “denseness” of the area around you and changes with your height. Roughly, the more green an area is, the less “dense” it is. Black areas have many blocks. Use the radar to find caverns, hidden areas, walls and more. The rectangular shapes in image 2 clearly expose the position of a dungeon.").."\n\n"..

S("There are also two different rotation modes. In “square mode”, the rotation of the minimap is fixed. If you press [Shift]+[F9] to switch to “circle mode”, the minimap will instead rotate with your looking direction, so “up” is always your looking direction.").."\n\n"..

S("In some subgames, the minimap may be disabled.").."\n\n"..

S("• Toggle minimap mode: [F9]").."\n"..
S("• Toggle minimap rotation mode: [Shift]+[F9]"),
		images = {{image="doc_basics_minimap_map.png"}, {image="doc_basics_minimap_radar.png"}, {image="doc_basics_minimap_round.png"}},
}})

doc.add_entry("basics", "inventory", {
	name="Inventory",
	data = {
		text =
S("Inventories are used to store item stacks. There are other uses, such as crafting. An inventory consists of a rectangular grid of item slots. Each item slot can either be empty or hold one item stack. Item stacks can be moved freely between most slots.").."\n"..
S("You have your own inventory which is called your “player inventory”, you can open it with the inventory key (default: [I]). The first inventory slots are also used as slots in your hotbar.").."\n"..
S("Blocks can also have their own inventory, e.g. chests and furnaces.").."\n\n"..

S("Inventory controls:").."\n\n"..

S("Taking: You can take items from an occupied slot if the cursor holds nothing.").."\n"..
S("• Left click: take entire item stack").."\n"..
S("• Right click: take half from the item stack (rounded up)").."\n"..
S("• Middle click: take 10 items from the item stack").."\n\n"..

S("Putting: You can put items onto a slot if the cursor holds 1 or more items and the slot is either empty or contains an item stack of the same item type.").."\n"..
S("• Left click: put entire item stack").."\n"..
S("• Right click: put 1 item of the item stack").."\n"..
S("• Middle click: put 10 items of the item stack").."\n\n"..

S("Exchanging: You can exchange items if the cursor holds 1 or more items and the destination slot is occupied by a different item type.").."\n"..
S("• Click: exchange item stacks").."\n\n"..

S("Throwing away: If you hold an item stack and click with it somewhere outside the menu, the item stack gets thrown away into the environment.").."\n\n"..

S("Quick transfer: You can quickly transfer an item stack to/from the player inventory to/from another item's inventory slot like a furnace, chest, or any other item with an inventory slot when that item's inventory is accessed. The target inventory is generally the most relevant inventory in this context.").."\n"..
S("• Sneak+Left click: Automatically transfer item stack"),
		images = {{image="doc_basics_inventory.png"}}
}})

doc.add_entry("advanced", "online", {
	name = S("Online help"),
	data = { text=
S("You may want to check out these online resources related to Minetest:").."\n\n"..

S("Official homepage of Minetest: <http://minetest.net/>").."\n"..
S("The main place to find the most recent version of Minetest.").."\n\n"..

S("Community wiki: <http://wiki.minetest.net/>").."\n"..
S("A community-based documentation website for Minetest. Anyone with an account can edit it! It also features a documentation of Minetest Game.").."\n\n"..

S("Web forums: <http://forums.minetest.net/>").."\n"..
S("A web-based discussion platform where you can discuss everything related to Minetest. This is also a place where player-made mods and subgames are published and discussed. The discussions are mainly in English, but there is also space for discussion in other languages.").."\n\n"..

S("Chat: <irc://irc.freenode.net#minetest>").."\n"..
S("A generic Internet Relay Chat channel for everything related to Minetest where people can meet to discuss in real-time. If you do not understand IRC, see the Community Wiki for help.")
}})

doc.add_entry("basics", "groups", {
	name = S("Groups"),
	data = {
		text =
S("Items, players and objects (animate and inanimate) can be members of any number of groups. Groups serve multiple purposes:").."\n\n"..

S("• Crafting recipes: Slots in a crafting recipe may not require a specific item, but instead an item which is a member of a particular group, or multiple groups").."\n"..
S("• Digging times: Diggable blocks belong to groups which are used to determine digging times. Mining tools are capable of digging blocks belonging to certain groups").."\n"..
S("• Block behavior: Blocks may show a special behaviour and interact with other blocks when they belong to a particular group").."\n"..
S("• Damage and armor: Objects and players have armor groups, weapons have damage groups. These groups determine damage. See also: “Basics > Weapons”").."\n"..
S("• Other uses").."\n\n"..

S("In the item help, many important groups are usually mentioned and explained.")
}})

doc.add_entry("basics", "glossary", {
	name = S("Glossary"),
	data = {
		text =
S("This is a list of commonly used terms in Minetest:").."\n\n"..

S("Controls:").."\n"..
S("• Wielding: Holding an item in hand").."\n"..
S("• Pointing: Looking with the crosshair at something in range").."\n"..
S("• Dropping: Throwing an item or item stack to the ground").."\n"..
S("• Punching: Attacking with left-click, is also used on blocks").."\n"..
S("• Sneaking: Walking slowly while (usually) avoiding to fall over edges").."\n"..
S("• Climbing: Moving up or down a climbable block").."\n\n"..

S("Blocks:").."\n"..
S("• Block: Cubes that the worlds are made of").."\n"..
S("• Mining/digging: Using a mining tool to break a block").."\n"..
S("• Building/placing: Putting a block somewhere").."\n"..
S("• Drop: Items you get after mining a block").."\n"..
S("• Using a block: Right-clicking a block to access its special function").."\n\n"..

S("Items:").."\n"..
S("• Item: A single thing that players can possess").."\n"..
S("• Item stack: A collection of items of the same kind").."\n"..
S("• Maximum stack size: Maximum amount of items in an item stack").."\n"..
S("• Slot / inventory slot: Can hold one item stack").."\n"..
S("• Inventory: Provides several inventory slots for storage").."\n"..
S("• Player inventory: The main inventory of a player").."\n"..
S("• Tool: An item which you can use to do special things with when wielding").."\n"..
S("• Range: How far away things can be to be pointed by an item").."\n"..
S("• Mining tool: A tool which allows to break blocks").."\n"..
S("• Craftitem: An item which is (primarily or only) used for crafting").."\n\n"..

S("Gameplay:").."\n"..
S("• “heart”: A single health symbol, indicates 2 HP").."\n"..
S("• “bubble”: A single breath symbol, indicates 1 BP").."\n"..
S("• HP: Hit point (equals half 1 “heart”)").."\n"..
S("• BP: Breath point, indicates breath when diving").."\n"..
S("• Mob: Computer-controlled enemy").."\n"..
S("• Crafting: Combining multiple items to create new ones").."\n"..
S("• Crafting guide: A helper which shows available crafting recipes").."\n"..
S("• Spawning: Appearing in the world").."\n"..
S("• Respawning: Appearing again in the world after death").."\n"..
S("• Group: Puts similar things together, often affects gameplay").."\n"..
S("• noclip: Allows to fly through walls").."\n\n"..

S("Interface").."\n"..
S("• Hotbar: Inventory slots at the bottom").."\n"..
S("• Statbar: Indicator made out of half-symbols, used for health and breath").."\n"..
S("• Minimap: The map or radar at the top right").."\n"..
S("• Crosshair: Seen in the middle, used to point at things").."\n\n"..

S("Online multiplayer:").."\n"..
S("• PvP: Player vs Player. If active, players can deal damage to each other").."\n"..
S("• Griefing: Destroying the buildings of other players against their will").."\n"..
S("• Protection: Mechanism to own areas of the world, which only allows the owners to modify blocks inside").."\n\n"..

S("Technical terms:").."\n"..
S("• Minetest: This game engine").."\n"..
S("• Minetest Game: A subgame for Minetest by the Minetest developers").."\n"..
S("• Subgame: A complete playing experience to be used in Minetest; such as a game or sandbox or similar").."\n"..
S("• Mod: A single subsystem which adds or modifies functionality; is the basic building block of subgames and can be used to further enhance or modify them").."\n"..
S("• Privilege: Allows a player to do something").."\n"..
S("• Node: Other word for “block”")
}})

doc.add_entry("advanced", "settings", {
	name = S("Settings"),
	data = {
		text =
S("There is a large variety of settings to configure Minetest. Pretty much every aspect can be changed that way.").."\n\n"..

S("These are a few of the most important gameplay settings:").."\n\n"..

S("• Damage enabled (enable_damage): Enables the health and breath attributes for all players. If disabled, players are immortal").."\n"..
S("• Creative Mode (creative_mode): Enables sandbox-style gameplay focusing on creativity rather than a challenging gameplay. The meaning depends on the subgame; usual changes are: Reduced dig times, easy access to almost all items, tools never wear off, etc.").."\n"..
S("• PvP (enable_pvp): Short for “Player vs Player”. If enabled, players can deal damage to each other").."\n\n"..

S("For a full list of all available settings, use the “Advanced settings” dialog in the main menu.")
}})

doc.add_entry("advanced", "movement_modes", {
	name = S("Movement modes"),
	data = { text =
S("If you have the required privileges, you can use up to three special movement modes. Using these may be considered cheating.").."\n\n"..

S("Fast mode:").."\n"..
S("• Description: Allows you to move much faster. Hold down the the “Use” key [E] to move faster. In the client configuration, you can further customize fast mode.").."\n"..
S("• Default key: [J]").."\n"..
S("• Required privilege: fast").."\n\n"..

S("Fly mode:").."\n"..
S("• Description: Gravity doesn't affect you and you can move freely in all directions. Use the jump key to rise and the sneak key to sink.").."\n"..
S("• Default key: [K]").."\n"..
S("• Required privilege: fly").."\n\n"..

S("Noclip mode:").."\n"..
S("• Description: Allows you to move through walls. Only works when fly mode is enabled, too.").."\n"..
S("• Default key: [H]").."\n"..
S("• Required privilege: noclip")
}})

doc.add_entry("advanced", "console", {
	name = S("Console"),
	data = { text =
S("With [F10] you can open and close the console. The main use of the console is to show the chat log and enter chat messages or server commands.").."\n"..
S("Using the chat or server command key also opens the console, but it is smaller and will be closed after you sent a message.").."\n\n"..

S("Use the chat to communicate with other players. This requires you to have the “shout” privilege.").."\n"..
S("Just type in the message and hit [Enter]. Public chat messages can not begin with “/”.").."\n\n"..

S("You can send private messages: Say “/msg <player> <message>” in chat to send “<message>” which can only be seen by <player>.").."\n\n"..

S("There are some special controls for the console:").."\n\n"..

S("• [F10] Open/close console").."\n"..
S("• [Enter]: Send message or command").."\n"..
S("• [Tab]: Try to auto-complete a partially-entered player name").."\n"..
S("• [Ctrl]+[Left]: Move cursor to the beginning of the previous word").."\n"..
S("• [Ctrl]+[Right]: Move cursor to the beginning of the next word").."\n"..
S("• [Ctrl]+[Backspace]: Delete previous word").."\n"..
S("• [Ctrl]+[Delete]: Delete next word").."\n"..
S("• [Ctrl]+[U]: Delete all text before the cursor").."\n"..
S("• [Ctrl]+[K]: Delete all text after the cursor").."\n"..
S("• [Page up]: Scroll up").."\n"..
S("• [Page down]: Scroll down").."\n"..

S("There is also an input history. Minetest saves your previous console inputs which you can quickly access later:").."\n\n"..

S("• [Up]: Go to previous entry in history").."\n"..
S("• [Down]: Go to next entry in history")
}})

doc.add_entry("advanced", "commands", {
	name = S("Server commands"),
	data = { text =
S("Server commands (also called “chat commands”) are little helpers for advanced users. You don't need to use these commands when playing. But they might come in handy to perform some more technical tasks. Server commands work both in multi-player and single-player mode.").."\n\n"..

S("Server commands can be entered by players using the chat to perform a special server action. There are a few commands which can be issued by everyone, but some commands only work if you have certain privileges granted on the server. There is a small set of basic commands which are always available, other commands can be added by mods.").."\n\n"..

S("To issue a command, simply type it like a chat message or press Minetest's command key (default: [/]). All commands have to begin with “/”, for example “/mods”. The Minetest command key does the same as the chat key, except that the slash is already entered.").."\n"..
S("Commands may or may not give a response in the chat log, but errors will generally be shown in the chat. Try it for yourselves: Close this window and type in the “/mods” command. This will give you the list of available mods on this server.").."\n\n"..

S("“/help all” is a very important command: You get a list of all available commands on the server, a short explanation and the allowed parameters. This command is also important because the available commands often differ per server.").."\n\n"..

S("Commands are followed by zero or more parameters.").."\n\n"..

S("In the command reference, you see some placeholders which you need to replace with an actual value. Here's an explanation:").."\n\n"..

S("• Text in greater-than and lower-than signs (e.g. “<param>”): Placeholder for a parameter").."\n"..
S("• Anything in square brackets (e.g. “[text]”) is optional and can be omitted").."\n"..
S("• Pipe or slash (e.g. “text1 | text2 | text3”): Alternation. One of multiple texts must be used (e.g. “text2”)").."\n"..
S("• Parenthesis: (e.g. “(word1 word2) | word3”): Groups multiple words together, used for alternations").."\n"..
S("• Everything else is to be read as literal text").."\n\n"..

S("Here are some examples to illustrate the command syntax:").."\n\n"..

S("• /mods: No parameters. Just enter “/mods”").."\n"..
S("• /me <action>: 1 parameter. You have to enter “/me ” followed by any text, e.g. “/me orders pizza”").."\n"..
S("• /give <name> <ItemString>: Two parameters. Example: “/give Player default:apple”").."\n"..
S("• /help [all|privs|<cmd>]: Valid inputs are “/help”, “/help all”, “/help privs”, or “/help ” followed by a command name, like “/help time”").."\n"..
S("• /spawnentity <EntityName> [<X>,<Y>,<Z>]: Valid inputs include “/spawnentity boats:boat” and “/spawnentity boats:boat 0,0,0”").."\n\n\n"..



S("Some final remarks:").."\n\n"..

S("• For /give and /giveme, you need an itemstring. This is an internally used unique item identifier which you may find in the item help if you have the “give” or “debug” privilege").."\n"..
S("• For /spawnentity you need an entity name, which is another identifier")
}})

doc.add_entry("advanced", "privs", {
	name = S("Privileges"),
	data = { text =
S("Each player has a set of privileges, which differs from server to server. Your privileges determine what you can and can't do. Privileges can be granted and revoked from other players by any player who has the privilege called “privs”.").."\n\n"..

S("On a multiplayer server with the default configuration, new players start with the privileges called “interact” and “shout”. The “interact” privilege is required for the most basic gameplay actions such as building, mining, using, etc. The “shout” privilege allows to chat.").."\n\n"..

S("There is a small set of core privileges which you'll find on every server, other privileges might be added by mods.").."\n\n"..

S("To view your own privileges, issue the server command “/privs”.").."\n\n"..

S("Here are a few basic privilege-related commands:").."\n\n"..

S("• /privs: Lists your privileges").."\n"..
S("• /privs <player>: Lists the privileges of <player>").."\n"..
S("• /help privs: Shows a list and description about all privileges").."\n\n"..

S("Players with the “privs” privilege can modify privileges at will:").."\n\n"..

S("• /grant <player> <privilege>: Grant <privilege> to <player>").."\n"..
S("• /revoke <player> <privilege>: Revoke <privilege> from <player>").."\n\n"..

S("In single-player mode, you can use “/grant singleplayer all” to unlock all abilities (which is often considered cheating).")
}})

doc.add_entry("basics", "light", {
	name = S("Light"),
	data = { text =
S("As the world is entirely block-based, so is the light in the world. Each block has its own brightness. The brightness of a block is expressed in a “light level” which ranges from 0 (total darkness) to 15 (as bright as the sun).").."\n\n"..

S("There are two types of light: Sunlight and artificial light.").."\n\n"..

S("Artificial light is emitted by luminous blocks. Artificial light has a light level from 1-14.").."\n"..
S("Sunlight is the brightest light and always goes perfectly straight down from the sky at each time of the day. blocks. At night, the sunlight will become moonlight instead, which still provides a small amount of light. The light level of sunlight is 15.").."\n\n"..

S("Blocks have 3 levels of transparency:").."\n\n"..

S("• Transparent: Sunlight goes through limitless, artificial light goes through with losses").."\n"..
S("• Semi-transparent: Sunlight and artificial light go through with losses").."\n"..
S("• Opaque: No light passes through").."\n\n"..

S("Artificial light will lose one level of brightness for each transparent or semi-transparent block it passes through, until only darkness remains (image 1).").."\n"..
S("Sunlight will preserve its brightness as long it only passes fully transparent blocks. When it passes through a semi-transparent block, it turns to artificial light. Image 2 shows the difference.").."\n\n"..

S("Note that “transparency” here only means that the block is able to carry brightness from its neighboring blocks. It is possible for a block to be transparent to light but you can't see trough the other side."),
		images = {{image="doc_basics_light_torch.png"}, {image="doc_basics_light_test.png"}}
}})

doc.add_entry("advanced", "coordinates", {
	name = S("Coordinates"),
	data = { text =
S("The Minetest world is a large cube. And because of this, a position in the world can be easily expressed with Cartesian coordinates. That is, for each position in the world, there are 3 values X, Y and Z.").."\n\n"..

S("Like this: (5, 45, -12)").."\n\n"..

S("This refers to the position where X=5, Y=45 and Z=-12. The 3 letters are called “axes”: Y is for the height. X and Z are for the horizontal position.").."\n\n"..

S("The values for X, Y and Z work like this:").."\n\n"..

S("• If you go up, Y increases").."\n"..
S("• If you go down, Y decreases").."\n"..
S("• If you follow the sun, X increases").."\n"..
S("• If you go to the reverse direction, X decreases").."\n"..
S("• Follow the sun, then go right: Z increases").."\n"..
S("• Follow the sun, then go left: Z decreases").."\n"..
S("• The side length of a full cube is 1").."\n\n"..

S("You can view your current position in the debug screen (open with [F5]). This is considered cheating in some games.")
}})
