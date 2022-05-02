-----------------------------------
-- :help + имя опции для справки --
-----------------------------------

vim.opt.backup = false                          -- создать бекап файл
vim.opt.clipboard = "unnamedplus"               -- позволяет neovim получать доступ к системному буферу обмена
vim.opt.cmdheight = 2                           -- больше места в командной строке neovim для отображения сообщений
vim.opt.completeopt = { "menuone", "noselect" } -- в основном только для cmp
vim.opt.conceallevel = 0                        -- что бы видеть `` видимы в marcdown файлах
vim.opt.fileencoding = "utf-8"                  -- кодировка записи в файл
vim.opt.hlsearch = true                         -- подсветка всех совпадений по шаблону поиска во время набора
vim.opt.ignorecase = true                       -- игнорировать регистр в шаблонах поиска
vim.opt.mouse = "a"                             -- разрешить использование мыши в нещвим
vim.opt.pumheight = 10                          -- высота pop up menu
vim.opt.showmode = true                         -- показать/скрыть текущий режим 
vim.opt.showtabline = 2                         -- всегда показывать вкладки
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- умные отступы
vim.opt.splitbelow = true                       -- заставить все горизонтальные сплиты появляться ниже текущего окна
vim.opt.splitright = true                       -- заставить все вертикальные сплиты появляться правее текущего окна
vim.opt.swapfile = false                        -- создает файл подкачки
-- vim.opt.termguicolors = true                    -- использовать цвета терминала (большинство терминалов поддерживают это)
vim.opt.timeoutlen = 1000                       -- время ожидания завершения отображенной последовательности (в миллисекундах)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- преобразование табуляции  в пробелы
vim.opt.shiftwidth = 2                          -- количество пробелов в отступе 
vim.opt.tabstop = 2                             -- количество пробелов в табуляции
vim.opt.cursorline = true                       -- выделить текущую строку
vim.opt.number = true                           -- нумерация строк
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
