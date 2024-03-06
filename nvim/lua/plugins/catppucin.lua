return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = false,
    })
  end,
}
