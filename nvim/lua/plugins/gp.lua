return {
    "robitx/gp.nvim",
    config = function()
        local conf = {
            openai_api_key = { "cat", "/home/timkarx7/.api_key" }
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
}
