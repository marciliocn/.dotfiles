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

" = V Pagar.me V: https://www.youtube.com/watch?v=kZDT10nFiTY =

" Permite abrir novos arquivos mesmo com arquivo em edição sem salvar
set hidden

" Habilita suporte a mouse
set mouse=a

" [NeoVim] Permite visualizar alterações de substituições no arquivo em tempo
" real
set inccommand=split

"===========
"= ATALHOS =
"===========
" Definir tecla de comando para início dos atalhos
let mapleader="\<space>"

" Atalhos para modo NORMAL
" n = NORMAL mode
" nore = NO REcursive (sem expansão em outras macros já definidas)
" map = definição de atalho
" <leader>; = padrão com sequência para ativar o comando
" A;<esc> = comando que será executado após ativação do atalho

" Adiciona um ; no final da linha
nnoremap <leader>; A;<esc><cr>
" Edita o arquivo de configuração
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
" Recarrega o arquivo de configuração
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" = ^ Pagar.me ^ =

"===========
"= VISUAIS =
"===========
" Habilita coloração de syntax para arquivos de códigos fonte
syntax enable
" Ativa o tema Drácula
packadd! dracula
colorscheme dracula
