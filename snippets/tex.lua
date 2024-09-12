local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
	return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
	return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
	return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
	return tex_utils.in_env("tikzpicture")
end

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.

return {
	s(
		{ trig = "mm", wordTrig = false, regTrig = true },
		fmta("$<>$", { i(0) }),
		{ condition = not tex_utils.in_mathzone, show_condition = not tex_utils.in_mathzone }
	),

	s(
		{ trig = "ff" },
		fmta("\\frac{<>}{<>}", {
			i(1),
			i(2),
		}),
		{ condition = tex_utils.in_mathzone, show_condition = tex_utils.in_mathzone } -- `condition` option passed in the snippet `opts` table
	),

	s(
		{ trig = "eq", dscr = "A LaTeX equation environment" },
		fmta( -- The snippet code actually looks like the equation environment it produces.
			[[
      \begin{equation}
        <>
      \end{equation}
      ]],
			-- The insert node is placed in the <> angle brackets
			{ i(0) }
		)
	),

	s(
		{ trig = "dd" },
		fmta("\\draw [<>] ", {
			i(1, "params"),
		}),
		{ condition = tex_utils.in_tikz, show_condition = tex_utils.in_tikz }
	),

	s("dm", {
		t({ "\\[", "\t" }),
		i(1),
		t({ "", "\\]" }),
	}, { condition = tex_utils.in_text, show_condition = tex_utils.in_text }),

	s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" }, fmta("\\texttt{<>}", { i(1) })),
}
