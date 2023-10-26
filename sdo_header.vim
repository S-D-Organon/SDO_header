"+=================================================================+
"|                                                                 |
"|    ______  ______   _____                                       |
"|   / ___\ \|  _ \ \ / _ \ \ _ __ __ _  __ _ _ __   ___  _ __     |
"|   \___ \\ \ | | \ \ | | \ \ '__/ _` |/ _` | '_ \ / _ \| '_ \    |
"|    ___) / / |_| / / |_| / / | | (_| | (_| | | | | (_) | | | |   |
"|   |____/_/|____/_/ \___/_/|_|  \__, |\__,_|_| |_|\___/|_| |_|   |
"|                                |___/                            |
"|                                                                 |
"+=================================================================+
"| project: SDO_header |
"+=====================+

let s:project_name = "project: " . system('echo -n $(basename -s .git `git config --get remote.origin.url`)')

let s:header_line = ["+=================================================================+",
			\"|                                                                 |",
			\"|    ______  ______   _____                                       |",
			\"|   / ___\\ \\|  _ \\ \\ / _ \\ \\ _ __ __ _  __ _ _ __   ___  _ __     |",
			\"|   \\___ \\\\ \\ | | \\ \\ | | \\ \\ '__/ _` |/ _` | '_ \\ / _ \\| '_ \\    |",
			\"|    ___) / / |_| / / |_| / / | | (_| | (_| | | | | (_) | | | |   |",
			\"|   |____/_/|____/_/ \\___/_/|_|  \\__, |\\__,_|_| |_|\\___/|_| |_|   |",
			\"|                                |___/                            |",
			\"|                                                                 |",
			\"+=================================================================+" . repeat("=", strlen(s:project_name) - 63) . repeat("+", (strlen(s:project_name) - 63 > 0)),
			\"| " . s:project_name . " |",
			\"+" . repeat("=", 2 + strlen(s:project_name)) . "+"]

let s:type2prefix = {'\.c$\|\.h$\|\.cpp$': "//", '\.sh$\|^Makefile$': "#", '\.vim$': "\""}

function! s:search_prefix()
	let l:f_name = expand("%:t")
	for f_type in keys(s:type2prefix)
		if f_name =~ f_type
			return s:type2prefix[f_type]
		endif
	endfor
	return ""
endfunction

function! s:sdo_header()
	let l:prefix = s:search_prefix()
	let l:i = 0
	for line in s:header_line
		if !(getline(l:i + 1) ==# l:prefix . line)
			call append(l:i, l:prefix . line)
		endif
		let l:i += 1
	endfor
	if !(getline(l:i + 1) ==# "")
		call append(l:i, "")
	endif
endfunction

command! SDOHeader call s:sdo_header()
