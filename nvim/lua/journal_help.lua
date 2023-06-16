function create_new_file()
    local today = os.date("%Y_%m_%d")
    print(today)
    local filepath = vim.fn.expand("%:p:h") .. "/Journal/DailyNotes/" .. today .. ".md"
    print(vim.fn.expand("%:p:h"))
    vim.cmd("new " .. filepath)
end
