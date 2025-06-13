




-- all of these functions return their result and a boolean
-- to notify the caller if the string was even changed

-- pad the left side
local lpad =
	function (s, l, c)
		local res = string.rep(c or ' ', l - #s) .. s
		return res, res ~= s
	end

-- pad the right side
local rpad =
	function (s, l, c)
		local res = s .. string.rep(c or ' ', l - #s)
		return res, res ~= s
	end

-- pad on both sides (centering with left justification)
local pad =
	function (s, l, c)
		c = c or ' '

		local res1, stat1 = rpad(s,    (l / 2) + #s, c) -- pad to half-length + the length of s
		local res2, stat2 = lpad(res1,  l,           c) -- right-pad our left-padded string to the full length

		return res2, stat1 or stat2
	end

return { lpad, rpad, pad }
