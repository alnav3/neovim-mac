return {
    { "rose-pine/neovim" },
    {
        "mbbill/undotree",
        keys = {
            {"<leader>u", vim.cmd.UndotreeToggle, mode = "n"}
        }
    },
    { "ThePrimeagen/vim-be-good" },
    { "Exafunction/codeium.vim" },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        keys = {
            {"<leader>tt", "<cmd>TroubleToggle<cr>", mode = "n"},
        }
    },
    { "nvim-tree/nvim-web-devicons" },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- follow only stable versions
        version = "*",
        keys = {
            {"<leader>g", ":lua require('neogen').generate()<CR>", mode = "n"}
        }
    }
}
