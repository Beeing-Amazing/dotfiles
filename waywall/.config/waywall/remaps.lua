return {
    remapped_kb = {
        -- Add any playing remaps here
        -- ["P"] = "F3", -- example, remaps the P key to act as the F3 key
        ["A"] = "O",
        ["O"] = "A",
        ["D"] = "L",
        ["L"] = "D",
        -- ["W"] = "Z",
        ["MB5"] = "F3",
        ["CapsLock"] = "F7",
        ["F7"] = "CapsLock",   --so caps lock as chat doesnt turn on caps lock within waywall
        ["Q"] = "0",
        ["0"] = "Q",         --triggers 0 for pie but search crafts Q->O via xkb still

    },

    normal_kb = {
        -- Add any remaps you want to keep when disabling normal remaps (not necessary)
        ["MB5"] = "F3",
    },

}
