vim.api.nvim_exec([[
function! DebugProject()
    if filereadable("pom.xml")
        " Proyecto Java
        execute "CocCommand java.debug.vimspector.start"
    elseif len(glob("*.go")) > 0
        " Proyecto Go
        call vimspector#Launch()
    else
        " Por defecto Java
        execute "CocCommand java.debug.vimspector.start"
    endif
endfunction
]], false)

vim.api.nvim_set_keymap('n', '<leader>dg', ':call DebugProject()<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>o', ':call CocAction("organizeImport")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ci', ':tabnew | terminal mvn clean install -DskipTests<CR>', { noremap = true, silent = true })

-- Mapear 'Continue' a la combinación <leader>dc
vim.api.nvim_set_keymap('n', '<leader>dc', ':call vimspector#Continue()<CR>', { noremap = true, silent = true })

-- Mapear 'ToggleBreakpoint' a la combinación <leader>db
vim.api.nvim_set_keymap('n', '<leader>db', ':call vimspector#ToggleBreakpoint()<CR>', { noremap = true, silent = true })

-- Mapear 'Stop' a la combinación <leader>ds
vim.api.nvim_set_keymap('n', '<leader>ds', ':call vimspector#Stop()<CR>', { noremap = true, silent = true })

-- Mapear 'VimspectorReset' a la combinación <leader>dr
vim.api.nvim_set_keymap('n', '<leader>dr', ':VimspectorReset<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>vr', ':VimspectorReset<CR>', { noremap = true, silent = true })


