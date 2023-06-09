local ls = require("luasnip")
local types = require("luasnip.util.types")
-- require("luasnip.loaders.from_vscode").lazy_load({paths="~/AppData/Local/nvim/lua/snippets"})
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/AppData/Local/nvim/lua/snippets"} })
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/configurations/.dotfiles/nvim_snippets" } })
ls.config.set_config{
  history=true,
  updateevents="TextChanged,TextChangedI",
  enable_autosnippets=true,
  expt_opts={
    [types.choiceNode] = {
      active={
        virt_text={{"<-", "Error"}},
      },
    },
  },
}


vim.keymap.set({"i", "s"}, "<c-k>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent=true})


vim.keymap.set({"i", "s"}, "<c-j>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end,{silent=true})


vim.keymap.set({"i", "s"}, "<c-l>", function ()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent=true})


vim.keymap.set("n", "<leader>z", "<cmd>source ~/AppData/Local/nvim/lua/customls.lua<CR>")
