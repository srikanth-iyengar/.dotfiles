-- Forked from some random forgejo
-- Thin NetRW listing (one file per line); tree style is liststyle 3
vim.g.netrw_liststyle = 0

-- Show NetRW line numbers
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

-- Sync current and browing directories
-- vim.g.netrw_keepdir = 0 -- can't get this to work

-- Split NetRW vertically
-- NOTE: must disable vim.opt.splitright first
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 85

