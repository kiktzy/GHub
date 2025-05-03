--[[
Nama Script: Auto Farm Otomatis (Level 1 - Max) dengan UI Status
Deskripsi: Script otomatis untuk farming dari level 1 hingga level maksimal dengan UI status sederhana.
Pembuat: kiktzy
Tanggal: 3 Mei 2025
Lokasi: Jogja, Indonesia
--]]

-- Konfigurasi Awal (Jangan diubah kecuali Anda tahu apa yang Anda lakukan)
_G.Fast_Delay = 0.1
_G.Setting_table = {
    Auto_Farm = true, -- Aktifkan auto farm secara default
    Farm_Mode = "Closest", -- Mode farming default
    Specific_Mob = "Marine", -- Target mob default
    Auto_Collect_Chests = true, -- Aktifkan koleksi peti otomatis secara default
    Auto_Sell_Items = true, -- Aktifkan penjualan item otomatis secara default
    Items_To_Sell = {"Old World Chest"}, -- Item yang akan dijual
    Auto_Quest = true, -- Aktifkan auto quest secara default
    Quest_NPC = "Marine Captain", -- NPC quest default
    Auto_Upgrade_Stats = true, -- Aktifkan auto upgrade stats secara default
    Stats_Focus = "Melee", -- Fokus stat default
    Auto_Buy_Haki = true, -- Aktifkan auto beli Haki jika tersedia
    Haki_Color = "White", -- Warna Haki default
    Auto_Buy_Skills = true, -- Aktifkan auto beli skill jika tersedia
    Weapon = "Saber", -- Senjata default
    Next_Melee = false,
    Melee_Hop = false,
    Mink_Evo = false,
    Human_Evo = false,
    Skypiea_Evo = false,
    Fishman_Evo = false,
    Next_Race = false,
    Race_Hop = false,
    -- Status Penyelesaian (Jangan diubah secara manual)
    Mink_Evo_H = false,
    Human_Evo_H = false,
    Skypiea_Evo_H = false,
    Fishman_Evo_H = false,
    Mink_Evo_V2 = false,
    Human_Evo_V2 = false,
    Skypiea_Evo_V2 = false,
    Fishman_Evo_V2 = false,
    Level_Maxed = false,
}
_G.MyName = game:GetService("Players").LocalPlayer.Name
local UI = Instance.new("ScreenGui")
UI.Name = "AutoFarmStatusUI"
UI.Parent = game:GetService("CoreGui")
local StatusFrame = Instance.new("Frame")
StatusFrame.Name = "StatusFrame"
StatusFrame.Size = UDim2.new(0.2, 0, 0.15, 0)
StatusFrame.Position = UDim2.new(0.05, 0, 0.8, 0)
StatusFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = UI
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, 0, 0.33, 0)
StatusLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.TextSize = 16
StatusLabel.Text = "Status: Inisialisasi..."
StatusLabel.AnchorPoint = Vector2.new(0.5, 0)
StatusLabel.Position = UDim2.new(0.5, 0, 0, 0)
StatusLabel.Parent = StatusFrame
local LevelLabel = Instance.new("TextLabel")
LevelLabel.Name = "LevelLabel"
LevelLabel.Size = UDim2.new(1, 0, 0.33, 0)
LevelLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LevelLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LevelLabel.Font = Enum.Font.SourceSans
LevelLabel.TextSize = 14
LevelLabel.Text = "Level: ?"
LevelLabel.AnchorPoint = Vector2.new(0.5, 0)
LevelLabel.Position = UDim2.new(0.5, 0, 0.33, 0)
LevelLabel.Parent = StatusFrame
local ModeLabel = Instance.new("TextLabel")
ModeLabel.Name = "ModeLabel"
ModeLabel.Size = UDim2.new(1, 0, 0.34, 0)
ModeLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ModeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeLabel.Font = Enum.Font.SourceSans
ModeLabel.TextSize = 14
ModeLabel.Text = "Mode: Otomatis"
ModeLabel.AnchorPoint = Vector2.new(0.5, 0)
ModeLabel.Position = UDim2.new(0.5, 0, 0.66, 0)
ModeLabel.Parent = StatusFrame

-- Fungsi-fungsi Utama (Sama seperti sebelumnya)
local function EquipWeapon(weaponName)
    -- Implementasi equip senjata
end
local function AttackNoCD()
    -- Implementasi serangan tanpa cooldown
end
local function TP(cf)
    -- Implementasi teleport
end
local function TP2(cf)
    -- Implementasi teleport 2 (mungkin untuk navigasi)
end
local function Text(msg)
    StatusLabel.Text = "Status: " .. msg
