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
            [
                "gitbranch",
                "fileformat",
                "fileencoding",
                "filetype",
                "hexvalue"
            ]
        ]
    },
    "inactive": {
        "left": [ [ "filetype" ], [ "gitbranch" ] ],
    	"right": []
    },
    "component": {},
    "component_function": {
    	"gitbranch": "g:StatusLineGitHead",
    	"filename": "g:StatusLineFilename",
    	"filetype": "g:StatusLineFiletype",
    	"hexvalue": "g:StatusLineHexValue",
    	"fileformat": "g:StatusLineFileFormat",
    	"fileencoding": "g:StatusLineFileEncoding",
    	"lineinfo": "g:StatusLineCursor",
        "percent": "g:StatusLineFilePercentage"
    },
}

def g:StatusLineFilePercentage(): string
    const properWidth = winwidth(0) > 40
    const blacklisted = FiletypeBlackListed()

    return properWidth && !blacklisted ? "%P" : ""
enddef

def g:StatusLineGitHead(): string
    if !exists("g:is_a_project")
        return ""
    endif

    const gitDir = g:FugitiveIsGitDir()
    const blacklisted = FiletypeBlackListed()
    const properWidth = winwidth(0) > 50

    if gitDir && !blacklisted && properWidth
        const head = g:FugitiveHead()
        const branch_icon = ""
        return head .. ' ' .. branch_icon
    endif
 
    return ""
enddef

def g:StatusLineCursor(): string
    const properWidthLine = winwidth(0) > 45
    const properWidthCol = winwidth(0) > 50 

    const line = line(".")
    const col = col(".")
 
    if properWidthCol && properWidthLine
        return line .. ':' .. col
    elseif properWidthLine
        return line .. '' # String cast
    endif

    return ""
enddef

def g:StatusLineHexValue(): string
    const blacklisted = FiletypeBlackListed()
    const properWidth = winwidth(0) >= 80 

    return !blacklisted && properWidth ? '0x%B' : ""
enddef

def g:StatusLineFileEncoding(): string
    return !FiletypeBlackListed() && winwidth(0) >= 70 ? &encoding : ""
enddef

def g:StatusLineFileFormat(): string
    return !FiletypeBlackListed() && winwidth(0) >= 80 ? &fileformat : ""
enddef

def g:StatusLineFiletype(): string
    return !FiletypeBlackListed() && winwidth(0) >= 40 ? &filetype : ""
enddef

def FiletypeBlackListed(): bool
    return &filetype =~ "\v(help|vimfiler|netrw|nerdtree|unite|terminal)"
enddef

def g:StatusLineFilename(): string
	const blacklisted = FiletypeBlackListed()

	if blacklisted
		return &filetype
	endif

    const filename = expand("%:t") !=# "" ? expand("%:t") : "[New file]"

    const readonly = &readonly && winwidth(0) > 50 ? "(RO)" : "" 
    const modified = &modified && winwidth(0) > 60 ? "●" : ""

    var name = filename

    if readonly != ""
        name ..= " " .. readonly
    endif

    if modified != ""
		name ..= " " .. modified
    endif

    return name
enddef
