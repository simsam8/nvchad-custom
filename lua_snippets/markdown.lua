local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Markdown Snippets", {clear = true})
local file_pattern = "*.md"

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end


local aa = s("aa", {t"å"})
local AA = s("AA", {t"Å"})
local oe = s("oe", {t"ø"})
local OE = s("OE", {t"Ø"})
local ae = s("ae", {t"æ"})
local AE = s("AE", {t"Æ"})
table.insert(snippets, aa)
table.insert(snippets, AA)
table.insert(snippets, oe)
table.insert(snippets, OE)
table.insert(snippets, ae)
table.insert(snippets, AE)

return snippets, autosnippets
