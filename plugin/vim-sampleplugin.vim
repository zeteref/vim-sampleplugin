let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

if !has('python3')
    echo "vim has to be compiled with +python3 to run this"
    finish
endif

if exists('g:sample_plugin_loaded')
    finish
endif

let g:sample_plugin_loaded = 1

python << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import sample
EOF

function! PrintCountry()
    python sample.print_country()
endfunction

command! -nargs=0 PrintCountry call PrintCountry()


function! InsertCountry()
    python sample.insert_country()
endfunction

command! -nargs=0 InsertCountry call InsertCountry()

map <Leaer>c :InsertCountry<CR>
