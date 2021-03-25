
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/coc/coc.vim 
source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim

syntax on
filetype plugin indent on

set number relativenumber 
set hidden                      " Allow multiple hidden buffers
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set noerrorbells                " Don't play sound on error
set tabstop=4 softtabstop=4     " Tabs to spaces
set shiftwidth=4                " Indent width when using <>
set expandtab                   " Automatically turn tab to space
set smartindent                 " Detect file indentation
set smartcase                   " Smart case on search
set ignorecase                  " Ignore case on search
set noswapfile                  " Don't write swap files
set nobackup                    " Don't make backups
set undodir=~/.vim/undodir      " Where to save undo history
set undofile                    " Enable the undo saving
set incsearch                   " Start searching before enter is pressed
set termguicolors               " Enable 24 bit colors
set scrolloff=8                 " Scroll line offser kept above cursor
set noshowmode                  " Don't print mode in status line
set encoding=utf-8              " default encoding for buffers
set fileencoding=utf-8          " default encoding for files
set fileencodings=utf-8         " same as above but it is a list
set backspace=indent,eol,start  " Backspace/Ctrl-H settings
set hlsearch                    " Highlight all search matches
set fileformats=unix,dos,mac    " file formats
set nowritebackup               " No backup before write
set splitbelow                  " :split creates below window
set splitright                  " :vspclit creates right window
set noequalalways               " Don't change window sizes when opening new
set updatetime=50               " Makes things faster
set shortmess+=c                " Don't pass messages to |ins-completion-menu|.
set mousemodel=popup            " Mouse right click opens term menu (if exists)
set mouse=a                     " Mouse enabled in all modes/features
set t_Co=256                    " Something about tmux and colors :/
set laststatus=2                " Always show Status bar
set modeline                    " Reads a special line `# vim:` on
set modelines=10                " top of files to change local configs
set title                       " Pass file title to terminal title
set titleold="Terminal"         " Default title to be set
set titlestring=%F              " format for the title using pritf
set list                        " Show tabs and spavces visually
set nojoinspaces                " No space when joining lines
set confirm                     " Dialog to confirm operations
set virtualedit=block           " Allow placing cursor where there is no char
set showbreak=↳
set colorcolumn=80,100,120
set listchars+=tab:→→\|,space:.,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.i3/config set filetype=i3config
aug end

let mapleader = " "

let g:vim_isort_config_overrides = {
  \ 'include_trailing_comma': 1, 'multi_line_output': 3}
let g:vim_isort_python_version = 'python3'

let g:gruvbox_contrast_dark = 'hard'       " Set gruvbox bg to real dark
let g:gruvbox_material_background = 'hard' " Same but for -material alt
let g:gruvbox_invert_selection='0'         " Don't invert selection
let g:airline_theme = 'gruvbox_material'

set guifont=Hack:14
set background=dark                        " Set global background to dark
colorscheme gruvbox-material               " Default colorscheme


let g:indentLine_enabled = 1    " Enables indentline plugin
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_faster = 1


map <F8> :TagbarToggle<CR>
map <C-,> :!ctgs -R .<CR>
map <C-z> :u<cr>
map <C-c> "+y
map <C-f> :Ag<CR>
map <C-p> :Rg<CR>
" map <C-p> :Files<CR>

nnoremap <C-b> :Gblame<cr>
nnoremap <C-l> :bn<cr>
nnoremap <C-h> :bp<cr>
nnoremap <C-x> :bp \|bd #<cr>
nnoremap <C-t> :t.<cr>
nnoremap <DEL> dd
nnoremap <C-s> :w! <cr>
nnoremap <C-Q> :qa! <cr>
nnoremap <C-q> :q <cr>
nnoremap cc :Commentary <CR>
nnoremap <C-\> :CocCommand explorer <CR>
nnoremap <C-i> :Isort <CR>
map <leader>? :echo @%<cr>

let python_highlight_all = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_statusline_ontop = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#coc#enabled = 0


let g:ale_linters = {}
:call extend(g:ale_linters, {
    \'python': ['flake8'], })
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R .'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
if executable('rg')
  let g:rg_derive_root='true'
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden"
" nnoremap <C-p> :Telescope find_files<cr> 
" nnoremap <C-f> :Telescope live_grep<cr> 
" let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
" let NERDTreeShowHidden=1
" let NERDTreeRespectWildIgnore=1
" let g:venom_use_tools = 1
" let g:venom_auto_activate = 1
" let g:venom_root_markers = ['.venv', '.venv/', '.git/', '.env', '.env/']
" let g:venom_tools = {'poetry': 'poetry env info -p'}
" let g:ale_lint_on_text_changed='always'
" let g:ale_python_pylint_change_directory = 'project'
" let g:ale_linters = {'python': ['flake8', 'pylint']}
" let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
" colorscheme gruvbox
" colorscheme nord
" colorscheme one
" colorscheme palenight
" let g:lightline = { 'colorscheme': 'palenight' }
" let g:airline_theme='base16_oceanicnext'
" let g:airline_theme = 'palenight'
" let g:ale_lint_delay=20
" let g:ale_python_flake8_options = '--max-line-length=79'
" let g:ale_completion_enabled = -1
" let g:ale_fixers = {'python': ['isort', 'remove_trailing_lines', 'trim_whitespace', 'yapf', 'autopep8']}
" let g:ale_fix_on_save = 0
