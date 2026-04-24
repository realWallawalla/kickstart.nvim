--to make it work: brew install luajit
-- luarocks --local --lua-version=5.1 install magick
return {
  '3rd/image.nvim',
  version = '1.1.0',
  dependencies = { 'luarocks.nvim' },
  config = function()
    -- default config
    require('image').setup {
      backend = 'kitty', -- or "ueberzug" or "sixel"
      processor = 'magick_cli', -- or "magick_rock"
      integrations = {},
      max_width = 100,
      max_height = 12,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      scale_factor = 1.0,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif', 'scrollview', 'scrollview_sign' },
      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
      tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' }, -- render image files as images when opened
    }
  end,
}
