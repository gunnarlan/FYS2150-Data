(TeX-add-style-hook
 "erlenlim_lab4"
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
    "subcaption")
   (TeX-add-symbols
    '("nonref" 1)
    '("noref" 1)
    '("unit" 1)
    '("MatL" 1)
    '("pdddt" 3)
    '("pddt" 2)
    '("pdt" 2)
    '("pd" 1)
    '("odder" 2)
    '("oder" 2)
    '("mc" 2)
    "rmd"
    "blankpage"
    "numberthis")
   (LaTeX-add-bibliographies
    "references"))
 :latex)

