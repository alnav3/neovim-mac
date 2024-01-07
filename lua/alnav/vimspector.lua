
local M = {}

M.create_vimspector_config = function()
    -- Verificar si el proyecto es de Go
    local go_files = vim.fn.glob("*.go")
    if #go_files > 0 then
        local go_config = [[{
  "configurations": {
    "run": {
      "adapter": "delve",
      "filetypes": [ "go" ],
      "variables": {
        "dlvFlags": "--check-go-version=false"
      },
      "configuration": {
        "request": "launch",
        "program": "${fileDirname}",
        "mode": "debug"
      }
    }
  }
}
]]
        vim.fn.writefile(vim.split(go_config, "\n"), ".vimspector.json")
    -- Verificar si el proyecto es de Java
    elseif vim.fn.filereadable("pom.xml") == 1 then
        local java_config = [[{
  "configurations": {
    "run": {
      "adapter": "java",
      "filetypes": [ "java" ],
      "variables": {},
      "configuration": {
        "request": "launch",
        "mainClass": "${file}",
        "projectName": "myproject"
      }
    }
  }
}
]]
        vim.fn.writefile(vim.split(java_config, "\n"), ".vimspector.json")
    else
        print("Tipo de proyecto no reconocido.")
        return
    end
    print("Configuración de Vimspector generada.")
end

return M

