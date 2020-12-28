response = http.get("https://raw.githubusercontent.com/dylantompkins/CCTscripts/master/tree.lua")
print(response.readAll())