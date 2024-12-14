local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local tabs_only_group = augroup('SetTabsOnlyInFt', {})


autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 60,
    })
  end
})

autocmd('FileType', {
  group = tabs_only_group,
  pattern = '*',
  callback = function()
    vim.opt.expandtab = false;
    vim.opt.smartindent = true;
    vim.opt.shiftwidth = 2;
    vim.opt.tabstop = 2;
    vim.opt.softtabstop = 2;
  end
})
-- autocmd FileType c,cpp,java,python setlocal noet ci pi sts=0 sw=4 ts=4
