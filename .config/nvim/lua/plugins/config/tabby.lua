-- get onedark colorscheme values
local colors = require('core.theme')
local theme = {
  fill = { bg = colors.black, style = 'bold' },
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = { bg = colors.black, fg = colors.white },
  current_tab = { bg = colors.bg_blue, fg = colors.black, style = 'italic' },
  tab = { bg = colors.black, fg = colors.white },
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
  return {
    {
      { ' 💪 ', hl = theme.head },
      line.sep(' ', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('|', theme.fill, hl),
        tab.is_current() and '' or '',
        tab.name(),
        line.sep('|', theme.fill, hl),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep(' ', theme.win, theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        win.file_icon(),
        line.sep(' ', theme.win, theme.fill),
        hl = theme.win,
        margin = ' ',
      }
    end),
    hl = theme.fill,
  }
end)
