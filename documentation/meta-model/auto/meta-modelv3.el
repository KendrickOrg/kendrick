(TeX-add-style-hook
 "meta-modelv3"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:orgfc5378f"
    "sec:orgd880a98"
    "sec:org31f7abb"
    "sec:org45f2a76"
    "sec:org24a2b2c"
    "sec:org38a2a9f"
    "sec:org637f939"
    "sec:orgb214871"
    "sec:orgdf207ca"
    "sec:org4dd5f83"
    "sec:org392f406"
    "sec:org19a4a5c"
    "sec:org5759923"
    "sec:org3fd02f3"
    "sec:orgafdd3bf"
    "sec:orgdca904d"
    "sec:org3fe21c1"
    "sec:orgced1d9c"
    "sec:org2f65e19"))
 :latex)

