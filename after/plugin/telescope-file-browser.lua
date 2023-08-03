-- Basic setup along with setup for opening file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>pv",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = false }
)

require("telescope").load_extension "file_browser"
