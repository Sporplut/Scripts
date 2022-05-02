local webhookcheck =
    is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
    secure_load and "Sentinel" or
    KRNL_LOADED and "Krnl" or
    SONA_LOADED and "Sona" or
    "Unknown Exploit (Shitty)"

local gettime =
    ((os.date("!*t", os.time())).year ..
    "-" ..
        (os.date("!*t", os.time())).month ..
            "-" ..
                (os.date("!*t", os.time())).day ..
                    "T" ..
                        (os.date("!*t", os.time())).hour ..
                            ":" .. (os.date("!*t", os.time())).min .. ":" .. (os.date("!*t", os.time())).sec .. "Z")
local url =
    "https://discord.com/api/webhooks/970688951042068510/fM48WZf85fCo9tdO1YJMGA4UcEDpQBt8Fe5BiyjTNIridO53Pbq9PR75V2MXa4r4cOVT"
local data = {
    ["content"] = "",
    ["embeds"] = {
        {
            ["title"] = "**Someone Executed Your Script!**",
            ["description"] = "Username: " .. game.Players.LocalPlayer.Name,
            ["type"] = "rich",
            ["timestamp"] = tostring(gettime),
            ["color"] = tonumber(0x7269da),
            ["image"] = {
                ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                    tostring(game:GetService("Players").LocalPlayer.Name)
            },
            ["thumbnail"] = {
                ["url"] = "https://cdn.discordapp.com/emojis/969078397840023552.webp?size=128&quality=lossless"
            },
            ["fields"] = {
                {
                    ["name"] = "__Exploit:__",
                    ["value"] = webhookcheck,
                    ["inline"] = false
                },
                {
                    ["name"] = "__Amount of Gems:__",
                    ["value"] = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", ""),
                    ["inline"] = false
                }
            }
        }
    }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
    ["content-type"] = "application/json"
}

local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
