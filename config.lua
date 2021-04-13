Config = {}

Config.Weapons = {
    -- Melee Weapons
    {weapon = 'WEAPON_BAT', item = 'bat', ammoItem = ''},
    {weapon = 'WEAPON_HATCHET', item = 'hatchet', ammoItem = ''},
    {weapon = 'WEAPON_KNUCKLE', item = 'knuckle', ammoItem = ''},
    {weapon = 'WEAPON_KNIFE', item = 'knife', ammoItem = ''},
    {weapon = 'WEAPON_SWITCHBLADE', item = 'switchblade', ammoItem = ''},
    {weapon = 'WEAPON_MACHETE', item = 'machete', ammoItem = ''},
    {weapon = 'WEAPON_NIGHTSTICK', item = 'nightstick', ammoItem = ''},
    {weapon = 'WEAPON_BATTLEAXE', item = 'battleaxe', ammoItem = ''},

    -- Handguns
    {weapon = 'WEAPON_PISTOL', item = 'pistol', ammoItem = 'ammo_pistol'},
    {weapon = 'WEAPON_COMBATPISTOL', item = 'combatpistol', ammoItem = 'ammo_pistol'},
    {weapon = 'WEAPON_STUNGUN', item = 'stungun', ammoItem = ''},
    {weapon = 'WEAPON_PISTOL50', item = 'pistol50', ammoItem = 'ammo_pistol'},
    {weapon = 'WEAPON_VINTAGEPISTOL', item = 'vintagepistol', ammoItem = 'ammo_pistol'},
    {weapon = 'WEAPON_HEAVYPISTOL', item = 'heavypistol', ammoItem = 'ammo_pistol'},
    {weapon = 'WEAPON_REVOLVER', item = 'revolver', ammoItem = 'ammo_pistol'},

    -- Submachine guns
    {weapon = 'WEAPON_MICROSMG', item = 'microsmg', ammoItem = 'ammo_smg'},
    {weapon = 'WEAPON_SMG', item = 'smg', ammoItem = 'ammo_smg'},
    {weapon = 'WEAPON_ASSAULTSMG', item = 'assaultsmg', ammoItem = 'ammo_smg'},
    {weapon = 'WEAPON_COMBATPDW', item = 'combatpdw', ammoItem = 'ammo_smg'},
    {weapon = 'WEAPON_MACHINEPISTOL', item = 'machinepistol', ammoItem = 'ammo_smg'},
    {weapon = 'WEAPON_MINISMG', item = 'minismg', ammoItem = 'ammo_smg'},

    -- Shotguns
    {weapon = 'WEAPON_PUMPSHOTGUN', item = 'pumpshotgun', ammoItem = 'ammo_shotgun'},
    {weapon = 'WEAPON_SAWNOFFSHOTGUN', item = 'sawnoffshotgun', ammoItem = 'ammo_shotgun'},
    {weapon = 'WEAPON_COMBATSHOTGUN', item = 'combatshotgun', ammoItem = 'ammo_shotgun'},

    -- Assault Rifle 
    {weapon = 'WEAPON_ASSAULTRIFLE', item = 'assaultrifle', ammoItem = 'ammo_rifle'},
    {weapon = 'WEAPON_CARBINERIFLE', item = 'carbinerifle', ammoItem = 'ammo_rifle'},
    {weapon = 'WEAPON_SPECIALCARBINE', item = 'specialcarbine', ammoItem = 'ammo_rifle'},
    {weapon = 'WEAPON_BULLPUPRIFLE', item = 'bullpuprifle', ammoItem = 'ammo_rifle'},
    {weapon = 'WEAPON_COMPACTRIFLE', item = 'compactrifle', ammoItem = 'ammo_rifle'},

    -- Light Machine Guns
    {weapon = 'WEAPON_MG', item = 'mg', ammoItem = 'ammo_lmg'},
    {weapon = 'WEAPON_COMBATMG', item = 'combatmg', ammoItem = 'ammo_lmg'},
    {weapon = 'WEAPON_GUSENBERG', item = 'gusenberg', ammoItem = 'ammo_lmg'},

    -- Sniper Rifles
    {weapon = 'WEAPON_SNIPERRIFLE', item = 'sniperrifle', ammoItem = 'ammo_sniperrifle'},
    {weapon = 'WEAPON_HEAVYSNIPER', item = 'heavysniper', ammoItem = 'ammo_sniperrifle'},

    -- Throwables
    {weapon = 'WEAPON_GRENADE', item = 'grenade', ammoItem = 'grenade'},
    {weapon = 'WEAPON_BZGAS', item = 'bzgas', ammoItem = 'bzgas'},
    {weapon = 'WEAPON_MOLOTOV', item = 'molotov', ammoItem = 'molotov'},
}

Config.WeaponComponents = {
    -- Examples below, you'll find component hashes at https://wiki.rage.mp/index.php?title=Weapons_Components

    -- {item = 'pistol_silencer', weapon = 'WEAPON_PISTOL', componentHash = 0x65EA7EBB},
    -- {item = 'assualtrifle_silencer', weapon = 'WEAPON_ASSAULTRIFLE', componentHash = 0xA73D4664},
    -- {item = 'assualtrifle_grip', weapon = 'WEAPON_ASSAULTRIFLE', componentHash = 0xC164F53}
}