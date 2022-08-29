local M = {}

function M.scandir(directory)
	local i, t, popen = 0, {}, io.popen
	local pfile = popen('ls -a "' .. directory .. '"')
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end

function M.file_exists(file)
	local f = io.open(file, "rb")
	if f then f:close() end
	return f ~= nil
end

function M.lines_from(file)
	if not M.file_exists(file) then return {} end
	local lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end

function M.split_string(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

function M.string_start_with(str, start_with)
	return string.sub(str, 1, string.len(start_with)) == start_with
end

function M.table_length(tbl)
	local count = 0
	for _ in pairs(tbl) do count = count + 1 end
	return count
end

return M
