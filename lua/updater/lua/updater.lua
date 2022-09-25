local M = {}

function M.setup()
	local Job = require("plenary.job")
	local remote_hash = nil
	local local_hash = nil

	Job:new({
		command = "git",
		args = {
			"fetch",
			"--all",
		},
		cwd = vim.fn.stdpath("config"),
	}):sync()

	Job:new({
		command = "git",
		args = {
			"rev-parse",
			"origin/master",
		},
		cwd = vim.fn.stdpath("config"),
		on_stdout = function(_, return_val)
			remote_hash = return_val
		end,
	}):sync()

	Job:new({
		command = "git",
		args = {
			"rev-parse",
			"HEAD",
		},
		cwd = vim.fn.stdpath("config"),
		on_stdout = function(_, return_val)
			local_hash = return_val
		end,
	}):sync()

	if local_hash ~= nil and remote_hash ~= nil and local_hash ~= remote_hash then
		require("notify")("your nvim config is out of date, please update", "warning", {
			title = "nvim config",
		})
	end
end

return M
