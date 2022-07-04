vim9script

g:lightline = {
    "colorscheme": "materia",
    "active": {
        "left": [
            [ "mode", "paste"  ],
            [ "filename" ]
        ],
        "right": [
            [ "lineinfo" ],
            [ "percent" ],
            [ "gitbranch", "fileformat", "fileencoding", "filetype", "hexvalue" ]
        ]
    },
    "inactive": {
        "left": [ [ "filetype" ], [ "gitbranch" ] ],
    	"right": []
    },
    "component": {},
    "component_function": {
    	"gitbranch": "LightlineGitHead",
    	"filename": "LightlineFilename",
    	"filetype": "LightlineFiletype",
    	"hexvalue": "LightlineHexValue",
    	"fileformat": "LightlineFileFormat",
    	"fileencoding": "LightlineFileEncoding",
    	"lineinfo": "LightlineCursor"
    },
}

def LightlineGitHead(): string 
	if execute("FugitiveIsGitDir") !=# "" && !FiletypeBlackListed() && winwidth(0) > 50
		const head = execute("FugitiveHead")
		const branch_icon = " "
		return head .. branch_icon
	endif

	return ""
enddef

def LightlineCursor(): string
	if winwidth(0) > 45
		const line = line(".")
		const char = winwidth(0) > 50 ? col(".") : ""

		return line .. ":" .. char
	endif

	return ""
enddef

def LightlineHexValue(): string
	return !FiletypeBlackListed() && winwidth(0) >= 80 ? "0x%B" : ""
enddef

def LightlineFileEncoding(): string
	return !FiletypeBlackListed() && winwidth(0) >= 70 ? &encoding : ""
enddef

def LightlineFileFormat(): string
	return !FiletypeBlackListed() && winwidth(0) >= 80 ? &fileformat : ""
enddef

def LightlineFiletype(): string
	return !FiletypeBlackListed() && winwidth(0) >= 40 ? &filetype : ""
enddef

def LightlineReadonly(): string
	return &readonly && winwidth(0) > 50 && !FiletypeBlackListed() ? " (RO)" : ""
enddef

def FiletypeBlackListed(): bool
	return &filetype =~ "\v(help|vimfiler|unite|netrw)"
enddef

def LightlineModified(): string
	return &modified && winwidth(0) > 60 ? " ●" : ""
enddef

def LightlineFilename(): string
	const filename = expand("%:t") !=# "" ? expand("%:t") : "[New file]"
	const name = filename .. LightlineReadonly() .. LightlineModified()

	return name
enddef

defcompile LightlineGitHead
defcompile LightlineFilename
defcompile LightlineFiletype

g:netrw_liststyle = 3
g:netrw_banner = 0
g:netrw_browse_split = 4
g:netrw_winsize = 25
g:netrw_altv = 1
