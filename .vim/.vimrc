syntax enable
syntax on

let g:solarized_termcolors=256
set t_Co=256 
set background=dark
colorscheme gruvbox 

let g:C_UseTool_cmake = 'yes'
let g:C_useTool_doxygen = 'yes'

set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set showcmd
set wildmenu
set number relativenumber
set hlsearch

" If Vim wasn't a peice of 
"	shit I wouldn't need this
set backspace=indent,eol,start
set backspace=2

" maps "WQ" to ":wq"
command! WQ :wq
command! Wq :wq
command! W  :w
command! Q  :q

" Shows the tabs
set list listchars=tab:>- 

" Opens the terminal vertical
command! T :vertical terminal

" C programs only
if expand('%:e') == "c"

	" Compile the program
	command! C :w | :!clear && gcc %  -o %< -Wall -Wextra -ggdb

	" Run the program
	command! R :w | :!clear && ./%< 

	" Compile the program (DEBUG mode)
	command! D :w | :!clear && gcc % -o %< -Wall -Wextra -ggdb -DDEBUG=1

	" Compile without security features (canary + executable stack)
	" NOTE: not ASLR
	command! P :w | :!clear && gcc % -o %< -fno-stack-protector -z execstack

	" TODO: Insert the basic skeleton of a file if the file doesn't exist

" R markdown
elseif expand('%:e') == "rmd"

	" Convert markdown to <format>
	command! C :w | :!clear && Rscript -e "rmarkdown::render('%')"

	" Open the pdf
	command! O :!clear && xdg-open %<.pdf

	" Compile and open the pdf file
	command! R :w | :!clear && Rscript -e "rmarkdown::render('%')" && xdg-open %<.pdf

" MIPS
elseif expand('%:e') == "s"

	" Run the program
	command! R :w | :!clear && spim -file %

" LaTeX
elseif expand('%:e') == "tex"

	" Convert LaTeX to pdf
	command! C :w | :!clear && pdflatex %

	" Compile and open the pdf file
	command! R :w | !clear && pdflatex % && xdg-open %<.pdf



endif
