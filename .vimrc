

execute pathogen#infect()
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

set number
let g:CommandTCancelMap=['<C-c>']
let g:CommandTBackspaceMap=['<C-h>','<BS>']
let g:CommandTCursorLeftMap=['<Left>']
set tabstop=4
set shiftwidth=4
set expandtab

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

colorscheme distinguished

" au FileType xhtml,xml so ~/.vim/scripts/html_autoclosetag.vim
