
vim.g.vimspector_logfile = '~/vimspector.log'

require("alnav")

vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', [[<Cmd>lua require('harpoon.term').gotoTerminal(1)<CR>]], { noremap = true, silent = true })

