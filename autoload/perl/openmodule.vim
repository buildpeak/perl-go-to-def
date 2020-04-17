function! perl#openmodule#GetCursorModuleName()
    let module = substitute(expand("<cword>"), "^\(.*\);?$", "\1", "")
    let func_name = ""

    let r = system("perldoc -lm ".module)
    if v:shell_error == 1
        let func_name = substitute(expand("<cword>"), '.\{-}\(\(.*\)\(\(::\)\(\w\+\)\)\)$', '\5', '' )
        let module = substitute( module, '.\{-}\(\(.*\)\(::\w\+\)\)$', '\2', '' )
        let r = system("perldoc -lm ".module)
        if v:shell_error == 1
            echom "Module ".module." not found"
            return
        end
    end

    " move to the next word to find a function name
    execute "normal! w"
    let next_word = expand("<cword>")

    let r = substitute(r, "\n", "", "g")
    exe "e" r

    if func_name != ''
        execute "normal! gg/\\<".func_name."\\>\<cr>"
        return
    end

    if next_word != '' && next_word != ";"
        execute "normal! gg/\\<".next_word."\\>\<cr>"
    end

endfunction
