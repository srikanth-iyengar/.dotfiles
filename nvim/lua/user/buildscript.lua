-- module(..., package.seeall)

-- function GetFileExtension(path)
--     return path:match("^.+(%..+)$")
-- end

-- function GetBaseFileName(path)
--     return path:match("[ \\w-]+?(?=\\.)")
-- end

-- function GetFilename(path)
--     local start, finish = path:find('[%w%s!-={-|]+[_%.].+')
--     return path:sub(start,#path)
-- end

-- -- Config file and the json utility class
-- local json = require"user.json"
-- Buildsystem = {}
-- Configured = {}
-- AvailableBuildSystems = {}

-- function Init()
--     local cacheFile = "C:/Users/Dell/AppData/Local/nvim/buildsystem/cache.json"
--     local jsonConfig = "C:/Users/Dell/AppData/Local/nvim/buildsystem/config.json"
--     Buildsystem = json.decode(GetLines(jsonConfig))
--     Configured = json.decode(GetLines(cacheFile))
--     for k, v in pairs(Buildsystem) do
--         table.insert(AvailableBuildSystems, k)
--     end
--     if Buildsystem == nil then
--         print("BuildSystem file error")
--     end
-- end



-- function GetLines(file)
--     local lines = ""
--     for line in io.lines(file) do
--         lines = lines .. line
--     end
--     return lines
-- end

-- function SaveConfig(file, config)
--     local config_file = io.open(file, "w")
--     if config_file == nil then return end
--     config_file:write(json.encode(config))
--     config_file:close()
-- end


-- function UpdateConfig(filename, buildsystem)
--     local cacheFile = "C:/Users/Dell/AppData/Local/nvim/buildsystem/cache.json"
--     Configured[filename] = buildsystem
--     SaveConfig( cacheFile, Configured )
-- end

-- function SelectBuildSystem(filename)
--     local filename = GetCurrentBuffer()
--     vim.ui.select( AvailableBuildSystems , {
--             prompt = "Select the buildsystem for " .. filename,
--             format_item = function(item)
--                 return item
--             end,
--         }, function(country, idx)
--             if country then
--                 UpdateConfig(filename, country)
--             else
--                 print "You cancelled"
--             end
--     end)
-- end

-- function ChangeBuildSystem()
--     SelectBuildSystem(GetCurrentBuffer())
-- end

-- function GetCurrentBuffer()
--     local pathFile = vim.fn.expand('%')
--     local pathFile = vim.fn.expand('%')
--     local i = #pathFile
--     local filename = ''
--     while(i >= 0)
--     do
--         if pathFile:sub(i, i) == '\\' then
--             break
--         end
--         filename = filename .. pathFile:sub(i, i)
--         i = i - 1
--     end
--     filename = string.reverse(filename)
--     return filename
-- end


-- function getExtension(buildsystem)
--     if buildsystem == 'java' or buildsystem == 'java-io-directed' then
--         return '.java'
--     elseif buildsystem == 'python' or buildsystem == 'python-io-directed' then
--         return '.py'
--     elseif buildsystem == 'cpp' or buildsystem == 'cpp-io-directed' then
--         return '.cpp'
--     end
--     return nil
-- end

-- function Split(s, delimiter)
--     local result = {};
--     for match in (s..delimiter):gmatch("(.-)"..delimiter) do
--         table.insert(result, match);
--     end
--     return result;
-- end

-- function compileAndRun()
--     local filename = GetCurrentBuffer()
--     if not Configured[filename] then
--         SelectBuildSystem(filename)
--         return
--     end
--     local curSystem = Configured[filename]
--     if getExtension(curSystem) == '.java' then
--         filename = string.sub(filename, 1, -6)
--     elseif getExtension(curSystem) == '.py' then
--         filename = string.sub(filename, 1, -4)
--     elseif getExtension(curSystem) == '.cpp' then
--         filename = string.sub(filename, 1, -5)
--     end
--     local command = Buildsystem[Configured[filename .. getExtension(curSystem)]]['command']
--     print(json.encode(command))
--     vim.cmd('vsplit')
--     local win = vim.api.nvim_get_current_win()
--     local buf = vim.api.nvim_create_buf(true, true)
--     vim.api.nvim_win_set_buf(win, buf)
--     vim.api.nvim_buf_set_lines(buf, -1, -1, false, {"Output of program: "})
--     for i = 1, 2, 1  do
--         local curCommand = command[i]
--         if curCommand == nil then
--             break
--         end
--         curCommand = curCommand:gsub("${BASE_FILE}", filename)
--         local cmdArguments = Split(curCommand, " ")
--         local job_id = vim.fn.jobstart(cmdArguments, {
--             stdout_buffered = true,
--             on_stdout = function (_, data)
--                 if data then
--                     vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
--                 end
--             end,
--             on_stderr = function (_, data)
--                 if data then
--                     vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
--                 end
--             end,
--         })
--         vim.fn.jobwait({job_id}, 4000);
--     end
-- end
--
--
--
--

module(..., package.seeall)
function GetFileExtension(path)
    return path:match("^.+(%..+)$")
end

function GetBaseFileName(path)
    return path:match("[ \\w-]+?(?=\\.)")
end


function compileAndRun()
    local filename = vim.fn.expand('%')
    if (GetFileExtension(filename) == ".java") then
        local codeFilename = filename:match("[^/]*.java")
        local baseFilename = string.sub(codeFilename, 1, -6)
        vim.cmd('!javac ' .. codeFilename .. ' && java ' .. baseFilename .. ' < in.txt 1> out.txt 2> error.txt')
    elseif (GetFileExtension(filename) == '.cpp') then
        local codeFilename = filename:match("[^/]*.cpp")
        local baseFilename = string.sub(codeFilename, 1, -5)
        vim.cmd('!g++ ' .. codeFilename .. ' -o ' .. baseFilename .. ' && ' .. baseFilename .. ".exe < in.txt 1> out.txt 2> error.txt")
    elseif (GetFileExtension(filename) == ".py") then
        local codeFilename = filename:match("[^/]*.py")
        local baseFilename = string.sub(codeFilename, 1, -4)
        vim.cmd('!python ' .. codeFilename .. ' < in.txt 1> out.txt 2> error.txt')
    end
end
