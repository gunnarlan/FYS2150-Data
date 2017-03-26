(TeX-add-style-hook
 "lab_diffraksjon"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "11pt" "norsk" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("babel" "norsk") ("fontenc" "T1") ("biblatex" "backend=biber" "sortcites") ("xcolor" "usenames" "dvipsnames" "svgnames" "table") ("caption" "font={scriptsize}") ("listings" "procnames") ("algpseudocode" "noend")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
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
    "erf"
    "blankpage"
    "numberthis"
    "suba"
    "subxi")
   (LaTeX-add-bibliographies
    "references")
   (LaTeX-add-xcolor-definecolors
    "Gray"
    "LightCyan"
    "tablecolor"
    "tabletext"
    "tablerule"
    "titlepagecolor"
    "namecolor"
    "white"
    "gray"
    "gray!10"
    "blue"
    "ForestGreen"
    "red")
   (LaTeX-add-array-newcolumntypes
    "a"
    "b")
   (LaTeX-add-caption-DeclareCaptions
    '("\\DeclareCaptionFont{white}" "Font" "white")
    '("\\DeclareCaptionFormat{listing}" "Format" "listing")))
 :latex)

