# qb-ForceLocks
Allows players within a job (Defined in the config.lua) to gain access to vehicles.<br />

Step 1: Head over to resources/[qb]/qb-core/shared/items.lua and add:
```
["blowtorch"]	= {["name"] = "blowtorch", ["label"] = "Blowtorch", ["weight"] = 1000, ["type"] = "item", ["image"] = "blowtorch.png", ["unique"] = true, ["useable"] = true, ['shouldClose'] = true, ["combinable"] = nil, ["description"] = "Used to access cars" },
```

Step 2: Copy the "blowtorch.png" image provided into resources/[qb]/qb-inventory/html/images/

Step 3: Extract/copy the qb-ForceLocks folder into your resources/[qb-addons]/  folder.

Step 4: Restart your server.<br /><br />

Now you can use the blowtorch item while next to a locked vehicle to gain keys to that vehicle if you're PD or a Mechanic.  Feel free to add or remove jobs in the Config.lua.
