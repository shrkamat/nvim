local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

local some = require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets" } }

print (some)


-- Repeat Insernode text
-- @param insert_node_id The id of the insert node to repeat (the first line from)
local ri = function (insert_node_id)
    return f(function (args) return args[1][1] end, insert_node_id)
end

ls.snippets = {
    cpp = {
        s("sss",{
            i(1, '// insert node'),
            t({'', '// some other text on a new line', ''}),
            ri(1) --repeats inserted text after jump from insert node
        })
    }
}
