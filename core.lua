AutoHideGUI = {
    enabled = true,
    lastTick = 0,
    guihidden = false,
}

function AutoHideGUI.Update(_, tickCount)

    -- Check if in-game
    if not (GetGameState() == FFXIV.GAMESTATE.INGAME) then
        return
    end

    -- NYI: too lazy to build GUI right now
    if not AutoHideGUI.enabled then
        return
    end

    -- Throttle calls
    if tickCount - AutoHideGUI.lastTick >= 100 then
        AutoHideGUI.lastTick = tickCount

        if IsControlOpen("ChatLog") and AutoHideGUI.guihidden then
            AutoHideGUI.guihidden = false
            ToggleGUI()
        end

        if not IsControlOpen("ChatLog") and not AutoHideGUI.guihidden then
            AutoHideGUI.guihidden = true
            ToggleGUI()
        end
    end
end


RegisterEventHandler("Gameloop.Update", AutoHideGUI.Update, "[AutoHideGUI] Update")
