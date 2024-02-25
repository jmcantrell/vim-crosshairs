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
endfunction

command! -bar Crosshairs call s:crosshairs()

let &cpoptions = s:cpoptions_save
