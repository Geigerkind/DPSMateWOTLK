--[[
Name: Babble-Boss-2.2
Revision: $Rev: 17545 $
Author(s): ckknight (ckknight@gmail.com)
Website: http://ckknight.wowinterface.com/
Documentation: http://wiki.wowace.com/index.php/Babble-Boss-2.2
SVN: http://svn.wowace.com/root/trunk/Babble-2.2/Babble-Boss-2.2
Description: A library to provide localizations for bosses.
Dependencies: AceLibrary, AceLocale-2.2
]]

local MAJOR_VERSION = "DPSBabble-Boss-2.3"
local MINOR_VERSION = tonumber(string.sub("$Revision: 17545 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end

if not AceLibrary:HasInstance("AceLocale-2.3") then error(MAJOR_VERSION .. " requires AceLocale-2.3") end

local _, x = AceLibrary("AceLocale-2.3"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleBoss = AceLibrary("AceLocale-2.3"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleBoss:EnableDebugging()

local bosses = {
	--Ahn'Qiraj
	["Anubisath Defender"] = true,
	["Battleguard Sartura"] = true,
	["C'Thun"] = true,
	["Emperor Vek'lor"] = true,
	["Emperor Vek'nilash"] = true,
	["Eye of C'Thun"] = true,
	["Fankriss the Unyielding"] = true,
	["Lord Kri"] = true,
	["Ouro"] = true,
	["Princess Huhuran"] = true,
	["Princess Yauj"] = true,
	["The Bug Family"] = true,
	["The Prophet Skeram"] = true,
	["The Twin Emperors"] = true,
	["Vem"] = true,
	["Viscidus"] = true,

--Auchindoun
--Auchenai Crypts
	["Exarch Maladaar"] = true,
	["Shirrak the Dead Watcher"] = true,
--Mana-Tombs
	["Nexus-Prince Shaffar"] = true,
	["Pandemonius"] = true,
	["Tavarok"] = true,
--Shadow Labyrinth
	["Ambassador Hellmaw"] = true,
	["Blackheart the Inciter"] = true,
	["Grandmaster Vorpil"] = true,
	["Murmur"] = true,
--Sethekk Halls
	["Anzu"] = true,
	["Darkweaver Syth"] = true,
	["Talon King Ikiss"] = true,

--Blackfathom Deeps
	["Aku'mai"] = true,
	["Baron Aquanis"] = true,
	["Gelihast"] = true,
	["Ghamoo-ra"] = true,
	["Lady Sarevess"] = true,
	["Old Serra'kis"] = true,
	["Twilight Lord Kelris"] = true,

--Blackrock Depths
	["Ambassador Flamelash"] = true,
	["Anger'rel"] = true,
	["Anub'shiah"] = true,
	["Bael'Gar"] = true,
	["Chest of The Seven"] = true,
	["Doom'rel"] = true,
	["Dope'rel"] = true,
	["Emperor Dagran Thaurissan"] = true,
	["Eviscerator"] = true,
	["Fineous Darkvire"] = true,
	["General Angerforge"] = true,
	["Gloom'rel"] = true,
	["Golem Lord Argelmach"] = true,
	["Gorosh the Dervish"] = true,
	["Grizzle"] = true,
	["Hate'rel"] = true,
	["Hedrum the Creeper"] = true,
	["High Interrogator Gerstahn"] = true,
	["High Priestess of Thaurissan"] = true,
	["Houndmaster Grebmar"] = true,
	["Hurley Blackbreath"] = true,
	["Lord Incendius"] = true,
	["Lord Roccor"] = true,
	["Magmus"] = true,
	["Ok'thor the Breaker"] = true,
	["Panzor the Invincible"] = true,
	["Phalanx"] = true,
	["Plugger Spazzring"] = true,
	["Princess Moira Bronzebeard"] = true,
	["Pyromancer Loregrain"] = true,
	["Ribbly Screwspigot"] = true,
	["Seeth'rel"] = true,
	["The Seven Dwarves"] = true,
	["Verek"] = true,
	["Vile'rel"] = true,
	["Warder Stilgiss"] = true,

--Blackrock Spire
--Lower
	["Bannok Grimaxe"] = true,
	["Burning Felguard"] = true,
	["Crystal Fang"] = true,
	["Ghok Bashguud"] = true,
	["Gizrul the Slavener"] = true,
	["Halycon"] = true,
	["Highlord Omokk"] = true,
	["Mor Grayhoof"] = true,
	["Mother Smolderweb"] = true,
	["Overlord Wyrmthalak"] = true,
	["Quartermaster Zigris"] = true,
	["Shadow Hunter Vosh'gajin"] = true,
	["Spirestone Battle Lord"] = true,
	["Spirestone Butcher"] = true,
	["Spirestone Lord Magus"] = true,
	["Urok Doomhowl"] = true,
	["War Master Voone"] = true,
--Upper
	["General Drakkisath"] = true,
	["Goraluk Anvilcrack"] = true,
	["Gyth"] = true,
	["Jed Runewatcher"] = true,
	["Lord Valthalak"] = true,
	["Pyroguard Emberseer"] = true,
	["Solakar Flamewreath"] = true,
	["The Beast"] = true,
	["Warchief Rend Blackhand"] = true,

--Blackwing Lair
	["Broodlord Lashlayer"] = true,
	["Chromaggus"] = true,
	["Ebonroc"] = true,
	["Firemaw"] = true,
	["Flamegor"] = true,
	["Grethok the Controller"] = true,
	["Lord Victor Nefarius"] = true,
	["Nefarian"] = true,
	["Razorgore the Untamed"] = true,
	["Vaelastrasz the Corrupt"] = true,

--Black Temple
	["Essence of Anger"] = true,
	["Essence of Desire"] = true,
	["Essence of Suffering"] = true,
	["Gathios the Shatterer"] = true,
	["Gurtogg Bloodboil"] = true,
	["High Nethermancer Zerevor"] = true,
	["High Warlord Naj'entus"] = true,
	["Illidan Stormrage"] = true,
	["Illidari Council"] = true,
	["Lady Malande"] = true,
	["Mother Shahraz"] = true,
	["Reliquary of Souls"] = true,
	["Shade of Akama"] = true,
	["Supremus"] = true,
	["Teron Gorefiend"] = true,
	["The Illidari Council"] = true,
	["Veras Darkshadow"] = true,

--Borean Tundra
--The Eye of Eternity
	["Malygos"] = true,
--The Nexus
	["Anomalus"] = true,
	["Grand Magus Telestra"] = true,
	["Keristrasza"] = true,
	["Ormorok the Tree-Shaper"] = true,
--The Oculus
	["Drakos the Interrogator"] = true,
	["Ley-Guardian Eregos"] = true,
	["Mage-Lord Urom"] = true,
	["Varos Cloudstrider"] = true,

--Caverns of Time
--Old Hillsbrad Foothills
	["Captain Skarloc"] = true,
	["Epoch Hunter"] = true,
	["Lieutenant Drake"] = true,
--The Culling of Stratholme
	["Meathook"] = true,
	["Chrono-Lord Epoch"] = true,
	["Mal'Ganis"] = true,
	["Salramm the Fleshcrafter"] = true,
--The Black Morass
	["Aeonus"] = true,
	["Chrono Lord Deja"] = true,
	["Medivh"] = true,
	["Temporus"] = true,

--Chamber of Aspects
--The Obsidian Sanctum
	["Sartharion"] = true,
	["Shadron"] = true,
	["Tenebron"] = true,
	["Vesperon"] = true,

--Coilfang Reservoir
--Serpentshrine Cavern
	["Coilfang Elite"] = true,
	["Coilfang Strider"] = true,
	["Fathom-Lord Karathress"] = true,
	["Hydross the Unstable"] = true,
	["Lady Vashj"] = true,
	["Leotheras the Blind"] = true,
	["Morogrim Tidewalker"] = true,
	["Pure Spawn of Hydross"] = true,
	["Shadow of Leotheras"] = true,
	["Tainted Spawn of Hydross"] = true,
	["The Lurker Below"] = true,
	["Tidewalker Lurker"] = true,
--The Slave Pens
	["Mennu the Betrayer"] = true,
	["Quagmirran"] = true,
	["Rokmar the Crackler"] = true,
	["Ahune"] = true,
--The Steamvault
	["Hydromancer Thespia"] = true,
	["Mekgineer Steamrigger"] = true,
	["Warlord Kalithresh"] = true,
--The Underbog
	["Claw"] = true,
	["Ghaz'an"] = true,
	["Hungarfen"] = true,
	["Overseer Tidewrath"] = true,
	["Swamplord Musel'ek"] = true,
	["The Black Stalker"] = true,

--Dire Maul
--Arena
	["Mushgog"] = true,
	["Skarr the Unbreakable"] = true,
	["The Razza"] = true,
--East
	["Alzzin the Wildshaper"] = true,
	["Hydrospawn"] = true,
	["Isalien"] = true,
	["Lethtendris"] = true,
	["Pimgib"] = true,
	["Pusillin"] = true,
	["Zevrim Thornhoof"] = true,
--North
	["Captain Kromcrush"] = true,
	["Cho'Rush the Observer"] = true,
	["Guard Fengus"] = true,
	["Guard Mol'dar"] = true,
	["Guard Slip'kik"] = true,
	["King Gordok"] = true,
	["Knot Thimblejack's Cache"] = true,
	["Stomper Kreeg"] = true,
--West
	["Illyanna Ravenoak"] = true,
	["Immol'thar"] = true,
	["Lord Hel'nurath"] = true,
	["Magister Kalendris"] = true,
	["Prince Tortheldrin"] = true,
	["Tendris Warpwood"] = true,
	["Tsu'zee"] = true,

--Dragonblight
-- Ahn'kahet: The Old Kingdom
	["Elder Nadox"] = true,
	["Herald Volazj"]=  true,
	["Jedoga Shadowseeker"] = true,
	["Prince Taldaram"] = true,
--Azjol-Nerub
	["Anub'arak"] = true,
	["Hadronox"] = true,
	["Krik'thir the Gatewatcher"] = true,

--Gnomeregan
	["Crowd Pummeler 9-60"] = true,
	["Dark Iron Ambassador"] = true,
	["Electrocutioner 6000"] = true,
	["Grubbis"] = true,
	["Mekgineer Thermaplugg"] = true,
	["Techbot"] = true,
	["Viscous Fallout"] = true,

--Grizzly Hills
--Drak'Tharon Keep
	["King Dred"] = true,
	["Novos the Summoner"] = true,
	["The Prophet Tharon'ja"] = true,
	["Trollgore"] = true,

--Gruul's Lair
	["Blindeye the Seer"] = true,
	["Gruul the Dragonkiller"] = true,
	["High King Maulgar"] = true,
	["Kiggler the Crazed"] = true,
	["Krosh Firehand"] = true,
	["Olm the Summoner"] = true,

--Hellfire Citadel
--Hellfire Ramparts
	["Nazan"] = true,
	["Omor the Unscarred"] = true,
	["Vazruden the Herald"] = true,
	["Vazruden"] = true,
	["Watchkeeper Gargolmar"] = true,
--Magtheridon's Lair
	["Hellfire Channeler"] = true,
	["Magtheridon"] = true,
--The Blood Furnace
	["Broggok"] = true,
	["Keli'dan the Breaker"] = true,
	["The Maker"] = true,
--The Shattered Halls
	["Blood Guard Porung"] = true,
	["Grand Warlock Nethekurse"] = true,
	["Warbringer O'mrogg"] = true,
	["Warchief Kargath Bladefist"] = true,

--Howling Fjord
--Utgarde Keep
	["Constructor & Controller"] = true, --these are one encounter, so we do this as an encounter name
	["Dalronn the Controller"] = true,
	["Ingvar the Plunderer"] = true,
	["Prince Keleseth"] = true,
	["Skarvald the Constructor"] = true,
--Utgarde Pinnacle
	["Skadi the Ruthless"] = true,
	["King Ymiron"] = true,
	["Svala Sorrowgrave"] = true,
	["Gortok Palehoof"] = true,

--Hyjal Summit
	["Anetheron"] = true,
	["Archimonde"] = true,
	["Azgalor"] = true,
	["Kaz'rogal"] = true,
	["Rage Winterchill"] = true,

--Karazhan
	["Arcane Watchman"] = true,
	["Attumen the Huntsman"] = true,
	["Chess Event"] = true,
	["Dorothee"] = true,
	["Dust Covered Chest"] = true,
	["Grandmother"] = true,
	["Hyakiss the Lurker"] = true,
	["Julianne"] = true,
	["Kil'rek"] = true,
	["King Llane Piece"] = true,
	["Maiden of Virtue"] = true,
	["Midnight"] = true,
	["Moroes"] = true,
	["Netherspite"] = true,
	["Nightbane"] = true,
	["Prince Malchezaar"] = true,
	["Restless Skeleton"] = true,
	["Roar"] = true,
	["Rokad the Ravager"] = true,
	["Romulo & Julianne"] = true,
	["Romulo"] = true,
	["Shade of Aran"] = true,
	["Shadikith the Glider"] = true,
	["Strawman"] = true,
	["Terestian Illhoof"] = true,
	["The Big Bad Wolf"] = true,
	["The Crone"] = true,
	["The Curator"] = true,
	["Tinhead"] = true,
	["Tito"] = true,
	["Warchief Blackhand Piece"] = true,

-- Magisters' Terrace
	--["Kael'thas Sunstrider"] = true,
	["Priestess Delrissa"] = true,
	["Selin Fireheart"] = true,
	["Vexallus"] = true,

--Maraudon
	["Celebras the Cursed"] = true,
	["Gelk"] = true,
	["Kolk"] = true,
	["Landslide"] = true,
	["Lord Vyletongue"] = true,
	["Magra"] = true,
	["Maraudos"] = true,
	["Meshlok the Harvester"] = true,
	["Noxxion"] = true,
	["Princess Theradras"] = true,
	["Razorlash"] = true,
	["Rotgrip"] = true,
	["Tinkerer Gizlock"] = true,
	["Veng"] = true,

--Molten Core
	["Baron Geddon"] = true,
	["Cache of the Firelord"] = true,
	["Garr"] = true,
	["Gehennas"] = true,
	["Golemagg the Incinerator"] = true,
	["Lucifron"] = true,
	["Magmadar"] = true,
	["Majordomo Executus"] = true,
	["Ragnaros"] = true,
	["Shazzrah"] = true,
	["Sulfuron Harbinger"] = true,

--Naxxramas
	["Anub'Rekhan"] = true,
	["Deathknight Understudy"] = true,
	["Feugen"] = true,
	["Four Horsemen Chest"] = true,
	["Gluth"] = true,
	["Gothik the Harvester"] = true,
	["Grand Widow Faerlina"] = true,
	["Grobbulus"] = true,
	["Heigan the Unclean"] = true,
	["Highlord Mograine"] = true,
	["Instructor Razuvious"] = true,
	["Kel'Thuzad"] = true,
	["Lady Blaumeux"] = true,
	["Loatheb"] = true,
	["Maexxna"] = true,
	["Noth the Plaguebringer"] = true,
	["Patchwerk"] = true,
	["Sapphiron"] = true,
	["Sir Zeliek"] = true,
	["Stalagg"] = true,
	["Thaddius"] = true,
	["Thane Korth'azz"] = true,
	["The Four Horsemen"] = true,

--Onyxia's Lair
	["Onyxia"] = true,

--Ragefire Chasm
	["Bazzalan"] = true,
	["Jergosh the Invoker"] = true,
	["Maur Grimtotem"] = true,
	["Taragaman the Hungerer"] = true,

--Razorfen Downs
	["Amnennar the Coldbringer"] = true,
	["Glutton"] = true,
	["Mordresh Fire Eye"] = true,
	["Plaguemaw the Rotting"] = true,
	["Ragglesnout"] = true,
	["Tuten'kash"] = true,

--Razorfen Kraul
	["Agathelos the Raging"] = true,
	["Blind Hunter"] = true,
	["Charlga Razorflank"] = true,
	["Death Speaker Jargba"] = true,
	["Earthcaller Halmgar"] = true,
	["Overlord Ramtusk"] = true,

--Ruins of Ahn'Qiraj
	["Anubisath Guardian"] = true,
	["Ayamiss the Hunter"] = true,
	["Buru the Gorger"] = true,
	["General Rajaxx"] = true,
	["Kurinnaxx"] = true,
	["Lieutenant General Andorov"] = true,
	["Moam"] = true,
	["Ossirian the Unscarred"] = true,

--Scarlet Monastery
--Armory
	["Herod"] = true,
--Cathedral
	["High Inquisitor Fairbanks"] = true,
	["High Inquisitor Whitemane"] = true,
	["Scarlet Commander Mograine"] = true,
--Graveyard
	["Azshir the Sleepless"] = true,
	["Bloodmage Thalnos"] = true,
	["Fallen Champion"] = true,
	["Interrogator Vishas"] = true,
	["Ironspine"] = true,
	["Headless Horseman"] = true,
--Library
	["Arcanist Doan"] = true,
	["Houndmaster Loksey"] = true,

--Scholomance
	["Blood Steward of Kirtonos"] = true,
	["Darkmaster Gandling"] = true,
	["Death Knight Darkreaver"] = true,
	["Doctor Theolen Krastinov"] = true,
	["Instructor Malicia"] = true,
	["Jandice Barov"] = true,
	["Kirtonos the Herald"] = true,
	["Kormok"] = true,
	["Lady Illucia Barov"] = true,
	["Lord Alexei Barov"] = true,
	["Lorekeeper Polkelt"] = true,
	["Marduk Blackpool"] = true,
	["Ras Frostwhisper"] = true,
	["Rattlegore"] = true,
	["The Ravenian"] = true,
	["Vectus"] = true,

--Shadowfang Keep
	["Archmage Arugal"] = true,
	["Arugal's Voidwalker"] = true,
	["Baron Silverlaine"] = true,
	["Commander Springvale"] = true,
	["Deathsworn Captain"] = true,
	["Fenrus the Devourer"] = true,
	["Odo the Blindwatcher"] = true,
	["Razorclaw the Butcher"] = true,
	["Wolf Master Nandos"] = true,

--Stratholme
	["Archivist Galford"] = true,
	["Balnazzar"] = true,
	["Baron Rivendare"] = true,
	["Baroness Anastari"] = true,
	["Black Guard Swordsmith"] = true,
	["Cannon Master Willey"] = true,
	["Crimson Hammersmith"] = true,
	["Fras Siabi"] = true,
	["Hearthsinger Forresten"] = true,
	["Magistrate Barthilas"] = true,
	["Maleki the Pallid"] = true,
	["Nerub'enkan"] = true,
	["Postmaster Malown"] = true,
	["Ramstein the Gorger"] = true,
	["Skul"] = true,
	["Stonespine"] = true,
	["The Unforgiven"] = true,
	["Timmy the Cruel"] = true,

--Sunwell Plateau
	["Kalecgos"] = true,
	["Sathrovarr the Corruptor"] = true,
	["Brutallus"] = true,
	["Felmyst"] = true,
	["Kil'jaeden"] = true,
	["M'uru"] = true,
	["Entropius"] = true,
	["The Eredar Twins"] = true,
	["Lady Sacrolash"] = true,
	["Grand Warlock Alythess"] = true,

--Tempest Keep
--The Arcatraz
	["Dalliah the Doomsayer"] = true,
	["Harbinger Skyriss"] = true,
	["Warden Mellichar"] = true,
	["Wrath-Scryer Soccothrates"] = true,
	["Zereketh the Unbound"] = true,
--The Botanica
	["Commander Sarannis"] = true,
	["High Botanist Freywinn"] = true,
	["Laj"] = true,
	["Thorngrin the Tender"] = true,
	["Warp Splinter"] = true,
--The Eye
	["Al'ar"] = true,
	["Cosmic Infuser"] = true,
	["Devastation"] = true,
	["Grand Astromancer Capernian"] = true,
	["High Astromancer Solarian"] = true,
	["Infinity Blades"] = true,
	["Kael'thas Sunstrider"] = true,
	["Lord Sanguinar"] = true,
	["Master Engineer Telonicus"] = true,
	["Netherstrand Longbow"] = true,
	["Phaseshift Bulwark"] = true,
	["Solarium Agent"] = true,
	["Solarium Priest"] = true,
	["Staff of Disintegration"] = true,
	["Thaladred the Darkener"] = true,
	["Void Reaver"] = true,
	["Warp Slicer"] = true,
--The Mechanar
	["Gatewatcher Gyro-Kill"] = true,
	["Gatewatcher Iron-Hand"] = true,
	["Mechano-Lord Capacitus"] = true,
	["Nethermancer Sepethrea"] = true,
	["Pathaleon the Calculator"] = true,

--The Deadmines
	["Brainwashed Noble"] = true,
	["Captain Greenskin"] = true,
	["Cookie"] = true,
	["Edwin VanCleef"] = true,
	["Foreman Thistlenettle"] = true,
	["Gilnid"] = true,
	["Marisa du'Paige"] = true,
	["Miner Johnson"] = true,
	["Mr. Smite"] = true,
	["Rhahk'Zor"] = true,
	["Sneed"] = true,
	["Sneed's Shredder"] = true,

--The Stockade
	["Bazil Thredd"] = true,
	["Bruegal Ironknuckle"] = true,
	["Dextren Ward"] = true,
	["Hamhock"] = true,
	["Kam Deepfury"] = true,
	["Targorr the Dread"] = true,

--The Temple of Atal'Hakkar
	["Atal'alarion"] = true,
	["Avatar of Hakkar"] = true,
	["Dreamscythe"] = true,
	["Gasher"] = true,
	["Hazzas"] = true,
	["Hukku"] = true,
	["Jade"] = true,
	["Jammal'an the Prophet"] = true,
	["Kazkaz the Unholy"] = true,
	["Loro"] = true,
	["Mijan"] = true,
	["Morphaz"] = true,
	["Ogom the Wretched"] = true,
	["Shade of Eranikus"] = true,
	["Veyzhak the Cannibal"] = true,
	["Weaver"] = true,
	["Zekkis"] = true,
	["Zolo"] = true,
	["Zul'Lor"] = true,

--Uldaman
	["Ancient Stone Keeper"] = true,
	["Archaedas"] = true,
	["Baelog"] = true,
	["Digmaster Shovelphlange"] = true,
	["Galgann Firehammer"] = true,
	["Grimlok"] = true,
	["Ironaya"] = true,
	["Obsidian Sentinel"] = true,
	["Revelosh"] = true,

-- Ulduar
-- Halls of Lightning
	["General Bjarngrim"] = true,
	["Ionar"] = true,
	["Loken"] = true,
	["Volkhan"] = true,
-- Halls of Stone
	["Krystallus"] = true,
	["Maiden of Grief"] = true,
	["Sjonnir the Ironshaper"] = true,
	["The Tribunal of Ages"] = true,

-- The Violet Hold
	["Cyanigosa"] = true,
	["Erekem"] = true,
	["Ichoron"] = true,
	["Lavanthor"] = true,
	["Moragg"] = true,
	["Xevozz"] = true,
	["Zuramat the Obliterator"] = true,

--Wailing Caverns
	["Boahn"] = true,
	["Deviate Faerie Dragon"] = true,
	["Kresh"] = true,
	["Lady Anacondra"] = true,
	["Lord Cobrahn"] = true,
	["Lord Pythas"] = true,
	["Lord Serpentis"] = true,
	["Mad Magglish"] = true,
	["Mutanus the Devourer"] = true,
	["Skum"] = true,
	["Trigore the Lasher"] = true,
	["Verdan the Everliving"] = true,

--World Bosses
	["Avalanchion"] = true,
	["Azuregos"] = true,
	["Baron Charr"] = true,
	["Baron Kazum"] = true,
	["Doom Lord Kazzak"] = true,
	["Doomwalker"] = true,
	["Emeriss"] = true,
	["High Marshal Whirlaxis"] = true,
	["Lethon"] = true,
	["Lord Skwol"] = true,
	["Prince Skaldrenox"] = true,
	["Princess Tempestria"] = true,
	["Taerar"] = true,
	["The Windreaver"] = true,
	["Ysondre"] = true,

--Zul'Aman
	["Akil'zon"] = true,
	["Halazzi"] = true,
	["Jan'alai"] = true,
	["Malacrass"] = true,
	["Nalorakk"] = true,
	["Zul'jin"] = true,
	["Hex Lord Malacrass"] = true,

--Zul'Farrak
	["Antu'sul"] = true,
	["Chief Ukorz Sandscalp"] = true,
	["Dustwraith"] = true,
	["Gahz'rilla"] = true,
	["Hydromancer Velratha"] = true,
	["Murta Grimgut"] = true,
	["Nekrum Gutchewer"] = true,
	["Oro Eyegouge"] = true,
	["Ruuzlu"] = true,
	["Sandarr Dunereaver"] = true,
	["Sandfury Executioner"] = true,
	["Sergeant Bly"] = true,
	["Shadowpriest Sezz'ziz"] = true,
	["Theka the Martyr"] = true,
	["Witch Doctor Zum'rah"] = true,
	["Zerillis"] = true,
	["Zul'Farrak Dead Hero"] = true,

-- Zul'Drak
-- Gundrak
	["Eck the Ferocious"] = true,
	["Drakkari Colossus"] = true,
	["Gal'darah"] = true,
	["Moorabi"] = true,
	["Slad'ran"] = true,

--Zul'Gurub
	["Bloodlord Mandokir"] = true,
	["Gahz'ranka"] = true,
	["Gri'lek"] = true,
	["Hakkar"] = true,
	["Hazza'rah"] = true,
	["High Priest Thekal"] = true,
	["High Priest Venoxis"] = true,
	["High Priestess Arlokk"] = true,
	["High Priestess Jeklik"] = true,
	["High Priestess Mar'li"] = true,
	["Jin'do the Hexxer"] = true,
	["Renataki"] = true,
	["Wushoolay"] = true,

--Ring of Blood (where? an instance? should be in other file?)
	["Brokentoe"] = true,
	["Mogor"] = true,
	["Murkblood Twin"] = true,
	["Murkblood Twins"] = true,
	["Rokdar the Sundered Lord"] = true,
	["Skra'gath"] = true,
	["The Blue Brothers"] = true,
	["Warmaul Champion"] = true,
}

BabbleBoss:RegisterTranslations("deDE", function()
	return {
--Ahn'Qiraj
		["Anubisath Defender"] = "Verteidiger des Anubisath",
		["Battleguard Sartura"] = "Schlachtwache Sartura",
		["C'Thun"] = "C'Thun",
		["Emperor Vek'lor"] = "Imperator Vek'lor",
		["Emperor Vek'nilash"] = "Imperator Vek'nilash",
		["Eye of C'Thun"] = "Auge von C'Thun",
		["Fankriss the Unyielding"] = "Fankriss der Unnachgiebige",
		["Lord Kri"] = "Lord Kri",
		["Ouro"] = "Ouro",
		["Princess Huhuran"] = "Prinzessin Huhuran",
		["Princess Yauj"] = "Prinzessin Yauj",
		["The Bug Family"] = "Die Käferfamilie",
		["The Prophet Skeram"] = "Der Prophet Skeram",
		["The Twin Emperors"] = "Die Zwillings-Imperatoren",
		["Vem"] = "Vem",
		["Viscidus"] = "Viscidus",

--Auchindoun
--Auchenai Crypts
		["Exarch Maladaar"] = "Exarch Maladaar",
		["Shirrak the Dead Watcher"] = "Shirrak der Totenwächter",
--Mana-Tombs
		["Nexus-Prince Shaffar"] = "Nexusprinz Shaffar",
		["Pandemonius"] = "Pandemonius",
		["Tavarok"] = "Tavarok",
--Shadow Labyrinth
		["Ambassador Hellmaw"] = "Botschafter Höllenschlund",
		["Blackheart the Inciter"] = "Schwarzherz der Hetzer",
		["Grandmaster Vorpil"] = "Großmeister Vorpil",
		["Murmur"] = "Murmur",
--Sethekk Halls
		["Anzu"] = "Anzu",
		["Darkweaver Syth"] = "Dunkelwirker Syth",
		["Talon King Ikiss"] = "Klauenkönig Ikiss",

--Blackfathom Deeps
		["Aku'mai"] = "Aku'mai",
		["Baron Aquanis"] = "Baron Aquanis",
		["Gelihast"] = "Gelihast",
		["Ghamoo-ra"] = "Ghamoo-ra",
		["Lady Sarevess"] = "Lady Sarevess",
		["Old Serra'kis"] = "Old Serra'kis",
		["Twilight Lord Kelris"] = "Lord des Schattenhammers Kelris",

--Blackrock Depths
		["Ambassador Flamelash"] = "Botschafter Flammenschlag",
		["Anger'rel"] = "Anger'rel",
		["Anub'shiah"] = "Anub'shiah",
		["Bael'Gar"] = "Bael'Gar",
		["Chest of The Seven"] = "Truhe der Sieben",
		["Doom'rel"] = "Un'rel",
		["Dope'rel"] = "Trott'rel",
		["Emperor Dagran Thaurissan"] = "Imperator Dagran Thaurissan",
		["Eviscerator"] = "Ausweider",
		["Fineous Darkvire"] = "Fineous Dunkelader",
		["General Angerforge"] = "General Zornesschmied",
		["Gloom'rel"] = "Dunk'rel",
		["Golem Lord Argelmach"] = "Golemlord Argelmach",
		["Gorosh the Dervish"] = "Gorosh der Derwisch",
		["Grizzle"] = "Grizzle",
		["Hate'rel"] = "Hass'rel",
		["Hedrum the Creeper"] = "Hedrum der Krabbler",
		["High Interrogator Gerstahn"] = "Verhörmeisterin Gerstahn",
		["High Priestess of Thaurissan"] = "	Hohepriesterin von Thaurissan",
		["Houndmaster Grebmar"] = "Hundemeister Grebmar",
		["Hurley Blackbreath"] = "Hurley Pestatem",
		["Lord Incendius"] = "Lord Incendius",
		["Lord Roccor"] = "Lord Roccor",
		["Magmus"] = "Magmus",
		["Ok'thor the Breaker"] = "Ok'thor der Zerstörer",
		["Panzor the Invincible"] = "Panzor der Unbesiegbare",
		["Phalanx"] = "Phalanx",
		["Plugger Spazzring"] = "Stöpsel Zapfring",
		["Princess Moira Bronzebeard"] = "Prinzessin Moira Bronzebeard",
		["Pyromancer Loregrain"] = "Pyromant Weisenkorn",
		["Ribbly Screwspigot"] = "Ribbly Schraubstutz",
		["Seeth'rel"] = "Wut'rel",
		["The Seven Dwarves"] = "Die Sieben Zwerge",
		["Verek"] = "Verek",
		["Vile'rel"] = "Bös'rel",
		["Warder Stilgiss"] = "	Wärter Stilgiss",

--Blackrock Spire
--Lower
		["Bannok Grimaxe"] = "Bannok Grimmaxt",
		["Burning Felguard"] = "Brennende Teufelswache",
		["Crystal Fang"] = "Kristallfangzahn",
		["Ghok Bashguud"] = "Ghok Haudrauf",
		["Gizrul the Slavener"] = "Gizrul der Geifernde",
		["Halycon"] = "Halycon",
		["Highlord Omokk"] = "Hochlord Omokk",
		["Mor Grayhoof"] = "Mor Grauhuf",
		["Mother Smolderweb"] = "Mutter Glimmernetz",
		["Overlord Wyrmthalak"] = "Oberanführer Wyrmthalak",
		["Quartermaster Zigris"] = "Rüstmeister Zigris",
		["Shadow Hunter Vosh'gajin"] = "Schattenjägerin Vosh'gajin",
		["Spirestone Battle Lord"] = "Kampflord der Felsspitzoger",
		["Spirestone Butcher"] = "Metzger der Felsspitzoger",
		["Spirestone Lord Magus"] = "Maguslord der Felsspitzoger",
		["Urok Doomhowl"] = "Urok Schreckensbote",
		["War Master Voone"] = "Kriegsmeister Voone",
--Upper
		["General Drakkisath"] = "General Drakkisath",
		["Goraluk Anvilcrack"] = "Goraluk Hammerbruch",
		["Gyth"] = "Gyth",
		["Jed Runewatcher"] = "Jed Runenblick",
		["Lord Valthalak"] = "Lord Valthalak",
		["Pyroguard Emberseer"] = "Feuerwache Glutseher",
		["Solakar Flamewreath"] = "Solakar Feuerkrone",
		["The Beast"] = "Die Bestie",
		["Warchief Rend Blackhand"] = "Kriegshäuptling Rend Schwarzfaust",

--Blackwing Lair
		["Broodlord Lashlayer"] = "Brutwächter Dreschbringer",
		["Chromaggus"] = "Chromaggus",
		["Ebonroc"] = "Schattenschwinge",
		["Firemaw"] = "Feuerschwinge",
		["Flamegor"] = "Flammenmaul",
		["Grethok the Controller"] = "Grethok der Aufseher",
		["Lord Victor Nefarius"] = "Lord Victor Nefarius",
		["Nefarian"] = "Nefarian",
		["Razorgore the Untamed"] = "Razorgore der Ungezähmte",
		["Vaelastrasz the Corrupt"] = "Vaelastrasz der Verdorbene",

--Black Temple
		["Essence of Anger"] = "Essenz des Zorns",
		["Essence of Desire"] = "Essenz der Begierde",
		["Essence of Suffering"] = "Essenz des Leidens",
		["Gathios the Shatterer"] = "Gathios der Zerschmetterer",
		["Gurtogg Bloodboil"] = "Gurtogg Siedeblut",
		["High Nethermancer Zerevor"] = "Hochnethermant Zerevor",
		["High Warlord Naj'entus"] = "Oberster Kriegsfürst Naj'entus",
		["Illidan Stormrage"] = "Illidan Sturmgrimm",
		["Illidari Council"] = "Rat der Illidari",
		["Lady Malande"] = "Lady Malande",
		["Mother Shahraz"] = "Mutter Shahraz",
		["Reliquary of Souls"] = "Reliquium der Seelen",
		["Shade of Akama"] = "Akamas Schemen",
		["Supremus"] = "Supremus",
		["Teron Gorefiend"] = "Teron Blutschatten",
		["The Illidari Council"] = "Rat der Illidari",
		["Veras Darkshadow"] = "Veras Schwarzschatten",

--Borean Tundra
--The Eye of Eternity
		--["Malygos"] = true,
--The Nexus
		--["Anomalus"] = true,
		--["Grand Magus Telestra"] = true,
		--["Keristrasza"] = true,
		--["Ormorok the Tree-Shaper"] = true,
--The Oculus
		--["Drakos the Interrogator"] = true,
		--["Ley-Guardian Eregos"] = true,
		--["Mage-Lord Urom"] = true,
		--["Varos Cloudstrider"] = true,	

--Caverns of Time
--Old Hillsbrad Foothills
		["Captain Skarloc"] = "Kapitän Skarloc",
		["Epoch Hunter"] = "Epochenjäger",
		["Lieutenant Drake"] = "Leutnant Drach",
--The Culling of Stratholme
		--["Meathook"] = true,
		--["Chrono-Lord Epoch"] = true,
		--["Mal'Ganis"] = true,
		--["Salramm the Fleshcrafter"] = true,
--The Black Morass
		["Aeonus"] = "Aeonus",
		["Chrono Lord Deja"] = "Chronolord Deja",
		["Medivh"] = "Medivh",
		["Temporus"] = "Temporus",

--Chamber of Aspects
--The Obsidian Sanctum
		--["Sartharion"] = true,
		--["Shadron"] = true,
		--["Tenebron"] = true,
		--["Vesperon"] = true,

--Coilfang Reservoir
--Serpentshrine Cavern
		["Coilfang Elite"] = "Elitesoldat des Echsenkessels",
		["Coilfang Strider"] = "Schreiter des Echsenkessels",
		["Fathom-Lord Karathress"] = "Tiefenlord Karathress",
		["Hydross the Unstable"] = "Hydross der Unstete",
		["Lady Vashj"] = "Lady Vashj",
		["Leotheras the Blind"] = "Leotheras der Blinde",
		["Morogrim Tidewalker"] = "Morogrim Gezeitenwandler",
		["Pure Spawn of Hydross"] = "Gereinigter Nachkomme Hydross'",
		["Shadow of Leotheras"] = "Schatten von Leotheras",
		["Tainted Spawn of Hydross"] = "Besudelter Nachkomme Hydross'",
		["The Lurker Below"] = "Das Grauen aus der Tiefe",
		["Tidewalker Lurker"] = "Lauerer der Gezeitenwandler",
--The Slave Pens
		["Mennu the Betrayer"] = "Mennu der Verräter",
		["Quagmirran"] = "Quagmirran",
		["Rokmar the Crackler"] = "Rokmar der Zerquetscher",
		["Ahune"] = "Ahune",
--The Steamvault
		["Hydromancer Thespia"] = "Wasserbeschwörerin Thespia",
		["Mekgineer Steamrigger"] = "Robogenieur Dampfhammer",
		["Warlord Kalithresh"] = "Kriegsherr Kalithresh",
--The Underbog
		["Claw"] = "Klaue",
		["Ghaz'an"] = "Ghaz'an",
		["Hungarfen"] = "Hungarfenn",
		["Overseer Tidewrath"] = "Overseer Tidewrath",
		["Swamplord Musel'ek"] = "Sumpffürst Musel'ek",
		["The Black Stalker"] = "Die Schattenmutter",

--Dire Maul
--Arena
		["Mushgog"] = "Mushgog",
		["Skarr the Unbreakable"] = "Skarr der Unbezwingbare",
		["The Razza"] = "Der Razza",
--East
		["Alzzin the Wildshaper"] = "Alzzin der Wildformer",
		["Hydrospawn"] = "Hydrobrut",
		["Isalien"] = "Isalien",
		["Lethtendris"] = "Lethtendris",
		["Pimgib"] = "Pimgib",
		["Pusillin"] = "Pusillin",
		["Zevrim Thornhoof"] = "Zevrim Dornhuf",
--North
		["Captain Kromcrush"] = "Hauptmann Krombruch",
		["Cho'Rush the Observer"] = "Cho'Rush der Beobachter",
		["Guard Fengus"] = "Wache Fengus",
		["Guard Mol'dar"] = "Wache Mol'dar",
		["Guard Slip'kik"] = "Wache Slip'kik",
		["King Gordok"] = "König Gordok",
		["Knot Thimblejack's Cache"] = "Knot Thimblejacks Truhe",
		["Stomper Kreeg"] = "Stampfer Kreeg",
--West
		["Illyanna Ravenoak"] = "Illyanna Rabeneiche",
		["Immol'thar"] = "Immol'thar",
		["Lord Hel'nurath"] = "Lord Hel'nurath",
		["Magister Kalendris"] = "Magister Kalendris",
		["Prince Tortheldrin"] = "Prinz Tortheldrin",
		["Tendris Warpwood"] = "Tendris Wucherborke",
		["Tsu'zee"] = "Tsu'zee",

--Dragonblight
-- Ahn'kahet: The Old Kingdom
		--["Elder Nadox"] = true,
		--["Herald Volazj"]=  true,
		--["Jedoga Shadowseeker"] = true,
		--["Prince Taldaram"] = true,
--Azjol-Nerub
		--["Anub'arak"] = true,
		--["Hadronox"] = true,
		--["Krik'thir the Gatewatcher"] = true,

--Gnomeregan
		["Crowd Pummeler 9-60"] = "Meuteverprügler 9-60",
		["Dark Iron Ambassador"] = "Botschafter der Dunkeleisenzwerge",
		["Electrocutioner 6000"] = "Elektrokutor 6000",
		["Grubbis"] = "Grubbis",
		["Mekgineer Thermaplugg"] = "Robogenieur Thermadraht",
		["Techbot"] = "Techbot",
		["Viscous Fallout"] = "Verflüssigte Ablagerung",

--Grizzly Hills
--Draktharon Keep
		--["King Dred"] = true,
		--["Novos the Summoner"] = true,
		--["The Prophet Tharon'ja"] = true,
		--["Trollgore"] = true,

--Gruul's Lair
		["Blindeye the Seer"] = "Blindauge der Seher",
		["Gruul the Dragonkiller"] = "Gruul der Drachenschlächter",
		["High King Maulgar"] = "Hochkönig Maulgar",
		["Kiggler the Crazed"] = "Kiggler the Crazed",
		["Krosh Firehand"] = "Krosh Feuerhand",
		["Olm the Summoner"] = "Olm der Beschwörer",

--Hellfire Citadel
--Hellfire Ramparts
		["Nazan"] = "Nazan",
		["Omor the Unscarred"] = "Omor der Narbenlose",
		["Vazruden the Herald"] = "Vazruden der Herold",
		["Vazruden"] = "Vazruden",
		["Watchkeeper Gargolmar"] = "Wachhabender Gargolmar",
--Magtheridon's Lair
		["Hellfire Channeler"] = "Kanalisierer des Höllenfeuers",
		["Magtheridon"] = "Magtheridon",
--The Blood Furnace
		["Broggok"] = "Broggok",
		["Keli'dan the Breaker"] = "Keli'dan der Zerstörer",
		["The Maker"] = "Der Schöpfer",
--The Shattered Halls
		["Blood Guard Porung"] = "Blutwache Porung",
		["Grand Warlock Nethekurse"] = "Großhexenmeister Nethekurse",
		["Warbringer O'mrogg"] = "Kriegshetzer O'mrogg",
		["Warchief Kargath Bladefist"] = "Kriegshäuptling Kargath Messerfaust",

--Howling Fjord
--Utgarde Keep
		--["Constructor & Controller"] = true, --these are one encounter, so we do this as an encounter name
		--["Dalronn the Controller"] = true,
		--["Ingvar the Plunderer"] = true,
		--["Prince Keleseth"] = true,
		--["Skarvald the Constructor"] = true,
--Utgarde Pinnacle
		--["Skadi the Ruthless"] = true,
		--["King Ymiron"] = true,
		--["Svala Sorrowgrave"] = true,
		--["Gortok Palehoof"] = true,

--Hyjal Summit
		["Anetheron"] = "Anetheron",
		["Archimonde"] = "Archimonde",
		["Azgalor"] = "Azgalor",
		["Kaz'rogal"] = "Kaz'rogal",
		["Rage Winterchill"] = "Furor Winterfrost",

--Karazhan
		["Arcane Watchman"] = "Arkanwachmann",
		["Attumen the Huntsman"] = "Attumen der Jäger",
		["Chess Event"] = "Chess Event",
		["Dorothee"] = "Dorothee",
		["Dust Covered Chest"] = "Staub Bedeckter Kasten",
		["Grandmother"] = "Großmutter",
		["Hyakiss the Lurker"] = "Hyakiss der Lauerer",
		["Julianne"] = "Julianne",
		["Kil'rek"] = "Kil'rek",
		["King Llane Piece"] = "König Llane",
		["Maiden of Virtue"] = "Tugendhafte Maid",
		["Midnight"] = "Mittnacht",
		["Moroes"] = "Moroes",
		["Netherspite"] = "Nethergroll",
		["Nightbane"] = "Schrecken der Nacht",
		["Prince Malchezaar"] = "Prinz Malchezaar",
		["Restless Skeleton"] = "Ruheloses Skelett",
		["Roar"] = "Brüller",
		["Rokad the Ravager"] = "Rokad der Verheerer",
		["Romulo & Julianne"] = "Romulo & Julianne",
		["Romulo"] = "Romulo",
		["Shade of Aran"] = "Arans Schemen",
		["Shadikith the Glider"] = "Shadikith der Segler",
		["Strawman"] = "Strohmann",
		["Terestian Illhoof"] = "Terestian Siechhuf",
		["The Big Bad Wolf"] = "Der große böse Wolf",
		["The Crone"] = "Die böse Hexe",
		["The Curator"] = "Der Kurator",
		["Tinhead"] = "Blechkopf",
		["Tito"] = "Tito",
		["Warchief Blackhand Piece"] = "Kriegshäuptling Schwarzfaust",

-- Magisters' Terrace
		["Kael'thas Sunstrider"] = "Kael'thas Sonnenwanderer",
		["Priestess Delrissa"] = "Priesterin Delrissa",
		["Selin Fireheart"] = "Selin Feuerherz",
		["Vexallus"] = "Vexallus",

--Maraudon
		["Celebras the Cursed"] = "Celebras der Verfluchte",
		["Gelk"] = "Gelk",
		["Kolk"] = "Kolk",
		["Landslide"] = "Erdrutsch",
		["Lord Vyletongue"] = "Lord Schlangenzunge",
		["Magra"] = "Magra",
		["Maraudos"] = "Maraudos",
		["Meshlok the Harvester"] = "Meshlok der Ernter",
		["Noxxion"] = "Noxxion",
		["Princess Theradras"] = "Prinzessin Theradras",
		["Razorlash"] = "Schlingwurzler",
		["Rotgrip"] = "Faulschnapper",
		["Tinkerer Gizlock"] = "Tüftler Gizlock",
		["Veng"] = "Veng",

--Molten Core
		["Baron Geddon"] = "Baron Geddon",
		["Cache of the Firelord"] = "Truhe des Feuerlords",
		["Garr"] = "Garr",
		["Gehennas"] = "Gehennas",
		["Golemagg the Incinerator"] = "Golemagg der Verbrenner",
		["Lucifron"] = "Lucifron",
		["Magmadar"] = "Magmadar",
		["Majordomo Executus"] = "Majordomus Exekutus",
		["Ragnaros"] = "Ragnaros",
		["Shazzrah"] = "Shazzrah",
		["Sulfuron Harbinger"] = "Sulfuronherold",

--Naxxramas
		["Anub'Rekhan"] = "Anub'Rekhan",
		["Deathknight Understudy"] = "Reservist der Todesritter",
		["Feugen"] = "Feugen",
		["Four Horsemen Chest"] = "Die Vier Reiter Kiste",
		["Gluth"] = "Gluth",
		["Gothik the Harvester"] = "Gothik der Seelenjäger",
		["Grand Widow Faerlina"] = "Großwitwe Faerlina",
		["Grobbulus"] = "Grobbulus",
		["Heigan the Unclean"] = "Heigan der Unreine",
		["Highlord Mograine"] = "Hochlord Mograine",
		["Instructor Razuvious"] = "Instrukteur Razuvious",
		["Kel'Thuzad"] = "Kel'Thuzad",
		["Lady Blaumeux"] = "Lady Blaumeux",
		["Loatheb"] = "Loatheb",
		["Maexxna"] = "Maexxna",
		["Noth the Plaguebringer"] = "Noth der Seuchenfürst",
		["Patchwerk"] = "Flickwerk",
		["Sapphiron"] = "Saphiron",
		["Sir Zeliek"] = "Sire Zeliek",
		["Stalagg"] = "Stalagg",
		["Thaddius"] = "Thaddius",
		["Thane Korth'azz"] = "Thane Korth'azz",
		["The Four Horsemen"] = "Die Vier Reiter",

--Onyxia's Lair
		["Onyxia"] = "Onyxia",

--Ragefire Chasm
		["Bazzalan"] = "Bazzalan",
		["Jergosh the Invoker"] = "Jergosh der Herbeirufer",
		["Maur Grimtotem"] = "Maur Grimmtotem",
		["Taragaman the Hungerer"] = "Taragaman der Hungerleider",

--Razorfen Downs
		["Amnennar the Coldbringer"] = "Amnennar der Kältebringer",
		["Glutton"] = "Nimmersatt",
		["Mordresh Fire Eye"] = "Mordresh Feuerauge",
		["Plaguemaw the Rotting"] = "Seuchenschlund der Faulende",
		["Ragglesnout"] = "Struppmähne",
		["Tuten'kash"] = "Tuten'kash",

--Razorfen Kraul
		["Agathelos the Raging"] = "Agathelos der Tobende",
		["Blind Hunter"] = "Blinder Jäger",
		["Charlga Razorflank"] = "Charlga Klingenflanke",
		["Death Speaker Jargba"] = "Todessprecher Jargba",
		["Earthcaller Halmgar"] = "Erdenrufer Halmgar",
		["Overlord Ramtusk"] = "Oberanführer Rammhauer",

--Ruins of Ahn'Qiraj
		["Anubisath Guardian"] = "Beschützer des Anubisath",
		["Ayamiss the Hunter"] = "Ayamiss der Jäger",
		["Buru the Gorger"] = "Buru der Verschlinger",
		["General Rajaxx"] = "General Rajaxx",
		["Kurinnaxx"] = "Kurinnaxx",
		["Lieutenant General Andorov"] = "Generallieutenant Andorov",
		["Moam"] = "Moam",
		["Ossirian the Unscarred"] = "Ossirian der Narbenlose",

--Scarlet Monastery
--Armory
		["Herod"] = "Herod",
--Cathedral
		["High Inquisitor Fairbanks"] = "Hochinquisitor Fairbanks",
		["High Inquisitor Whitemane"] = "Hochinquisitor Weißsträhne",
		["Scarlet Commander Mograine"] = "Scharlachroter Kommandant Mograine",
--Graveyard
		["Azshir the Sleepless"] = "Azshir der Schlaflose",
		["Bloodmage Thalnos"] = "Blutmagier Thalnos",
		["Fallen Champion"] = "Gestürzter Held",
		["Interrogator Vishas"] = "Befrager Vishas",
		["Ironspine"] = "Eisenrücken",
		["Headless Horseman"] = "Der kopflose Reiter",
--Library
		["Arcanist Doan"] = "Arkanist Doan",
		["Houndmaster Loksey"] = "Hundemeister Loksey",

--Scholomance
		["Blood Steward of Kirtonos"] = "Blutdiener von Kirtonos",
		["Darkmaster Gandling"] = "Dunkelmeister Gandling",
		["Death Knight Darkreaver"] = "Todesritter Schattensichel",
		["Doctor Theolen Krastinov"] = "Doktor Theolen Krastinov",
		["Instructor Malicia"] = "Instrukteurin Malicia",
		["Jandice Barov"] = "Jandice Barov",
		["Kirtonos the Herald"] = "Kirtonos der Herold",
		["Kormok"] = "Kormok",
		["Lady Illucia Barov"] = "Lady Illucia Barov",
		["Lord Alexei Barov"] = "Lord Alexei Barov",
		["Lorekeeper Polkelt"] = "Hüter des Wissens Polkelt",
		["Marduk Blackpool"] = "Marduk Blackpool",
		["Ras Frostwhisper"] = "Ras Frostraunen",
		["Rattlegore"] = "Blutrippe",
		["The Ravenian"] = "Der Ravenier",
		["Vectus"] = "Vectus",

--Shadowfang Keep
		["Archmage Arugal"] = "Erzmagier Arugal",
		["Arugal's Voidwalker"] = "Arugals Leerwandler",
		["Baron Silverlaine"] = "Baron Silberlein",
		["Commander Springvale"] = "Kommandant Springvale",
		["Deathsworn Captain"] = "Todeshöriger Captain",
		["Fenrus the Devourer"] = "Fenrus der Verschlinger",
		["Odo the Blindwatcher"] = "Odo der Blindseher",
		["Razorclaw the Butcher"] = "Klingenklaue der Metzger",
		["Wolf Master Nandos"] = "Wolfmeister Nados",

--Stratholme
		["Archivist Galford"] = "Archivar Galford",
		["Balnazzar"] = "Balnazzar",
		["Baron Rivendare"] = "Baron Totenschwur",
		["Baroness Anastari"] = "Baroness Anastari",
		["Black Guard Swordsmith"] = "Schwertschmied der schwarzen Wache",
		["Cannon Master Willey"] = "Kanonenmeister Willey",
		["Crimson Hammersmith"] = "Purpurroter Hammerschmied",
		["Fras Siabi"] = "Fras Siabi",
		["Hearthsinger Forresten"] = "Herdsinger Forresten",
		["Magistrate Barthilas"] = "Magistrat Barthilas",
		["Maleki the Pallid"] = "Maleki der Leichenblasse",
		["Nerub'enkan"] = "Nerub'enkan",
		["Postmaster Malown"] = "Postmeister Malown",
		["Ramstein the Gorger"] = "Ramstein der Verschlinger",
		["Skul"] = "Skul",
		["Stonespine"] = "Steinbuckel",
		["The Unforgiven"] = "Der Unverziehene",
		["Timmy the Cruel"] = "Timmy der Grausame",

--Sunwell Plateau
		["Kalecgos"] = "Kalecgos",
		["Sathrovarr the Corruptor"] = "Sathrovarr der Verderber",
		["Brutallus"] = "Brutallus",
		["Felmyst"] = "Teufelsruch",
		["Kil'jaeden"] = "Kil'jaeden",
		["M'uru"] = "M'uru",
		["Entropius"] = "Entropius",
		["The Eredar Twins"] = "Die Eredar Zwillinge",
		["Lady Sacrolash"] = "Lady Sacrolash",
		["Grand Warlock Alythess"] = "Großhexenmeisterin Alythess",

--Tempest Keep
--The Arcatraz
		["Dalliah the Doomsayer"] = "Dalliah die Verdammnisverkünderin",
		["Harbinger Skyriss"] = "Herold Horizontiss",
		["Warden Mellichar"] = "Aufseher Mellichar",
		["Wrath-Scryer Soccothrates"] = "Zornseher Soccothrates",
		["Zereketh the Unbound"] = "Zereketh der Unabhängige",
--The Botanica
		["Commander Sarannis"] = "Kommandant Sarannis",
		["High Botanist Freywinn"] = "Hochbotaniker Freywinn",
		["Laj"] = "Laj",
		["Thorngrin the Tender"] = "Dorngrin der Hüter",
		["Warp Splinter"] = "Warpzweig",
--The Eye
		["Al'ar"] = "Al'ar",
		["Cosmic Infuser"] = "Kosmische Macht",
		["Devastation"] = "Verwüstung",
		["Grand Astromancer Capernian"] = "Großastronom Capernian",
		["High Astromancer Solarian"] = "Hochastromantin Solarian",
		["Infinity Blades"] = "Klinge der Unendlichkeit",
		["Kael'thas Sunstrider"] = "Kael'thas Sonnenwanderer",
		["Lord Sanguinar"] = "Fürst Blutdurst",
		["Master Engineer Telonicus"] = "Meisteringenieur Telonicus",
		["Netherstrand Longbow"] = "Netherbespannter Langbogen",
		["Phaseshift Bulwark"] = "Phasenverschobenes Bollwerk",
		["Solarium Agent"] = "Solarian Agent",
		["Solarium Priest"] = "Solarian Priester",
		["Staff of Disintegration"] = "Stab der Auflösung",
		["Thaladred the Darkener"] = "Thaladred der Verfinsterer",
		["Void Reaver"] = "Leerhäscher",
		["Warp Slicer"] = "Warpschnitter",
--The Mechanar
		["Gatewatcher Gyro-Kill"] = "Torwächter Gyrotot",
		["Gatewatcher Iron-Hand"] = "Torwächter Eisenhand",
		["Mechano-Lord Capacitus"] = "Mechanolord Kapazitus",
		["Nethermancer Sepethrea"] = "Nethermant Sepethrea",
		["Pathaleon the Calculator"] = "Pathaleon der Kalkulator",

--The Deadmines
		["Brainwashed Noble"] = "Manipulierter Adliger",
		["Captain Greenskin"] = "Kapitän Grünhaut",
		["Cookie"] = "Krümel",
		["Edwin VanCleef"] = "Edwin van Cleef",
		["Foreman Thistlenettle"] = "Großknecht Distelklette",
		["Gilnid"] = "Gilnid",
		["Marisa du'Paige"] = "Marisa du'Paige",
		["Miner Johnson"] = "Minenarbeiter Johnson",
		["Mr. Smite"] = "Handlanger Pein",
		["Rhahk'Zor"] = "Rhahk'Zor",
		["Sneed"] = "Sneed",
		["Sneed's Shredder"] = "Sneeds Schredder",

--The Stockade
		["Bazil Thredd"] = "Bazil Thredd",
		["Bruegal Ironknuckle"] = "Bruegal Eisenfaust",
		["Dextren Ward"] = "Dextren Ward",
		["Hamhock"] = "Hamhock",
		["Kam Deepfury"] = "Kam Tiefenzorn",
		["Targorr the Dread"] = "Targorr der Schreckliche",

--The Temple of Atal'Hakkar
		["Atal'alarion"] = "Atal'alarion",
		["Avatar of Hakkar"] = "Avatar von Hakkar",
		["Dreamscythe"] = "Traumsense",
		["Gasher"] = "Schlitzer",
		["Hazzas"] = "Hazzas",
		["Hukku"] = "Hukku",
		["Jade"] = "Jade",
		["Jammal'an the Prophet"] = "Jammal'an der Prophet",
		["Kazkaz the Unholy"] = "Kazkaz der Unheilige",
		["Loro"] = "Loro",
		["Mijan"] = "Mijan",
		["Morphaz"] = "Morphaz",
		["Ogom the Wretched"] = "Ogom der Elende",
		["Shade of Eranikus"] = "Eranikus' Schemen",
		["Veyzhak the Cannibal"] = "Veyzhack der Kannibale",
		["Weaver"] = "Wirker",
		["Zekkis"] = "Zekkis",
		["Zolo"] = "Zolo",
		["Zul'Lor"] = "Zul'Lor",

--Uldaman
		["Ancient Stone Keeper"] = "Uralter Steinbewahrer",
		["Archaedas"] = "Archaedas",
		["Baelog"] = "Baelog",
		["Digmaster Shovelphlange"] = "Grubenmeister Schaufelphlansch",
		["Galgann Firehammer"] = "Galgann Feuerhammer",
		["Grimlok"] = "Grimlok",
		["Ironaya"] = "Ironaya",
		["Obsidian Sentinel"] = "Obsidianschildwache",
		["Revelosh"] = "Revelosh",

-- Ulduar
-- Halls of Lightning
		--["General Bjarngrim"] = true,
		--["Ionar"] = true,
		--["Loken"] = true,
		--["Volkhan"] = true,
-- Halls of Stone
		--["Krystallus"] = true,
		--["Maiden of Grief"] = true,
		--["Sjonnir the Ironshaper"] = true,
		--["The Tribunal of Ages"] = true,

-- The Violet Hold
		--["Cyanigosa"] = true,
		--["Erekem"] = true,
		--["Ichoron"] = true,
		--["Lavanthor"] = true,
		--["Moragg"] = true,
		--["Xevozz"] = true,
		--["Zuramat the Obliterator"] = true,

--Wailing Caverns
		["Boahn"] = "Boahn",
		["Deviate Faerie Dragon"] = "Deviatfeendrache",
		["Kresh"] = "Kresh",
		["Lady Anacondra"] = "Lady Anacondra",
		["Lord Cobrahn"] = "Lord Kobrahn",
		["Lord Pythas"] = "Lord Pythas",
		["Lord Serpentis"] = "Lord Serpentis",
		["Mad Magglish"] = "Zausel der Verrückte",
		["Mutanus the Devourer"] = "Mutanus der Verschlinger",
		["Skum"] = "Skum",
		["Trigore the Lasher"] = "Trigore der Peitscher",
		["Verdan the Everliving"] = "Verdan der Ewiglebende",

--World Bosses
		["Avalanchion"] = "Avalanchion",
		["Azuregos"] = "Azuregos",
		["Baron Charr"] = "Baron Glutarr",
		["Baron Kazum"] = "Baron Kazum",
		["Doom Lord Kazzak"] = "Verdammnislord Kazzak",
		["Doomwalker"] = "Verdammniswandler",
		["Emeriss"] = "Smariss",
		["High Marshal Whirlaxis"] = "Hochmarschall Whirlaxis",
		["Lethon"] = "Lethon",
		["Lord Skwol"] = "Lord Skwol",
		["Prince Skaldrenox"] = "Prince Skaldrenox",
		["Princess Tempestria"] = "Prinzessin Tempestria",
		["Taerar"] = "Taerar",
		["The Windreaver"] = "Der Windhäscher",
		["Ysondre"] = "Ysondre",

--Zul'Aman
		["Akil'zon"] = "Akil'zon",
		["Halazzi"] = "Halazzi",
		["Jan'alai"] = "Jan'alai",
		["Malacrass"] = "Malacrass",
		["Nalorakk"] = "Nalorakk",
		["Zul'jin"] = "Zul'jin",
		["Hex Lord Malacrass"] = "Hexlord Malacrass",

--Zul'Farrak
		["Antu'sul"] = "Antu'sul",
		["Chief Ukorz Sandscalp"] = "Häuptling Ukorz Sandwüter",
		["Dustwraith"] = "Karaburan",
		["Gahz'rilla"] = "Gahz'rilla",
		["Hydromancer Velratha"] = "Wasserbeschwörerin Velratha",
		["Murta Grimgut"] = "Murta Bauchgrimm",
		["Nekrum Gutchewer"] = "Nekrum der Ausweider",
		["Oro Eyegouge"] = "Oro Hohlauge",
		["Ruuzlu"] = "Ruuzlu",
		["Sandarr Dunereaver"] = "Sandarr der Wüstenräuber",
		["Sandfury Executioner"] = "Henker der Sandwüter",
		["Sergeant Bly"] = "Unteroffizier Bly",
		["Shadowpriest Sezz'ziz"] = "Schattenpriester Sezz'ziz",
		["Theka the Martyr"] = "Theka der Märtyrer",
		["Witch Doctor Zum'rah"] = "Hexendoktor Zum'rah" ,
		["Zerillis"] = "Zerillis",
		["Zul'Farrak Dead Hero"] = "Untoter Held aus Zul'Farrak",

-- Zul'Drak
-- Gundrak
		--["Eck the Ferocious"] = true,
		--["Drakkari Colossus"] = true,
		--["Gal'darah"] = true,
		--["Moorabi"] = true,
		--["Slad'ran"] = true,

--Zul'Gurub
		["Bloodlord Mandokir"] = "Blutfürst Mandokir",
		["Gahz'ranka"] = "Gahz'ranka",
		["Gri'lek"] = "Gri'lek",
		["Hakkar"] = "Hakkar",
		["Hazza'rah"] = "Hazza'rah",
		["High Priest Thekal"] = "Hohepriester Thekal",
		["High Priest Venoxis"] = "Hohepriester Venoxis",
		["High Priestess Arlokk"] = "Hohepriesterin Arlokk",
		["High Priestess Jeklik"] = "Hohepriesterin Jeklik",
		["High Priestess Mar'li"] = "Hohepriesterin Mar'li",
		["Jin'do the Hexxer"] = "Jin'do der Verhexer",
		["Renataki"] = "Renataki",
		["Wushoolay"] = "Wushoolay",

--Ring of Blood (where? an instnace? should be in other file?)
		["Brokentoe"] = "Schmetterzehe",
		["Mogor"] = "Mogor",
		["Murkblood Twin"] = "Zwilling der Finsterblut",
		["Murkblood Twins"] = "Zwillinge der Finsterblut",
		["Rokdar the Sundered Lord"] = "Rokdar der Zerklüftete",
		["Skra'gath"] = "Skra'gath",
		["The Blue Brothers"] = "Die Blaumänner",
		["Warmaul Champion"] = "Champion der Totschläger",
	}
end)

BabbleBoss:RegisterTranslations("frFR", function()
	return {
--Ahn'Qiraj
		["Anubisath Defender"] = "Défenseur Anubisath",
		["Battleguard Sartura"] = "Garde de guerre Sartura",
		["C'Thun"] = "C'Thun",
		["Emperor Vek'lor"] = "Empereur Vek'lor",
		["Emperor Vek'nilash"] = "Empereur Vek'nilash",
		["Eye of C'Thun"] = "Œil de C'Thun",
		["Fankriss the Unyielding"] = "Fankriss l'Inflexible",
		["Lord Kri"] = "Seigneur Kri",
		["Ouro"] = "Ouro",
		["Princess Huhuran"] = "Princesse Huhuran",
		["Princess Yauj"] = "Princesse Yauj",
		["The Bug Family"] = "La famille insecte",
		["The Prophet Skeram"] = "Le Prophète Skeram",
		["The Twin Emperors"] = "Les Empereurs jumeaux",
		["Vem"] = "Vem",
		["Viscidus"] = "Viscidus",

--Auchindoun
--Auchenai Crypts
		["Exarch Maladaar"] = "Exarque Maladaar",
		["Shirrak the Dead Watcher"] = "Shirrak le Veillemort",
--Mana-Tombs
		["Nexus-Prince Shaffar"] = "Prince-nexus Shaffar",
		["Pandemonius"] = "Pandemonius",
		["Tavarok"] = "Tavarok",
--Shadow Labyrinth
		["Ambassador Hellmaw"] = "Ambassadeur Gueule-d'enfer",
		["Blackheart the Inciter"] = "Coeur-noir le Séditieux",
		["Grandmaster Vorpil"] = "Grand Maître Vorpil",
		["Murmur"] = "Marmon",
--Sethekk Halls
		["Anzu"] = "Anzu",
		["Darkweaver Syth"] = "Tisseur d'ombre Syth",
		["Talon King Ikiss"] = "Roi-serre Ikiss",

--Blackfathom Deeps
		["Aku'mai"] = "Aku'mai",
		["Baron Aquanis"] = "Baron Aquanis",
		["Gelihast"] = "Gelihast",
		["Ghamoo-ra"] = "Ghamoo-ra",
		["Lady Sarevess"] = "Dame Sarevess",
		["Old Serra'kis"] = "Vieux Serra'kis",
		["Twilight Lord Kelris"] = "Seigneur du crépuscule Kelris",

--Blackrock Depths
		["Ambassador Flamelash"] = "Ambassadeur Cinglefouet",
		["Anger'rel"] = "Colé'rel",
		["Anub'shiah"] = "Anub'shiah",
		["Bael'Gar"] = "Bael'Gar",
		["Chest of The Seven"] = "Coffre des sept",
		["Doom'rel"] = "Tragi'rel",
		["Dope'rel"] = "Demeu'rel",
		["Emperor Dagran Thaurissan"] = "Empereur Dagran Thaurissan",
		["Eviscerator"] = "Eviscérateur",
		["Fineous Darkvire"] = "Fineous Sombrevire",
		["General Angerforge"] = "Général Forgehargne",
		["Gloom'rel"] = "Funéb'rel",
		["Golem Lord Argelmach"] = "Seigneur golem Argelmach",
		["Gorosh the Dervish"] = "Gorosh le Derviche",
		["Grizzle"] = "Grison",
		["Hate'rel"] = "Haine'rel",
		["Hedrum the Creeper"] = "Hedrum le Rampant",
		["High Interrogator Gerstahn"] = "Grand Interrogateur Gerstahn",
		["High Priestess of Thaurissan"] = "Grande prêtresse de Thaurissan",
		["Houndmaster Grebmar"] = "Maître-chien Grebmar",
		["Hurley Blackbreath"] = "Hurley Soufflenoir",
		["Lord Incendius"] = "Seigneur Incendius",
		["Lord Roccor"] = "Seigneur Roccor",
		["Magmus"] = "Magmus",
		["Ok'thor the Breaker"] = "Ok'thor le Briseur",
		["Panzor the Invincible"] = "Panzor l'Invincible",
		["Phalanx"] = "Phalange",
		["Plugger Spazzring"] = "Lanfiche Brouillecircuit",
		["Princess Moira Bronzebeard"] = "Princesse Moira Barbe-de-bronze",
		["Pyromancer Loregrain"] = "Pyromancien Blé-du-savoir",
		["Ribbly Screwspigot"] = "Ribbly Fermevanne",
		["Seeth'rel"] = "Fulmi'rel",
		["The Seven Dwarves"] = "Les sept nains",
		["Verek"] = "Verek",
		["Vile'rel"] = "Ignobl'rel",
		["Warder Stilgiss"] = "Gardien Stilgiss",

--Blackrock Spire
--Lower
		["Bannok Grimaxe"] = "Bannok Hache-sinistre",
		["Burning Felguard"] = "Gangregarde ardent",
		["Crystal Fang"] = "Croc cristallin",
		["Ghok Bashguud"] = "Ghok Bounnebaffe",
		["Gizrul the Slavener"] = "Gizrul l'esclavagiste",
		["Halycon"] = "Halycon",
		["Highlord Omokk"] = "Généralissime Omokk",
		["Mor Grayhoof"] = "Mor Sabot-gris",
		["Mother Smolderweb"] = "Matriarche Couveuse",
		["Overlord Wyrmthalak"] = "Seigneur Wyrmthalak",
		["Quartermaster Zigris"] = "Intendant Zigris",
		["Shadow Hunter Vosh'gajin"] = "Chasseresse des ombres Vosh'gajin",
		["Spirestone Battle Lord"] = "Seigneur de bataille Pierre-du-pic",
		["Spirestone Butcher"] = "Boucher Pierre-du-pic",
		["Spirestone Lord Magus"] = "Seigneur magus Pierre-du-pic",
		["Urok Doomhowl"] = "Urok Hurleruine",
		["War Master Voone"] = "Maître de guerre Voone",
--Upper
		["General Drakkisath"] = "Général Drakkisath",
		["Goraluk Anvilcrack"] = "Goraluk Brisenclume",
		["Gyth"] = "Gyth",
		["Jed Runewatcher"] = "Jed Guette-runes",
		["Lord Valthalak"] = "Seigneur Valthalak",
		["Pyroguard Emberseer"] = "Pyrogarde Prophète ardent",
		["Solakar Flamewreath"] = "Solakar Voluteflamme",
		["The Beast"] = "La Bête",
		["Warchief Rend Blackhand"] = "Chef de guerre Rend Main-noire",

--Blackwing Lair
		["Broodlord Lashlayer"] = "Seigneur des couvées Lanistaire",
		["Chromaggus"] = "Chromaggus",
		["Ebonroc"] = "Rochébène",
		["Firemaw"] = "Gueule-de-feu",
		["Flamegor"] = "Flamegor",
		["Grethok the Controller"] = "Grethok le Contrôleur",
		["Lord Victor Nefarius"] = "Seigneur Victor Nefarius",
		["Nefarian"] = "Nefarian",
		["Razorgore the Untamed"] = "Tranchetripe l'Indompté",
		["Vaelastrasz the Corrupt"] = "Vaelastrasz le Corrompu",

--Black Temple
		["Essence of Anger"] = "Essence de la colère",
		["Essence of Desire"] = "Essence du désir",
		["Essence of Suffering"] = "Essence de la souffrance",
		["Gathios the Shatterer"] = "Gathios le Briseur",
		["Gurtogg Bloodboil"] = "Gurtogg Fièvresang",
		["High Nethermancer Zerevor"] = "Grand néantomancien Zerevor",
		["High Warlord Naj'entus"] = "Grand seigneur de guerre Naj'entus",
		["Illidan Stormrage"] = "Illidan Hurlorage",
		["Illidari Council"] = "Conseil illidari",
		["Lady Malande"] = "Dame Malande",
		["Mother Shahraz"] = "Mère Shahraz",
		["Reliquary of Souls"] = "Le reliquaire des âmes",
		["Shade of Akama"] = "Ombre d'Akama",
		["Supremus"] = "Supremus",
		["Teron Gorefiend"] = "Teron Fielsang",
		["The Illidari Council"] = "Le conseil illidari",
		["Veras Darkshadow"] = "Veras Ombrenoir",

--Borean Tundra
--The Eye of Eternity
		["Malygos"] = "Malygos",
--The Nexus
		["Anomalus"] = "Anomalus",
		["Grand Magus Telestra"] = "Grand magus Telestra",
		["Keristrasza"] = "Keristrasza",
		["Ormorok the Tree-Shaper"] = "Ormorok le Sculpte-arbre",
--The Oculus
		["Drakos the Interrogator"] = "Drakos l'Interrogateur",
		["Ley-Guardian Eregos"] = "Gardien-tellurique Eregos",
		["Mage-Lord Urom"] = "Seigneur-mage Urom",
		["Varos Cloudstrider"] = "Varos Arpentenuée",

--Caverns of Time
--Old Hillsbrad Foothills
		["Captain Skarloc"] = "Capitaine Skarloc",
		["Epoch Hunter"] = "Chasseur d'époques",
		["Lieutenant Drake"] = "Lieutenant Drake",
--The Culling of Stratholme
		["Meathook"] = "Grancrochet",
		["Chrono-Lord Epoch"] = "Chronoseigneur Epoch",
		["Mal'Ganis"] = "Mal'Ganis",
		["Salramm the Fleshcrafter"] = "Salramm le Façonneur de chair",
--The Black Morass
		["Aeonus"] = "Aeonus",
		["Chrono Lord Deja"] = "Chronoseigneur Déjà",
		["Medivh"] = "Medivh",
		["Temporus"] = "Temporus",

--Chamber of Aspects
--The Obsidian Sanctum
		["Sartharion"] = "Sartharion",
		["Shadron"] = "Obscuron",
		["Tenebron"] = "Ténébron",
		["Vesperon"] = "Vespéron",

--Coilfang Reservoir
--Serpentshrine Cavern
		["Coilfang Elite"] = "Elite de Glissecroc",
		["Coilfang Strider"] = "Trotteur de Glissecroc",
		["Fathom-Lord Karathress"] = "Seigneur des fonds Karathress",
		["Hydross the Unstable"] = "Hydross l'Instable",
		["Lady Vashj"] = "Dame Vashj",
		["Leotheras the Blind"] = "Leotheras l'Aveugle",
		["Morogrim Tidewalker"] = "Morogrim Marcheur-des-flots",
		["Pure Spawn of Hydross"] = "Pur rejeton d'Hydross",
		["Shadow of Leotheras"] = "Ombre de Leotheras",
		["Tainted Spawn of Hydross"] = "Rejeton d'Hydross souillé",
		["The Lurker Below"] = "Le Rôdeur d'En bas",
		["Tidewalker Lurker"] = "Rôdeur marcheur-des-flots",
--The Slave Pens
		["Ahune"] = "Ahune",
		["Mennu the Betrayer"] = "Mennu le Traître",
		["Quagmirran"] = "Bourbierreux",
		["Rokmar the Crackler"] = "Rokmar le Crépitant",
--The Steamvault
		["Hydromancer Thespia"] = "Hydromancienne Thespia",
		["Mekgineer Steamrigger"] = "Mékgénieur Montevapeur",
		["Warlord Kalithresh"] = "Seigneur de guerre Kalithresh",
--The Underbog
		["Claw"] = "Griffe",
		["Ghaz'an"] = "Ghaz'an",
		["Hungarfen"] = "Hungarfen",
		["Overseer Tidewrath"] = "Surveillant Tidewrath",
		["Swamplord Musel'ek"] = "Seigneur des marais Musel'ek",
		["The Black Stalker"] = "La Traqueuse noire",

--Dire Maul
--Arena
		["Mushgog"] = "Mushgog",
		["Skarr the Unbreakable"] = "Bâlhafr l'Invaincu",
		["The Razza"] = "La Razza",
--East
		["Alzzin the Wildshaper"] = "Alzzin le Modeleur",
		["Hydrospawn"] = "Hydrogénos",
		["Isalien"] = "Isalien",
		["Lethtendris"] = "Lethtendris",
		["Pimgib"] = "Pimgib",
		["Pusillin"] = "Pusillin",
		["Zevrim Thornhoof"] = "Zevrim Sabot-de-ronce",
--North
		["Captain Kromcrush"] = "Capitaine Kromcrush",
		["Cho'Rush the Observer"] = "Cho'Rush l'Observateur",
		["Guard Fengus"] = "Garde Fengus",
		["Guard Mol'dar"] = "Garde Mol'dar",
		["Guard Slip'kik"] = "Garde Slip'kik",
		["King Gordok"] = "Roi Gordok",
		["Knot Thimblejack's Cache"] = "Réserve de Noué Dédodevie",
		["Stomper Kreeg"] = "Kreeg le Marteleur",
--West
		["Illyanna Ravenoak"] = "Illyanna Corvichêne",
		["Immol'thar"] = "Immol'thar",
		["Lord Hel'nurath"] = "Seigneur Hel'nurath",
		["Magister Kalendris"] = "Magistère Kalendris",
		["Prince Tortheldrin"] = "Prince Tortheldrin",
		["Tendris Warpwood"] = "Tendris Crochebois",
		["Tsu'zee"] = "Tsu'zee",

--Dragonblight
-- Ahn'kahet: The Old Kingdom
		["Elder Nadox"] = "Ancien Nadox",
		["Herald Volazj"]=  "Héraut Volazj",
		["Jedoga Shadowseeker"] = "Jedoga Cherchelombre",
		["Prince Taldaram"] = "Prince Taldaram",
--Azjol-Nerub
		["Anub'arak"] = "Anub'arak",
		["Hadronox"] = "Hadronox",
		["Krik'thir the Gatewatcher"] = "Krik'thir le Gardien de porte",

--Gnomeregan
		["Crowd Pummeler 9-60"] = "Faucheur de foule 9-60",
		["Dark Iron Ambassador"] = "Ambassadeur Sombrefer",
		["Electrocutioner 6000"] = "Electrocuteur 6000",
		["Grubbis"] = "Grubbis",
		["Mekgineer Thermaplugg"] = "Mekgénieur Thermojoncteur",
		["Techbot"] = "Techbot",
		["Viscous Fallout"] = "Retombée visqueuse",

--Grizzly Hills
--Drak'Tharon Keep
		["King Dred"] = "Roi Dred",
		["Novos the Summoner"] = "Novos l'Invocateur",
		["The Prophet Tharon'ja"] = "Le prophète Tharon'ja",
		["Trollgore"] = "Trollétripe",

--Gruul's Lair
		["Blindeye the Seer"] = "Oeillaveugle le Voyant",
		["Gruul the Dragonkiller"] = "Gruul le Tue-dragon",
		["High King Maulgar"] = "Haut Roi Maulgar",
		["Kiggler the Crazed"] = "Kiggler le Cinglé",
		["Krosh Firehand"] = "Krosh Brasemain",
		["Olm the Summoner"] = "Olm l'Invocateur",

--Hellfire Citadel
--Hellfire Ramparts
		["Nazan"] = "Nazan",
		["Omor the Unscarred"] = "Omor l'Intouché",
		["Vazruden the Herald"] = "Vazruden le Héraut",
		["Vazruden"] = "Vazruden",
		["Watchkeeper Gargolmar"] = "Gardien des guetteurs Gargolmar",
--Magtheridon's Lair
		["Hellfire Channeler"] = "Canaliste des Flammes infernales",
		["Magtheridon"] = "Magtheridon",
--The Blood Furnace
		["Broggok"] = "Broggok",
		["Keli'dan the Breaker"] = "Keli'dan le Briseur",
		["The Maker"] = "Le Faiseur",
--The Shattered Halls
		["Blood Guard Porung"] = "Garde de sang Porung",
		["Grand Warlock Nethekurse"] = "Grand démoniste Néanathème",
		["Warbringer O'mrogg"] = "Porteguerre O'mrogg",
		["Warchief Kargath Bladefist"] = "Chef de guerre Kargath Lamepoing",

--Howling Fjord
--Utgarde Keep
		["Constructor & Controller"] = "Constructeur & Contrôleur", --these are one encounter, so we do this as an encounter name
		["Dalronn the Controller"] = "Dalronn le Contrôleur",
		["Ingvar the Plunderer"] = "Ingvar le Pilleur",
		["Prince Keleseth"] = "Prince Keleseth",
		["Skarvald the Constructor"] = "Skarvald le Constructeur",
--Utgarde Pinnacle
		["Skadi the Ruthless"] = "Skadi le Brutal",
		["King Ymiron"] = "Roi Ymiron",
		["Svala Sorrowgrave"] = "Svala Tristetombe",
		["Gortok Palehoof"] = "Gortok Pâle-sabot",

--Hyjal Summit
		["Anetheron"] = "Anetheron",
		["Archimonde"] = "Archimonde",
		["Azgalor"] = "Azgalor",
		["Kaz'rogal"] = "Kaz'rogal",
		["Rage Winterchill"] = "Rage Froidhiver",

--Karazhan
		["Arcane Watchman"] = "Veilleur arcanique",
		["Attumen the Huntsman"] = "Attumen le Veneur",
		["Chess Event"] = "Partie d'échec",
		["Dorothee"] = "Dorothée",
		["Dust Covered Chest"] = "Coffre couvert de poussière",
		["Grandmother"] = "Mère-grand",
		["Hyakiss the Lurker"] = "Hyakiss le rôdeur",
		["Julianne"] = "Julianne",
		["Kil'rek"] = "Kil'rek",
		["King Llane Piece"] = "Pion du Roi Llane",
		["Maiden of Virtue"] = "Damoiselle de vertu",
		["Midnight"] = "Minuit",
		["Moroes"] = "Moroes",
		["Netherspite"] = "Dédain-du-Néant",
		["Nightbane"] = "Plaie-de-nuit",
		["Prince Malchezaar"] = "Prince Malchezaar",
		["Restless Skeleton"] = "Squelette sans repos",
		["Roar"] = "Graou",
		["Rokad the Ravager"] = "Rodak le ravageur",
		["Romulo & Julianne"] = "Romulo & Julianne",
		["Romulo"] = "Romulo",
		["Shade of Aran"] = "Ombre d'Aran",
		["Shadikith the Glider"] = "Shadikith le glisseur",
		["Strawman"] = "Homme de paille",
		["Terestian Illhoof"] = "Terestian Malsabot",
		["The Big Bad Wolf"] = "Le Grand Méchant Loup",
		["The Crone"] = "La Mégère",
		["The Curator"] = "Le conservateur",
		["Tinhead"] = "Tête de fer-blanc",
		["Tito"] = "Tito",
		["Warchief Blackhand Piece"] = "Pion du Chef de guerre Main-noire",

-- Magisters' Terrace
		--["Kael'thas Sunstrider"] = "Kael'thas Haut-soleil",
		["Priestess Delrissa"] = "Prêtresse Delrissa",
		["Selin Fireheart"] = "Selin Coeur-de-feu",
		["Vexallus"] = "Vexallus",

--Maraudon
		["Celebras the Cursed"] = "Celebras le Maudit",
		["Gelk"] = "Gelk",
		["Kolk"] = "Kolk",
		["Landslide"] = "Glissement de terrain",
		["Lord Vyletongue"] = "Seigneur Vylelangue",
		["Magra"] = "Magra",
		["Maraudos"] = "Maraudos",
		["Meshlok the Harvester"] = "Meshlok le Moissonneur",
		["Noxxion"] = "Noxcion",
		["Princess Theradras"] = "Princesse Theradras",
		["Razorlash"] = "Tranchefouet",
		["Rotgrip"] = "Grippe-charogne",
		["Tinkerer Gizlock"] = "Bricoleur Kadenaz",
		["Veng"] = "Veng",

--Molten Core
		["Baron Geddon"] = "Baron Geddon",
		["Cache of the Firelord"] = "Cachette du Seigneur du feu",
		["Garr"] = "Garr",
		["Gehennas"] = "Gehennas",
		["Golemagg the Incinerator"] = "Golemagg l'Incinérateur",
		["Lucifron"] = "Lucifron",
		["Magmadar"] = "Magmadar",
		["Majordomo Executus"] = "Chambellan Executus",
		["Ragnaros"] = "Ragnaros",
		["Shazzrah"] = "Shazzrah",
		["Sulfuron Harbinger"] = "Messager de Sulfuron",

--Naxxramas
		["Anub'Rekhan"] = "Anub'Rekhan",
		["Deathknight Understudy"] = "Doublure de chevalier de la mort",
		["Feugen"] = "Feugen",
		["Four Horsemen Chest"] = "Coffre des quatre cavaliers",
		["Gluth"] = "Gluth",
		["Gothik the Harvester"] = "Gothik le Moissonneur",
		["Grand Widow Faerlina"] = "Grande veuve Faerlina",
		["Grobbulus"] = "Grobbulus",
		["Heigan the Unclean"] = "Heigan l'Impur",
		["Highlord Mograine"] = "Généralissime Mograine",
		["Instructor Razuvious"] = "Instructeur Razuvious",
		["Kel'Thuzad"] = "Kel'Thuzad",
		["Lady Blaumeux"] = "Dame Blaumeux",
		["Loatheb"] = "Horreb",
		["Maexxna"] = "Maexxna",
		["Noth the Plaguebringer"] = "Noth le Porte-peste",
		["Patchwerk"] = "Le Recousu",
		["Sapphiron"] = "Saphiron",
		["Sir Zeliek"] = "Sire Zeliek",
		["Stalagg"] = "Stalagg",
		["Thaddius"] = "Thaddius",
		["Thane Korth'azz"] = "Thane Korth'azz",
		["The Four Horsemen"] = "Les quatre cavaliers",

--Onyxia's Lair
		["Onyxia"] = "Onyxia",

--Ragefire Chasm
		["Bazzalan"] = "Bazzalan",
		["Jergosh the Invoker"] = "Jergosh l'Invocateur",
		["Maur Grimtotem"] = "Maur Totem-sinistre",
		["Taragaman the Hungerer"] = "Taragaman l'Affameur",

--Razorfen Downs
		["Amnennar the Coldbringer"] = "Amnennar le Porte-froid",
		["Glutton"] = "Glouton",
		["Mordresh Fire Eye"] = "Mordresh Oeil-de-feu",
		["Plaguemaw the Rotting"] = "Pestegueule le Pourrissant",
		["Ragglesnout"] = "Groinfendu",
		["Tuten'kash"] = "Tuten'kash",

--Razorfen Kraul
		["Agathelos the Raging"] = "Agathelos le Déchaîné",
		["Blind Hunter"] = "Chasseur aveugle",
		["Charlga Razorflank"] = "Charlga Trancheflanc",
		["Death Speaker Jargba"] = "Nécrorateur Jargba",
		["Earthcaller Halmgar"] = "Implorateur de la terre Halmgar",
		["Overlord Ramtusk"] = "Seigneur Brusquebroche",

--Ruins of Ahn'Qiraj
		["Anubisath Guardian"] = "Gardien Anubisath",
		["Ayamiss the Hunter"] = "Ayamiss le Chasseur",
		["Buru the Gorger"] = "Buru Grandgosier",
		["General Rajaxx"] = "Général Rajaxx",
		["Kurinnaxx"] = "Kurinnaxx",
		["Lieutenant General Andorov"] = "Général de division Andorov",
		["Moam"] = "Moam",
		["Ossirian the Unscarred"] = "Ossirian l'Intouché",

--Scarlet Monastery
--Armory
		["Herod"] = "Hérode",
--Cathedral
		["High Inquisitor Fairbanks"] = "Grand Inquisiteur Fairbanks",
		["High Inquisitor Whitemane"] = "Grand Inquisiteur Blanchetête",
		["Scarlet Commander Mograine"] = "Commandant écarlate Mograine",
--Graveyard
		["Azshir the Sleepless"] = "Azshir le Sans-sommeil",
		["Bloodmage Thalnos"] = "Mage de sang Thalnos",
		["Fallen Champion"] = "Champion mort",
		["Headless Horseman"] = "Cavalier sans tête",
		["Interrogator Vishas"] = "Interrogateur Vishas",
		["Ironspine"] = "Echine-de-fer",
--Library
		["Arcanist Doan"] = "Arcaniste Doan",
		["Houndmaster Loksey"] = "Maître-chien Loksey",

--Scholomance
		["Blood Steward of Kirtonos"] = "Régisseuse sanglante de Kirtonos",
		["Darkmaster Gandling"] = "Sombre Maître Gandling",
		["Death Knight Darkreaver"] = "Chevalier de la mort Ravassombre",
		["Doctor Theolen Krastinov"] = "Docteur Theolen Krastinov",
		["Instructor Malicia"] = "Instructeur Malicia",
		["Jandice Barov"] = "Jandice Barov",
		["Kirtonos the Herald"] = "Kirtonos le Héraut",
		["Kormok"] = "Kormok",
		["Lady Illucia Barov"] = "Dame Illucia Barov",
		["Lord Alexei Barov"] = "Seigneur Alexei Barov",
		["Lorekeeper Polkelt"] = "Gardien du savoir Polkelt",
		["Marduk Blackpool"] = "Marduk Noirétang",
		["Ras Frostwhisper"] = "Ras Murmegivre",
		["Rattlegore"] = "Cliquettripes",
		["The Ravenian"] = "Le Voracien",
		["Vectus"] = "Vectus",

--Shadowfang Keep
		["Archmage Arugal"] = "Archimage Arugal",
		["Arugal's Voidwalker"] = "Marcheur du Vide d'Arugal",
		["Baron Silverlaine"] = "Baron d'Argelaine",
		["Commander Springvale"] = "Commandant Springvale",
		["Deathsworn Captain"] = "Capitaine Ligemort",
		["Fenrus the Devourer"] = "Fenrus le Dévoreur",
		["Odo the Blindwatcher"] = "Odo l'Aveugle",
		["Razorclaw the Butcher"] = "Tranchegriffe le Boucher",
		["Wolf Master Nandos"] = "Maître-loup Nandos",

--Stratholme
		["Archivist Galford"] = "Archiviste Galford",
		["Balnazzar"] = "Balnazzar",
		["Baron Rivendare"] = "Baron Vaillefendre",
		["Baroness Anastari"] = "Baronne Anastari",
		["Black Guard Swordsmith"] = "Fabricant d'épées de la Garde noire",
		["Cannon Master Willey"] = "Maître canonnier Willey",
		["Crimson Hammersmith"] = "Forgeur de marteaux cramoisi",
		["Fras Siabi"] = "Fras Siabi",
		["Hearthsinger Forresten"] = "Chanteloge Forrestin",
		["Magistrate Barthilas"] = "Magistrat Barthilas",
		["Maleki the Pallid"] = "Maleki le Blafard",
		["Nerub'enkan"] = "Nerub'enkan",
		["Postmaster Malown"] = "Postier Malown",
		["Ramstein the Gorger"] = "Ramstein Grandgosier",
		["Skul"] = "Krân",
		["Stonespine"] = "Echine-de-pierre",
		["The Unforgiven"] = "Le Condamné",
		["Timmy the Cruel"] = "Timmy le Cruel",

--Sunwell Plateau
		["Kalecgos"] = "Kalecgos",
		["Sathrovarr the Corruptor"] = "Sathrovarr le Corrupteur",
		["Brutallus"] = "Brutallus",
		["Felmyst"] = "Gangrebrume",
		["Kil'jaeden"] = "Kil'jaeden",
		["M'uru"] = "M'uru",
		["Entropius"] = "Entropius",
		["The Eredar Twins"] = "Les jumelles érédars",
		["Lady Sacrolash"] = "Dame Sacrocingle",
		["Grand Warlock Alythess"] = "Grande démoniste Alythess",

--Tempest Keep
--The Arcatraz
		["Dalliah the Doomsayer"] = "Dalliah l'Auspice-funeste",
		["Harbinger Skyriss"] = "Messager Cieuriss",
		["Warden Mellichar"] = "Gardien Mellichar",
		["Wrath-Scryer Soccothrates"] = "Scrute-courroux Soccothrates",
		["Zereketh the Unbound"] = "Zereketh le Délié",
--The Botanica
		["Commander Sarannis"] = "Commandant Sarannis",
		["High Botanist Freywinn"] = "Grand botaniste Freywinn",
		["Laj"] = "Laj",
		["Thorngrin the Tender"] = "Rirépine le Tendre",
		["Warp Splinter"] = "Brise-dimension",
--The Eye
		["Al'ar"] = "Al'ar",
		["Cosmic Infuser"] = "Masse d'infusion cosmique",
		["Devastation"] = "Dévastation",
		["Grand Astromancer Capernian"] = "Grande astromancienne Capernian",
		["High Astromancer Solarian"] = "Grande astromancienne Solarian",
		["Infinity Blades"] = "Lames d'infinité",
		["Kael'thas Sunstrider"] = "Kael'thas Haut-soleil",
		["Lord Sanguinar"] = "Seigneur Sanguinar",
		["Master Engineer Telonicus"] = "Maître ingénieur Telonicus",
		["Netherstrand Longbow"] = "Arc long brins-de-Néant",
		["Phaseshift Bulwark"] = "Rempart de déphasage",
		["Solarium Agent"] = "Agent du Solarium",
		["Solarium Priest"] = "Prêtre du Solarium",
		["Staff of Disintegration"] = "Bâton de désintégration",
		["Thaladred the Darkener"] = "Thaladred l'Assombrisseur",
		["Void Reaver"] = "Saccageur du Vide",
		["Warp Slicer"] = "Tranchoir dimensionnel",
--The Mechanar
		["Gatewatcher Gyro-Kill"] = "Gardien de porte Gyro-Meurtre",
		["Gatewatcher Iron-Hand"] = "Gardien de porte Main-en-fer",
		["Mechano-Lord Capacitus"] = "Mécano-seigneur Capacitus",
		["Nethermancer Sepethrea"] = "Néantomancien Sepethrea",
		["Pathaleon the Calculator"] = "Pathaleon le Calculateur",

--The Deadmines
		["Brainwashed Noble"] = "Noble manipulé",
		["Captain Greenskin"] = "Capitaine Vertepeau",
		["Cookie"] = "Macaron",
		["Edwin VanCleef"] = "Edwin VanCleef",
		["Foreman Thistlenettle"] = "Contremaître Crispechardon",
		["Gilnid"] = "Gilnid",
		["Marisa du'Paige"] = "Marisa du'Paige",
		["Miner Johnson"] = "Mineur Johnson",
		["Mr. Smite"] = "M. Châtiment",
		["Rhahk'Zor"] = "Rhahk'Zor",
		["Sneed"] = "Sneed",
		["Sneed's Shredder"] = "Déchiqueteur de Sneed",

--The Stockade
		["Bazil Thredd"] = "Bazil Thredd",
		["Bruegal Ironknuckle"] = "Bruegal Poing-de-fer",
		["Dextren Ward"] = "Dextren Ward",
		["Hamhock"] = "Hamhock",
		["Kam Deepfury"] = "Kam Furie-du-fond",
		["Targorr the Dread"] = "Targorr le Terrifiant",

--The Temple of Atal'Hakkar
		["Atal'alarion"] = "Atal'alarion",
		["Avatar of Hakkar"] = "Avatar d'Hakkar",
		["Dreamscythe"] = "Fauche-rêve",
		["Gasher"] = "Gasher",
		["Hazzas"] = "Hazzas",
		["Hukku"] = "Hukku",
		["Jade"] = "Jade",
		["Jammal'an the Prophet"] = "Jammal'an le prophète",
		["Kazkaz the Unholy"] = "Kazkaz l'Impie",
		["Loro"] = "Loro",
		["Mijan"] = "Mijan",
		["Morphaz"] = "Morphaz",
		["Ogom the Wretched"] = "Ogom le Misérable",
		["Shade of Eranikus"] = "Ombre d'Eranikus",
		["Veyzhak the Cannibal"] = "Veyzhak le Cannibale",
		["Weaver"] = "Tisserand",
		["Zekkis"] = "Zekkis",
		["Zolo"] = "Zolo",
		["Zul'Lor"] = "Zul'Lor",

--Uldaman
		["Ancient Stone Keeper"] = "Ancien Gardien des pierres",
		["Archaedas"] = "Archaedas",
		["Baelog"] = "Baelog",
		["Digmaster Shovelphlange"] = "Maître des fouilles Pellaphlange",
		["Galgann Firehammer"] = "Galgann Martel-de-feu",
		["Grimlok"] = "Grimlok",
		["Ironaya"] = "Ironaya",
		["Obsidian Sentinel"] = "Sentinelle d'obsidienne",
		["Revelosh"] = "Revelosh",

-- Ulduar
-- Halls of Lightning
		["General Bjarngrim"] = "Général Bjarngrim",
		["Ionar"] = "Ionar",
		["Loken"] = "Loken",
		["Volkhan"] = "Volkhan",
-- Halls of Stone
		["Krystallus"] = "Krystallus",
		["Maiden of Grief"] = "Damoiselle de peine",
		["Sjonnir the Ironshaper"] = "Sjonnir le Sculptefer",
		["The Tribunal of Ages"] = "Le tribunal des Âges",

-- The Violet Hold
		["Cyanigosa"] = "Cyanigosa",
		["Erekem"] = "Erekem",
		["Ichoron"] = "Ichoron",
		["Lavanthor"] = "Lavanthor",
		["Moragg"] = "Moragg",
		["Xevozz"] = "Xevozz",
		["Zuramat the Obliterator"] = "Zuramat l'Oblitérateur",

--Wailing Caverns
		["Boahn"] = "Boahn",
		["Deviate Faerie Dragon"] = "Dragon féérique déviant",
		["Kresh"] = "Kresh",
		["Lady Anacondra"] = "Dame Anacondra",
		["Lord Cobrahn"] = "Seigneur Cobrahn",
		["Lord Pythas"] = "Seigneur Pythas",
		["Lord Serpentis"] = "Seigneur Serpentis",
		["Mad Magglish"] = "Magglish le Dingue",
		["Mutanus the Devourer"] = "Mutanus le Dévoreur",
		["Skum"] = "Skum",
		["Trigore the Lasher"] = "Trigore le Flagelleur",
		["Verdan the Everliving"] = "Verdan l'Immortel",

--World Bosses
		["Avalanchion"] = "Avalanchion",
		["Azuregos"] = "Azuregos",
		["Baron Charr"] = "Baron Charr",
		["Baron Kazum"] = "Baron Kazum",
		["Doom Lord Kazzak"] = "Seigneur funeste Kazzak",
		["Doomwalker"] = "Marche-funeste",
		["Emeriss"] = "Emeriss",
		["High Marshal Whirlaxis"] = "Haut maréchal Trombe",
		["Lethon"] = "Léthon",
		["Lord Skwol"] = "Seigneur Skwol",
		["Prince Skaldrenox"] = "Prince Skaldrenox ",
		["Princess Tempestria"] = "Princesse Tempestria",
		["Taerar"] = "Taerar",
		["The Windreaver"] = "Ouraganien",
		["Ysondre"] = "Ysondre",

--Zul'Aman
		["Akil'zon"] = "Akil'zon",
		["Halazzi"] = "Halazzi",
		["Jan'alai"] = "Jan'alai",
		["Malacrass"] = "Malacrass",
		["Nalorakk"] = "Nalorakk",
		["Zul'jin"] = "Zul'jin",
		["Hex Lord Malacrass"] = "Seigneur des maléfices Malacrass",

--Zul'Farrak
		["Antu'sul"] = "Antu'sul",
		["Chief Ukorz Sandscalp"] = "Chef Ukorz Scalpessable",
		["Dustwraith"] = "Ame en peine poudreuse",
		["Gahz'rilla"] = "Gahz'rilla",
		["Hydromancer Velratha"] = "Hydromancienne Velratha",
		["Murta Grimgut"] = "Murta Mornentraille",
		["Nekrum Gutchewer"] = "Nekrum Mâchetripes",
		["Oro Eyegouge"] = "Oro Crève-oeil ",
		["Ruuzlu"] = "Ruuzlu",
		["Sandarr Dunereaver"] = "Sandarr Ravadune",
		["Sandfury Executioner"] = "Bourreau Furie-des-sables",
		["Sergeant Bly"] = "Sergent Bly",
		["Shadowpriest Sezz'ziz"] = "Prêtre des ombres Sezz'ziz",
		["Theka the Martyr"] = "Theka le Martyr",
		["Witch Doctor Zum'rah"] = "Sorcier-docteur Zum'rah",
		["Zerillis"] = "Zerillis",
		["Zul'Farrak Dead Hero"] = "Héros mort de Zul'Farrak",

-- Zul'Drak
-- Gundrak
		["Eck the Ferocious"] = "Eck le Féroce",
		["Drakkari Colossus"] = "Colosse drakkari",
		["Gal'darah"] = "Gal'darah",
		["Moorabi"] = "Moorabi",
		["Slad'ran"] = "Slad'ran",

--Zul'Gurub
		["Bloodlord Mandokir"] = "Seigneur sanglant Mandokir",
		["Gahz'ranka"] = "Gahz'ranka",
		["Gri'lek"] = "Gri'lek",
		["Hakkar"] = "Hakkar",
		["Hazza'rah"] = "Hazza'rah",
		["High Priest Thekal"] = "Grand prêtre Thekal",
		["High Priest Venoxis"] = "Grand prêtre Venoxis",
		["High Priestess Arlokk"] = "Grande prêtresse Arlokk",
		["High Priestess Jeklik"] = "Grande prêtresse Jeklik",
		["High Priestess Mar'li"] = "Grande prêtresse Mar'li",
		["Jin'do the Hexxer"] = "Jin'do le Maléficieur",
		["Renataki"] = "Renataki",
		["Wushoolay"] = "Wushoolay",

--Ring of Blood (where? an instance? should be in other file?)
		["Brokentoe"] = "Brisorteil",
		["Mogor"] = "Mogor",
		["Murkblood Twin"] = "Jumeau bourbesang",
		["Murkblood Twins"] = "Jumeaux bourbesang",
		["Rokdar the Sundered Lord"] = "Rokdar le Seigneur scindé",
		["Skra'gath"] = "Skra'gath",
		["The Blue Brothers"] = "Les Grands Bleus",
		["Warmaul Champion"] = "Champion Cogneguerre",
	}
end)

BabbleBoss:Debug()
BabbleBoss:SetStrictness(true)

function BabbleBoss:Contains(name)
	if bosses[name] or bosses[self:HasReverseTranslation(name) and self:GetReverseTranslation(name) or false] then
		return true
	end
	return false
end

AceLibrary:Register(BabbleBoss, MAJOR_VERSION, MINOR_VERSION)
BabbleBoss = nil
