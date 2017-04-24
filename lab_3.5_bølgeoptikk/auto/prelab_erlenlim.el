(TeX-add-style-hook
 "prelab_erlenlim"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "11pt" "norsk" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("babel" "norsk") ("fontenc" "T1") ("biblatex" "backend=biber" "sortcites") ("xcolor" "usenames" "dvipsnames" "svgnames" "table") ("caption" "font={scriptsize}") ("listings" "procnames") ("algpseudocode" "noend")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "babel"
    "fontenc"
    "csquotes"
    "biblatex"
    "url"
    "textcomp"
    "xcolor"
    "caption"
    "amsmath"
    "amsthm"
    "amsfonts"
    "amssymb"
    "enumerate"
    "tikz"
    "float"
    "listings"
    "pstool"
    "pgfplots"
    "wrapfig"
    "graphicx"
    "epstopdf"
    "afterpage"
    "multirow"
    "gensymb"
    "algorithm"
    "microtype"
    "algpseudocode"
    "matlab-prettifier"
    "colortbl"
    "geometry"
    "hyperref"
    "subcaption"
    "pdfpages")
   (TeX-add-symbols
    '("nonref" 1)
    '("noref" 1)
    '("unit" 1)
    '("bracket" 1)
    '("sandwich" 1)
    '("MatL" 1)
    '("pddx" 1)
    '("pdx" 1)
    '("pddt" 1)
    '("pdt" 1)
    '("pxdy" 2)
    '("pnxdy" 3)
    '("oddx" 1)
    '("oddt" 1)
    '("odx" 1)
    '("odt" 1)
    '("oxdy" 2)
    '("onxdy" 3)
    '("mc" 2)
    "rmd"
    "schrodinger"
    "schrodingera"
    "skrodinger"
    "Psis"
    "Psif"
    "pop"
    "blankpage"
    "numberthis"
    "suba"
    "subxi")
   (LaTeX-add-bibliographies
    "references"))
 :latex)

