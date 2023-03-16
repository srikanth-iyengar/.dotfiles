local status, popup = pcall(require, "plenary.popup")
if not status then
  return
end

local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
local M = {}

function M.create_plenary_win(bufnr, title, config, main_win)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    bufnr = vim.api.nvim_create_buf(false, false)
  end
  local win_id, win = popup.create(bufnr,  {
      title = title or "Default title",
      line = config.line or 0,
      col = config.col or 0,
      minwidth = config.minwidth or 0,
      minheight = config.minheight or 0,
      borderchars = borderchars,
    })
  return {
    bufnr = bufnr,
    win_id = win_id,
    win = win,
    show = true
  }
end
