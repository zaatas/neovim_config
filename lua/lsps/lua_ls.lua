-- https://luals.github.io/wiki/settings/
-- using .editorconfig in ~/ for lsp options
return {

    settings = {
        Lua = {
            format = {
                enable = true,
                indent_style = "space",
            },
            diagnostics = {
                globals = { "vim", "plug" },
                disable = { "missing-parameters", "missing-fields" },
            },
            runtime = {
                version = "LuaJIT",
                special = {
                    plug = "require",
                },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
            hint = {
                enable = false,
                arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
                await = true,
                paramName = "Disable",  -- "All" | "Literal" | "Disable"
                paramType = true,
                semicolon = "All",      -- "All" | "SameLine" | "Disable"
                setType = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
