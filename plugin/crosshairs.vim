if exists('g:crosshairs_loaded')
    finish
endif
let g:crosshairs_loaded = 1

let s:cpoptions_save = &cpoptions
set cpoptions&vim

if !exists('g:crosshairs_duration')
    let g:crosshairs_duration = '300m'
endif

function! s:crosshairs() abort
    if exists('b:crosshairs_active')
        return
    endif

    let b:crosshairs_active = 1

    let l:had_cursorline = &cursorline
    let l:had_cursorcolumn = &cursorcolumn

    setlocal cursorline cursorcolumn
    redraw
    execute 'sleep ' . g:crosshairs_duration

    if ! l:had_cursorline
        set nocursorline
    endif

    if ! l:had_cursorcolumn
        set nocursorcolumn
    endif

    unlet b:crosshairs_active
endfunction

command! -bar Crosshairs call <sid>crosshairs()

let &cpoptions = s:cpoptions_save
