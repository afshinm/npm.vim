if exists("g:loaded_npm")
	finish
endif

let g:loaded_npm = 1

function! s:addPackage(packageName)
	let packageName = a:packageName

	echomsg "Installing " . packageName . "..."

	let result = system('npm install ' . shellescape(packageName))

	if v:shell_error
		echoerr "Error in installing " . packageName
		echomsg result
	else
		echomsg "Success! " . packageName . " installed successfully."
	endif

endfunction

if !exists(":Npm")
	command -nargs=1 Npm :call s:addPackage(<q-args>)
endif