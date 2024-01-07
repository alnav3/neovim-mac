require'alnav.vimspector'.create_vimspector_config()
vim.cmd[[ command! CreateVimspector :lua require'vimspector'.create_vimspector_config() ]]
require("alnav.remap")
require("alnav.set")
require("alnav.packer")
