Config = {}

Config.pose = {
    boss = vector3(-204.1329, -1327.6769, 34.89),
    coffre = vector3(-219.0723, -1321.1472, 30.8904),
    garage = vector3(-201.5787, -1309.7495, 31.2921),
    spawn = vector4( -199.7032, -1305.8346, 31.3552, 339.0874),
    delete = vector3( -176.8531, -1301.3336, 31.3259),
    shop = vector3( -198.5255, -1315.2894, 31.0893),
    vestiere = vector3( -224.0918, -1320.0071, 30.8904),
}
Config.item = {
    nettoyage = "chiffon",
    repa = "crick"
}

Config.society = "society_lscustom"
Config.JobUtiliser = "lscustom"
Config.gradejobboss = "boss"

Config.NotificationType = "esx" -- esx -- ox -- okok

Vehicle = {

    {name = "flatbed", label = "remorqueuse",prix = 0, image = "https://th.bing.com/th/id/OIP.biL_85njpeO7RhUoVwhiuwHaEI?pid=ImgDet&rs=1"},
    {name = "sultan", label = "sultan", prix = 0, image = "https://th.bing.com/th/id/OIP.Y81iD-rchbI4716vthG9JAHaEK?pid=ImgDet&rs=1"},
}

Config.blips = {
    title = "mecano",
    colour = 38,
    id = 402, ---https://docs.fivem.net/docs/game-references/blips/
    x = -205.7231, 
    y = -1309.4603, 
    z = 31.2931 
}

Bar = {
    {name = "crick", label = "Crick",prix = 10, image = "https://th.bing.com/th/id/OIP.tSYbZdGi5AhYbefFfYEOMgHaHg?pid=ImgDet&rs=1"},
    {name = "chiffon", label = "Chiffon",prix = 10, image = "https://i.pinimg.com/originals/18/7d/60/187d607b1c9e3a7afde219d7a9f624e8.jpg"},
}

Config.travail = {
    male = {
        ['bags_1'] = 12, ['bags_2'] = 16,
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 70, ['torso_2'] = 2,
        ['arms'] = 0,
        ['pants_1'] = 77, ['pants_2'] = 2,
        ['shoes_1'] = 107, ['shoes_2'] = 0,
        ['mask_1'] = 0, ['mask_2'] = 0,
        ['bproof_1'] = 0,
        ['chain_1'] = 23,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
    },
    
    female = {
        ['bags_1'] = 0, ['bags_2'] = 0,
        ['tshirt_1'] = 15, ['tshirt_2'] = 2,
        ['torso_1'] = 65, ['torso_2'] = 2,
        ['arms'] = 36, ['arms_2'] = 0,
        ['pants_1'] = 38, ['pants_2'] = 2,
        ['shoes_1'] = 12, ['shoes_2'] = 6,
        ['mask_1'] = 0, ['mask_2'] = 0,
        ['bproof_1'] = 0,
        ['chain_1'] = 0,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
    }
}