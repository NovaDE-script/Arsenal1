-- 🛡️ Panda V3 Setup für NeoBLox Hub DE

-- Konfiguration
local __PELINDA_SERVICE__ = "NeoBLox Hub DE"
local __PELINDA_SILENTMODE__ = true
local __PELINDA_SECURITY_LEVEL__ = 2 -- 1 = Warnung, 2 = Kick, 3 = Crash

-- 🔑 Key-Link generieren
local keyLink = Pelinda.GetKeyLink({ Service = NeoBLox Hub DE })
print("🔑 Hol dir deinen Key hier: " .. keyLink)
setclipboard(keyLink)
print("📋 Link wurde in die Zwischenablage kopiert!")

-- 📥 GUI zur Key-Eingabe (optional, kann entfernt werden)
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local TextBox = Instance.new("TextBox", ScreenGui)
TextBox.Size = UDim2.new(0, 300, 0, 50)
TextBox.Position = UDim2.new(0.5, -150, 0.5, -25)
TextBox.PlaceholderText = "🔐 Gib deinen Panda V3 Key ein"
TextBox.TextScaled = true
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 🧪 Warte auf Eingabe
TextBox.FocusLost:Connect(function()
    local userKey = TextBox.Text

    local status = Pelinda.Init({
        Service = __PELINDA_SERVICE__,
        SilentMode = __PELINDA_SILENTMODE__,
        Key = userKey,
        SecurityLevel = __PELINDA_SECURITY_LEVEL__
    })

    print("[+] PandaV3 Status: " .. status)

    if status == "validated!!" then
        print("✅ NeoBLox Hub DE erfolgreich geladen!")
        TextBox:Destroy()
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NovaDE-script/Arsenal/refs/heads/main/Arsenal%20Premium.lua?token=GHSAT0AAAAAADHGUBITUPYJW6AJPVATYKMG2F2VLSQ"))()
        -- Hier startet dein Hauptcode
        -- z.B. loadstring(game:HttpGet("https://raw.githubusercontent.com/NovaDE-script/Arsenal/refs/heads/main/Arsenal%20Premium.lua?token=GHSAT0AAAAAADHGUBITUPYJW6AJPVATYKMG2F2VLSQ"))()
    else
        print("❌ Fehler beim Laden: " .. status)
        TextBox.Text = "Ungültiger Key. Bitte erneut versuchen."
    end
end)

