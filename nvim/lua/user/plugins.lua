local fn = vim.fn

-- Автоматическая установка packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Автокоманда, которая перезагружает neovim всякий раз, когда вы сохраняете plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Использует защищенный вызов packer для исключения ошибок 
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Вызов packer в popup окне
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Установите выши плагины здесь 
return packer.startup(function(use)
  -- Мои плагины тут:
  use "wbthomason/packer.nvim"             -- Обнавляет и управляет packer.nvim 
  use "nvim-lua/popup.nvim"                -- Реализация всплывающего API из vim в Neovim (необходим другим плагинам)
  use "nvim-lua/plenary.nvim"              -- Полезные функции lua, используемые множеством плагинов

  -- Автоматическая настройка вашей конфигурации после клонирования packer.nvim
  -- Поместите это в конец после всех плагинов
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
