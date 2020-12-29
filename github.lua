-- intended useage
-- github <branch> <filename>
local tArgs = { ... }

if #tArgs ~= 2 then
    print("intended useage: github <branch> <filename>")
else
    local branch = tArgs[1]
    local filename = tArgs[2]

    local response = http.get("https://raw.githubusercontent.com/dylantompkins/CCTscripts/" .. branch .. "/" .. filename)
    local code = response.readAll()

    local file = fs.open(filename, "w")
    file.write(code)
    file.close()
end
