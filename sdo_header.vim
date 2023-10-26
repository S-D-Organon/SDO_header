function! s:update()
	if getline(1) == "//+=================================================================+"
		return 0
	endif
	return 1
endfunction

function! s:sdo_header()
	if s:update()
		call append(0, "")
		call append(0, "//+=================================================================+")
		call append(0, "//|                                                                 |")
		call append(0, "//|                                |___/                            |")
		call append(0, "//|   |____/_/|____/_/ \\___/_/|_|  \\__, |\\__,_|_| |_|\\___/|_| |_|   |")
		call append(0, "//|    ___) / / |_| / / |_| / / | | (_| | (_| | | | | (_) | | | |   |")
		call append(0, "//|   \\___ \\\\ \\ | | \\ \\ | | \\ \\ '__/ _` |/ _` | '_ \\ / _ \\| '_ \\    |")
		call append(0, "//|   / ___\\ \\|  _ \\ \\ / _ \\ \\ _ __ __ _  __ _ _ __   ___  _ __     |")
		call append(0, "//|    ______  ______   _____                                       |")
		call append(0, "//|                                                                 |")
		call append(0, "//+=================================================================+")
	endif
endfunction

command! SDOHeader call s:sdo_header()
