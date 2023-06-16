local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node

local date = function() return {os.date("%Y_%m_%d")} end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
        snip({
            trig = "meta",
            namr = "Metadata",
            dscr = "Daily journal template"
        },
        {
            text({"# ",}), func(date, {}), text({"",
            "",
            "## TODO",
            "",
            "* [[todo]]",
            "",
            "## WINS",
            "",
            "## Things to work on",
            "",})
        }),
    },
})
