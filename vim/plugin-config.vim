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
        return '' .. line
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

def StatusLineReadonly(): string
    const properWidth = winwidth(0) > 50
    const blacklisted = FiletypeBlackListed()

    if &readonly && properWidth && !blacklisted
        return "(RO)"
    endif
	
    return ""
enddef

def FiletypeBlackListed(): bool
    return &filetype =~ "\v(help|vimfiler|unite|terminal)"
enddef

def StatusLineModified(): string
    const properWidth = winwidth(0) > 60

    if &modified && properWidth
        return "●"
    endif

    return ""
enddef

def g:StatusLineFilename(): string
    const filename = expand("%:t") !=# "" ? expand("%:t") : "[New file]"

    const readonly = &readonly ? "(RO)" : "" 
    const modified = &modified ? "●" : ""

    var name = filename

    if readonly != "" && winwidth(0) > 50
        name ..= " " .. readonly
    endif

    if modified != "" && winwidth(0) > 60
        name ..= " " .. modified
    endif

    return name
enddef
