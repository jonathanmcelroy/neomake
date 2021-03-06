" vim: ts=4 sw=4 et

function! neomake#makers#python#EnabledMakers()
    return ['python', 'pep8', 'pyflakes', 'pylint']
endfunction

function! neomake#makers#python#pylint()
    return {
        \ 'args': [
            \ '-f', 'text',
            \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
            \ '-r', 'n'
        \ ],
        \ 'errorformat':
            \ '%A%f:%l:%c:%t: %m,' .
            \ '%A%f:%l: %m,' .
            \ '%A%f:(%l): %m,' .
            \ '%-Z%p^%.%#,' .
            \ '%-G%.%#',
        \ }
endfunction

function! neomake#makers#python#pyflakes()
    return {
        \ 'errorformat':
            \ '%E%f:%l: could not compile,' .
            \ '%-Z%p^,'.
            \ '%E%f:%l:%c: %m,' .
            \ '%E%f:%l: %m,' .
            \ '%-G%.%#',
        \ }
endfunction

function! neomake#makers#python#pep8()
    return {
        \ 'errorformat': '%f:%l:%c: %m',
        \ }
endfunction

function! neomake#makers#python#python()
    return {
        \ 'args': [ '-c',
            \ "from __future__ import print_function\n" .
            \ "from sys import argv, exit\n" .
            \ "if len(argv) != 2:\n" .
            \ "    exit(1)\n" .
            \ "try:\n" .
            \ "    compile(open(argv[1]).read(), argv[1], 'exec', 0, 1)\n" .
            \ "except SyntaxError as err:\n" .
            \ "    print('%s:%s:%s: %s' % (err.filename, err.lineno, err.offset, err.msg))"
        \ ],
        \ 'errorformat': '%E%f:%l:%c: %m',
        \ }
endfunction
