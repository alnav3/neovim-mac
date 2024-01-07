vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })


vim.cmd([[
function! GetFullClassName()
    return substitute(fnamemodify(substitute(substitute(expand('%:p'), getcwd() . "/", "", ""), 'src/test/java/', '', ''), ':r'), "/", ".", "g")
endfunction

]])

vim.cmd([[
function! GetJavaMethodName()
    " Busca hacia atrás la primera línea que parece una definición de método
    let l:method_line = search('^\s*\(public\|private\|protected\|static\)\s\+\w\+\s\+\(\w\+\)\s*(', 'bn')
    " Si encontramos una línea que coincide
    if l:method_line != 0
        " Extrae el nombre del método
        let l:method_name = matchstr(getline(l:method_line), '\w\+\ze\s*(')
        return l:method_name
    endif
    return ""
endfunction
]])



-- Función auxiliar para ejecutar comandos en una nueva pestaña de terminal
vim.run_in_new_tab = function(command)
    vim.cmd('tabnew') -- abre una nueva pestaña
    vim.cmd('term ' .. command) -- ejecuta el comando en un terminal en esa pestaña
end


-- Definición de la función BuildMavenTestCommand en Vimscript
vim.cmd([[
function! BuildMavenTestCommand()
    let l:full_class_name = GetFullClassName()
    let l:method_name = GetJavaMethodName()
    return "mvn test -Dtest=" . l:full_class_name . "\\#" . l:method_name
endfunction
]])


-- Maven Start Normal
vim.api.nvim_set_keymap('n', '<Leader>msn', ':lua vim.run_in_new_tab("mvn spring-boot:run")<CR>', { noremap = true, silent = true })

-- Maven Start Modo Debug
vim.api.nvim_set_keymap('n', '<Leader>msd', ':lua vim.run_in_new_tab("mvn spring-boot:run -Dspring-boot.run.jvmArguments=\'-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005\'")<CR>', { noremap = true, silent = true })

-- Maven Test Class Normal
vim.api.nvim_set_keymap('n', '<Leader>mtc', ':lua vim.run_in_new_tab("mvn test -Dtest=" .. vim.fn.expand("%:t:r"))<CR>', { noremap = true, silent = true })

-- Maven Test Class Debug
vim.api.nvim_set_keymap('n', '<Leader>mtd', ':lua vim.run_in_new_tab("mvn test -Dtest=" .. vim.fn.expand("%:t:r") .. " -Dmaven.surefire.debug")<CR>', { noremap = true, silent = true })

-- Maven Test Method Normal
vim.api.nvim_set_keymap('n', '<Leader>mtm', ':lua vim.run_in_new_tab(vim.fn.BuildMavenTestCommand())<CR>', { noremap = true, silent = true })

-- Maven Test Method Debug
vim.api.nvim_set_keymap('n', '<Leader>mmd', ':lua vim.run_in_new_tab("mvn test -Dtest=" .. vim.fn.BuildMavenTestCommand() .. " -Dmaven.surefire.debug")<CR>', { noremap = true, silent = true })


