"===========
"= PLUGINS =
"===========
" Gerenciador de Pacotes MINPAC
packadd minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Lista de Plugins usados 
call minpac#add('dracula/vim',{'name': 'dracula'})

"===========
"= CONFIGS =
"===========
" Exibe números das linhas de forma reversa a partir da linha atual
set rnu

" Exibe número da linha real onde estiver o cursor 
set nu

" Força arquivos a estarem no formato Unix
set fileformats=unix

" Habilita configuração correta de Temas 
" if you have Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" Número de espaços inseridos quando TAB for usado
set tabstop=4

" Largura da identação no código
set shiftwidth=4

" Quando usar TAB, inserir espaços
" Para TAB, Ctrl-V<Tab>
set expandtab

"===========
"= VISUAIS =
"===========
" Ativa o tema Drácula
syntax enable
packadd! dracula
colorscheme dracula
