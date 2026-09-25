local waywall = require("waywall")
local helpers = require("waywall.helpers")

return function(config)
    -- Add any extra code here
    local plug = require("plug")
    plug.setup({
        dir = "plugins",
        config = config,
        log_level = "debug",
    })
    -- END
end
