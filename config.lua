Config = {}

-- Jail Config
JailMinTime = 10 -- Minimum Time allowed for jailing. Default: 10
JailMaxTime = 600 -- Maximum Time Allowed for jailing.  Default: 600
JailPermissions = false -- Jail Permission system.  Add ls_jailnhospitalize.jail to your group. (true | false) Default: false
UnjailPermissions = true -- Should /unjail require permissions?  Add ls_jailnhospitalize.unjail to your group if true (true | false) Default: true


-- Hospitalize Config
ERMinTime = 10 -- Minimum Time allowed for hospitalization.  Default: 10
ERMaxTime = 300 -- Maximum Time allowed for hospitalization.  Default: 300
ERPermissions = false -- ER Permission system.  Add ls_jailnhospitalize.er to your group. (true | false) Default: false
