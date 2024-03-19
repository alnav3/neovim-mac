function Setup_lualine()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'material',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
    }

    require('lualine').setup()
end

return {

    {
        "rebelot/kanagawa.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme kanagawa]])
            vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
            vim.cmd [[
                highlight Normal guibg=none
                highlight NonText guibg=none
                highlight Normal ctermbg=none
                highlight NonText ctermbg=none
                highlight LineNr guibg=none
                highlight CursorLineNr guibg=none
                highlight VertSplit guibg=none
                highlight StatusLine guibg=none
                highlight StatusLineNC guibg=none
                highlight SignColumn guibg=none
            ]]

        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        priority = 999,
        config = Setup_lualine
    },
    {
        "TaDaa/vimade",
        lazy = false,
        priority = 998,
        config = function()
            vim.g.vimade = {fade = 1000}
        end,
        keys = {
            {"<leader>f", vim.cmd.VimadeRedraw , mode = "n"}
        }

    },

}
