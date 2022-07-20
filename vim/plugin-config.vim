vim9script

g:NERDTreeMinimalUI = 1
g:NERDTreeStatusline = -1

g:WebDevIconsUnicodeDecorateFolderNodes = 1

g:webdevicons_enable_nerdtree = 1

g:NERDTreeSyntaxEnabledExtensions = [
    'c', 'h',
    'c++', 'cpp', 'hpp',
    'php',
    'html', 'css', 'js', 'jsx', 'cjs', 'mjs',
    'md',
    'vim', 'ini',
    'sh',
    'rs'
]

g:NERDTreeSyntaxEnabledExactMatches = [
    'node_modules',
    'favicon.ico'
]

g:NERDTreeFileExtensionHighlightFullName = 1
g:NERDTreeExactMatchHighlightFullName = 1
g:NERDTreePatternMatchHighlightFullName = 1

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
        "percent": "g:StatusLineFilePercentage",
        "mode": "g:StatusLineMode"
    },
}

def g:StatusLineFilePercentage(): string
    const properWidth = winwidth(0) > 40
    const blacklisted = FiletypeBlackListed()

    if !properWidth || blacklisted
        return ""
    endif

    # From https://vi.stackexchange.com/a/3895
    return line('.') * 100 / line('$') .. '%'
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

    # Don't display hex value if the window is small or the file
    # is special E.G terminal, help, nerdtree etc..
    if blacklisted || !properWidth
        return ""
    endif

    const line = getline(".")
    const col = col(".")

    # Handle empty lines and end of line in insert mode
	if line == "" || strchars(line) < col
        return "0x00"
    endif

    var char = strgetchar(line, col - 1)

    # If the character is a single byte, print 2 hexs
    if char < 256
        return printf('0x%.2x', char)
    endif

    # If it's a multibyte character, print 4 hexs
    return printf('0x%.4x', char)
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
    return &filetype =~# '\v(help|vimfiler|netrw|nerdtree|unite|terminal)' || &buftype =~# '\v(terminal|netrw)'
enddef

def g:StatusLineFilename(): string
	if FiletypeBlackListed()
		return ""
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

const specialFilenameMap = {
    "nerdtree": "nerdtree"
}

def g:StatusLineMode(): string
    return get(specialFilenameMap, &filetype, g:lightline#mode())
enddef
