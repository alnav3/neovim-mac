return{

    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            -- Keymap para encontrar archivos
            { "<leader>gs", vim.cmd.Git, mode = "n" },
            { "gh", "<cmd>diffget //2<cr>", mode = "n" },
            { "gl", "<cmd>diffget //3<cr>", mode = "n" },
        },
    },

}
