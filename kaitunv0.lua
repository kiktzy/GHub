-- Konfigurasi Awal (sama seperti sebelumnya)
-- ...

-- Konfigurasi UI (Placeholder - Ganti dengan fungsi UI Delta)
local farmStatusFrame
local statusLabel
local levelLabel
local bellyLabel
local fightingStyleLabel
local masteryLabel

local function createUI()
    if isfunction(create_frame) and isfunction(create_label) then
        farmStatusFrame = create_frame({
            Position = {0.01, 0.01}, -- Contoh posisi kiri atas
            Size = {0.2, 0.2},       -- Contoh ukuran 20% layar
            BackgroundColor = {0, 0, 0, 0.8}, -- Hitam transparan
            BorderSizePixel = 2,
            BorderColor = {1, 1, 1}
        })

        statusLabel = create_label({
            Text = "Status: Idle",
            TextColor = {1, 1, 1},
            Size = {1, 0.2},
            Position = {0, 0}
        }, farmStatusFrame)

        levelLabel = create_label({
            Text = "Level: 0",
            TextColor = {1, 1, 1},
            Size = {1, 0.2},
            Position = {0, 0.2}
        }, farmStatusFrame)

        bellyLabel = create_label({
            Text = "Belly: 0",
            TextColor = {1, 1, 1},
            Size = {1, 0.2},
            Position = {0, 0.4}
        }, farmStatusFrame)

        fightingStyleLabel = create_label({
            Text = "Style: Combat",
            TextColor = {1, 1, 1},
            Size = {1, 0.2},
            Position = {0, 0.6}
        }, farmStatusFrame)

        masteryLabel = create_label({
            Text = "Mastery: 0",
            TextColor = {1, 1, 1},
            Size = {1, 0.2},
            Position = {0, 0.8}
        }, farmStatusFrame)

        print("UI Status Farm dibuat.")
        return true
    else
        print("Fungsi UI (create_frame, create_label) tidak ditemukan di Delta Executor.")
        return false
    end
end

local function updateUI()
    local player = game.Players.LocalPlayer
    if player then
        if statusLabel then
            -- Perbarui status farm berdasarkan logika script Anda
            local currentStatus = "Idle"
            local currentLevel = player.Level
            local currentBelly = getBelly()
            local currentFightingStyle = getCurrentFightingStyle()
            local currentMastery = getCurrentFightingStyleMastery()

            -- Contoh pembaruan status
            if questInfo then
                currentStatus = "Farming " .. questInfo.targetName
            elseif sea2Opened then
                currentStatus = "Di Sea 2"
            elseif -- ... status lainnya ... then
                -- currentStatus = ...
            end

            set_label_text(statusLabel, "Status: " .. currentStatus)
            set_label_text(levelLabel, "Level: " .. currentLevel)
            set_label_text(bellyLabel, "Belly: " .. currentBelly)
            set_label_text(fightingStyleLabel, "Style: " .. currentFightingStyle)
            set_label_text(masteryLabel, "Mastery: " .. currentMastery)
        end
    end
end

-- Fungsi utama auto farm dengan UI
function autoFarm()
    local player = game.Players.LocalPlayer
    if not player or not player.Character or not player.Character:FindFirstChild("Humanoid") then return end

    if createUI() then
        setFlyEnabled(true) -- Aktifkan terbang di awal
        while player.Level < targetLevelSea1 and not sea2Opened do
            -- ... (Logika farming, pembelian ability/fighting style seperti sebelumnya) ...
            updateUI() -- Perbarui UI setiap frame atau interval tertentu
            wait(farmingSpeed)
        end

        -- Proses membuka Sea 2 (tetap sama)
        -- ...
        updateUI() -- Perbarui UI setelah pindah Sea

        -- Farming di Sea 2 (jika berhasil pindah)
        if sea2Opened then
            while player.Level < 2650 do
                -- ... (Farming di Sea 2) ...
                updateUI()
                wait(farmingSpeed)
            end
        end

        setFlyEnabled(false) -- Nonaktifkan terbang setelah selesai
        -- Mungkin ada fungsi untuk menghapus UI jika diperlukan
        -- destroy_frame(farmStatusFrame)
    else
        print("Gagal membuat UI. Script farming berjalan tanpa UI.")
        -- Farming tanpa UI
    end
end

-- Fungsi getQuestInfoForLevel, getBelly, getCurrentFightingStyleMastery, getCurrentFightingStyle (perlu implementasi Delta)
-- ...

-- Jalankan auto farm
autoFarm()
