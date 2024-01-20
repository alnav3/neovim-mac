vim.cmd([[

function! GetSonarProjectKey()
    " Obtener el directorio de trabajo actual
    let l:working_dir = getcwd()

    " Construir la ruta al archivo 'sonar'
    let l:sonar_file = l:working_dir . '\sonar'

    " Intenta leer la primera línea del archivo 'sonar'
    if filereadable(l:sonar_file)
        let l:projectKey = readfile(l:sonar_file)[0]
        return l:projectKey
    else
        echo "Archivo 'sonar' no encontrado en " . l:sonar_file
        return ''
    endif
endfunction

function! RunSonarMvnInNewTab()
    " Construir el comando
    let l:projectKey = GetSonarProjectKey()

    " Verificar si projectKey está vacío
    if l:projectKey == ''
        echo "ProjectKey está vacío. El archivo 'sonar' no existe o está vacío."
        return
    endif

    let l:command = "mvn sonar:sonar " .
                \ "-Dsonar.host.url=http://sonar.alm.europe.cloudcenter.corp/sonar " .
                \ "-Dsonar.junit.reportPaths=target/surefire-reports " .
                \ "-Dsonar.jacoco.reportPaths=target/jacoco.exec,target/jacoco-it.exec " .
                \ "-Dsonar.projectKey=\"" . l:projectKey . "\" " .
                \ "-Dsonar.login=2a0e841208bd6d6cb52f4141348e55b554422e57 " .
                \ "-Dsonar.sourceEncoding=ISO-8859-1 " .
                \ "-Dsonar.sources=." 

    " Abre la terminal en una nueva pestaña y ejecuta el comando
    execute 'tabnew | term ' . l:command
endfunction

command! SonarMvn call RunSonarMvnInNewTab()


]])


