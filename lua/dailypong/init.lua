local default_config = require("dailypong.config")

local M = {
  config = default_config
}

local function create_commands()
  vim.api.nvim_buf_create_user_command(
    0,
    'DailyToggle',
    function()
      -- THANKS: https://stackoverflow.com/a/69772561/9881278
      vim.cmd("if empty(filter(getmatches(), { i, v -> has_key(v, 'pattern') && v.pattern is? '\\%'.line('.').'l'} )) | call matchadd('Comment', '\\%'.line('.').'l') | else | for m in filter(getmatches(), { i, v -> has_key(v, 'pattern') && v.pattern is? '\\%'.line('.').'l'} ) | call matchdelete(m.id) | endfor | endif")
    end,
    {}
  )

  vim.api.nvim_buf_set_keymap(0, "n", "<CR>", ":DailyToggle<CR>", { noremap = true, silent = true })
end

M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})

   vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
     pattern = {"*.daily"},
     callback = function()
        create_commands()
     end
   })
end

return M
