local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3")

local Tab = Window:NewTab("teleport")

local Section = Tab:NewSection("Cheat by roma")

Section:NewButton("end", "ButtonInfo", function()
workspace.alredyinuse97.HumanoidRootPart.CFrame = CFrame.new(-209.186722, 530.234497, -1843.97095, 0.378204674, 1.56058224e-08, -0.925722003, 1.03016387e-08, 1, 2.10667466e-08, 0.925722003, -1.75039947e-08, 0.378204674)
end)

Section:NewButton("trollbutton", "ButtonInfo", function()
workspace.alredyinuse97.HumanoidRootPart.CFrame = CFrame.new(-374.685303, 151.162949, -1872.98218, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

Section:NewButton("activate platforms", "ButtonInfo", function()
wait(0.1)
workspace.alredyinuse97.HumanoidRootPart.CFrame = CFrame.new(-378.343933, 150.591476, -1847.57068, 1, 0, 0, 0, 1, 0, 0, 0, 1)
wait(0.2)
workspace.alredyinuse97.HumanoidRootPart.CFrame = CFrame.new(-378.343933, 150.591476, -1837.57068, 1, 0, 0, 0, 1, 0, 0, 0, 1)
wait(0.2)
workspace.alredyinuse97.HumanoidRootPart.CFrame = CFrame.new(-378.343933, 150.591476, -1827.57068, 1, 0, 0, 0, 1, 0, 0, 0, 1)
wait(0.2)
workspace.alredyinuse97.HumanoidRootPart.CFrame = CFrame.new(-374.685303, 151.162949, -1872.98218, 1, 0, 0, 0, 1, 0, 0, 0, 11)
end)

local Tab = Window:NewTab("player")

local Section = Tab:NewSection("BY roma")

Section:NewSlider("speed", "SliderInfo", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("jump", "SliderInfo", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewButton("esp", "ButtonInfo", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))()
end)
