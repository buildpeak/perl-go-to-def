function! perl#openmodule#GetCursorModuleName()
    let module = expand("<cword>")
    let module = substitute(module, "\(.*\);?$", "", "") 
    let r = system("perldoc -lm ".module)
    if v:shell_error == 1
        let module = substitute( expand("<cword>"), '.\{-}\(\(.*\)\(::\w\+\)\)$', '\2', '' )
        let r = system("perldoc -lm ".module)
        if v:shell_error == 1
            echom "Module ".module." not found"
            return
        end
    end
    let r = substitute(r, "\n", "", "g")
    exe "tabnew" r
endfunction
