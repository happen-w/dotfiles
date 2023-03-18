local util = {}


util.split = function(str,reps)
    local resultStrList = {}
    string.gsub(str,'[^'..reps..']+',function (w)
        table.insert(resultStrList,w)
    end)
    return resultStrList
end

util.inspect = function (table)
  vim.pretty_print(table)
end

return util