end
local function Update_Setting(playerName)
    -- Implementasi penyimpanan setting (mungkin tidak terlalu relevan di mode otomatis)
end
local function HopServer()
    -- Implementasi server hop
end
local function Raid_FG()
    -- Implementasi raid untuk mendapatkan fragment
end
local function UseFruit(fruitName)
    -- Implementasi penggunaan buah
end
local function AwakenSkill(skillKey)
    -- Implementasi awakening skill
end
local function BuyHaki(color)
    -- Implementasi pembelian Haki
end
local function BuySkill(skillName)
    -- Implementasi pembelian skill
end
local function UpgradeStat(stat)
    -- Implementasi upgrade stat
end
local function GetClosestEnemy(range)
    -- Implementasi mendapatkan musuh terdekat
end
local function GetSpecificEnemy(name)
    -- Implementasi mendapatkan musuh spesifik
end
local function CollectChests()
    -- Implementasi koleksi peti
end
local function SellItems(items)
    -- Implementasi penjualan item
end
local function AcceptQuest(npcName)
    -- Implementasi menerima quest
end
local function CheckQuestStatus(npcName)
    -- Implementasi pengecekan status quest
end
local function GetFightingStyle(styleName)
    -- Implementasi mendapatkan fighting style
end

-- Loop Utama untuk Farming Otomatis
spawn(function()
    while wait(1) and not _G.Setting_table.Level_Maxed do
        local level = game.Players.LocalPlayer.Data.Level.Value
        LevelLabel.Text = "Level: " .. level

        if _G.Setting_table.Auto_Farm then
            local target
            if _G.Setting_table.Farm_Mode == "Closest" then
                target = GetClosestEnemy(50) -- Sesuaikan range
            elseif _G.Setting_table.Farm_Mode == "Specific" then
                target = GetSpecificEnemy(_G.Setting_table.Specific_Mob)
            end

            if target and target.Humanoid.Health > 0 then
                Text("Farming " .. (target.Name or "Target"))
                TP(target.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
                EquipWeapon(_G.Setting_table.Weapon)
                AttackNoCD()
            elseif not target then
                Text("Mencari target...")
            end
        end

        if _G.Setting_table.Auto_Collect_Chests then
            CollectChests()
        end

        if _G.Setting_table.Auto_Sell_Items then
            SellItems(_G.Setting_table.Items_To_Sell)
        end

        if _G.Setting_table.Auto_Quest then
            AcceptQuest(_G.Setting_table.Quest_NPC)
            -- Mungkin perlu logika lebih lanjut untuk menyelesaikan quest
        end

        if _G.Setting_table.Auto_Upgrade_Stats then
            local statsFocus = _G.Setting_table.Stats_Focus
            UpgradeStat(statsFocus)
        end

        -- Tambahkan logika otomatis untuk membeli Haki, Skill, Fighting Style, Penggunaan Buah, Awakening Buah di sini
        -- Berdasarkan level atau kondisi tertentu.

        if level >= game:GetService("Players").LocalPlayer.Data.MaxLevel.Value then
            _G.Setting_table.Level_Maxed = true
            Text("Level Maksimal Tercapai!")
        end
    end
    Text("Otomatisasi Level Selesai.")
end)

-- Loop untuk Evolusi Ras (Sama seperti sebelumnya, akan berjalan otomatis jika diaktifkan di _G.Setting_table)
spawn(function()
    while wait(.5) do
        pcall(function()
            -- Logika Evolusi Mink
            if _G.Setting_table.Mink_Evo and not _G.Setting_table.Mink_Evo_H and game.Players.LocalPlayer.Data.Race.Value == 'Mink' then
                -- ... (Logika Evolusi Mink V0-V3) ...
            -- Logika Evolusi Human
            elseif _G.Setting_table.Human_Evo and not _G.Setting_table.Human_Evo_H and game.Players.LocalPlayer.Data.Race.Value == 'Human' then
                -- ... (Logika Evolusi Human V0-V3) ...
            -- Logika Evolusi Skypiea
            elseif _G.Setting_table.Skypiea_Evo and not _G.Setting_table.Skypiea_Evo_H and game.Players.LocalPlayer.Data.Race.Value == 'Skypiea' then
                -- ... (Logika Evolusi Skypiea V0-V3) ...
            -- Logika Evolusi Fishman
            elseif _G.Setting_table.Fishman_Evo and not _G.Setting_table.Fishman_Evo_H and game.Players.LocalPlayer.Data.Race.Value == 'Fishman' then
                -- ... (Logika Evolusi Fishman V0-V3) ...
            -- Logika Next Race (Reroll Otomatis)
            elseif _G.Setting_table.Next_Race and _G.Setting_table.Mink_Evo and not _G.Setting_table.Mink_Evo_H and game.Players.LocalPlayer.Data.Race.Value ~= 'Mink' then
                -- ... (Logika Reroll Mink) ...
            elseif _G.Setting_table.Next_Race and _G.Setting_table.Human_Evo and not _G.Setting_table.Human_Evo_H and game.Players.LocalPlayer.Data.Race.Value ~= 'Human' then
                -- ... (Logika Reroll Human) ...
            elseif _G.Setting_table.Next_Race and _G.Setting_table.Skypiea_Evo and not _G.Setting_table.Skypiea_Evo_H and game.Players.LocalPlayer.Data.Race.Value ~= 'Skypiea' then
                -- ... (Logika Reroll Skypiea) ...
            elseif _G.Setting_table.Next_Race and _G.Setting_table.Fishman_Evo and not _G.Setting_table.Fishman_Evo_H and game.Players.LocalPlayer.Data.Race.Value ~= 'Fishman' then
                -- ... (Logika Reroll Fishman) ...
            elseif _G.Setting_table.Mink_Evo_H and _G.Setting_table.Fishman_Evo_H and _G.Setting_table.Skypiea_Evo_H and _G.Setting_table.Human_Evo_H then
                Text("อีโวเผ่าขั้น 3 ครบทั้ง4เผ่าแล้ว")
                wait(10)
            else
                wait(2)
            end
        end)
    end
end)

-- Implementasi fungsi-fungsi yang dibutuhkan (Ini hanya contoh dasar, perlu disesuaikan dengan game)
function EquipWeapon(weaponName)
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    local character = player.Character
    if character and character:FindFirstChild(weaponName) then
        -- Sudah memegang senjata
        return
    elseif backpack:FindFirstChild(weaponName) then
        local weapon = backpack:FindFirstChild(weaponName)
        game:GetService("ReplicatedStorage").Remotes.Equip:FireServer(weapon)
    else
        Text("Senjata '" .. weaponName .. "' tidak ditemukan.")
    end
end

function AttackNoCD()
    local virtualInput = game:GetService("VirtualInputManager")
    virtualInput:SendKeyEvent(true, Enum.KeyCode.X, false, false) -- Contoh tombol serang 'X'
    wait(_G.Fast_Delay)
    virtualInput:SendKeyEvent(false, Enum.KeyCode.X, false, false)
end

function TP(cf)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cf
end

function TP2(cf)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cf
end

function GetClosestEnemy(range)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPart = character.HumanoidRootPart
    local closest = nil
    local minDist = range

    for i, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v ~= character and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            local dist = (rootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if dist < minDist then
                closest = v
                minDist = dist
            end
        end
    end
    return closest
end

function GetSpecificEnemy(name)
    for i, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name:find(name) and v.Humanoid.Health > 0 then
            return v
        end
    end
    return nil
end

function CollectChests()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = character.HumanoidRootPart
    local collectionRadius = 15 -- Sesuaikan radius koleksi

    for i, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v.Name:find("Chest") and not v:FindFirstChild("Collected") then
            local dist = (rootPart.Position - v:GetExtentsSize()).Magnitude -- Perkiraan posisi tengah peti
            if dist < collectionRadius then
                fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"))
                Instance.new("BoolValue", v).Name = "Collected" -- Tandai peti sebagai terkumpul
            end
        end
    end
end

function SellItems(items)
    local player = game.Players.LocalPlayer
    for _, itemName in pairs(items) do
        for i = 1, #player.Backpack:GetChildren() do
            local item = player.Backpack:GetChildren()[i]
            if item and item.Name == itemName then
                game:GetService("ReplicatedStorage").Remotes.SellItem:FireServer(item)
                wait(0.5) -- Beri jeda antar penjualan
            end
        end
    end
end

function AcceptQuest(npcName)
    for i, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v.Name:find(npcName) then
            fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"))
            wait(1) -- Beri jeda setelah interaksi
            -- Mungkin perlu logika tambahan untuk memilih dan menerima quest di UI NPC
            break
        end
    end
end

function UpgradeStat(stat)
    local player = game.Players.LocalPlayer
    local stats = player.Data
    local statPoints = stats.StatPoints.Value
    if statPoints > 0 then
        game:GetService("ReplicatedStorage").Remotes.UpgradeStat:FireServer(stat)
        wait(0.2)
    end
end

-- Implementasi fungsi-fungsi lain yang dibutuhkan (BuyHaki, BuySkill, UseFruit, AwakenSkill, GetFightingStyle) perlu ditambahkan di sini.
-- ...

print("Auto Farm Script oleh kiktzy")
