-- colors:
--   primary:
--     background: "#111111"
--     foreground: "#F2F3F4"
--   normal:
--     black: "#111111"
--     red: "#F07178"
--     green: "#79AE70"
--     yellow: "#f0c674"
--     blue: "#81a2be"
--     magenta: "#9F97B2"
--     cyan: "#CCE6EF"
--     white: "#c5c8c6"
--
--   bright:
--     black: "#F2F3F4"
--     red: "#FAC6C9"
--     green: "#C3E3BE"
--     yellow: "#FFF1C6"
--     blue: "#A9D4F9"
--     magenta: "#E0D8F4"
--     cyan: "#CCE6EF"
--     white: "#F2F3F4"

-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Light Background (Not often used)
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

return {
  "echasnovski/mini.base16",
  version = '*',
  lazy = false,
  priority = 1000,
  config = function()
    local base16 = require('mini.base16')
    local palette = {
      base00 = '#111111',
      base01 = '#181818',
      base02 = '#373b41',
      base03 = '#969896',
      base04 = '#c5c8c6',
      base05 = '#F2F3F4',
      base06 = '#81a2be',
      base07 = '#c5c8c6',
      base08 = '#CCE6EF',
      base09 = '#de935f',
      base0A = '#81a2be',
      base0B = '#FFF1C6',
      base0C = '#E6B673',
      base0D = '#f0c674',
      base0E = '#F07178',
      base0F = '#A9D4F9',
    }

    base16.setup({
      palette = palette,
      use_cterm = true,
      plugins = { default = true },
    })
  end
}
