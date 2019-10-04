\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IM}

\LoadClass[border=0pt, 12pt, tikz]{standalone}

\newcommand{\IM@TikzPackage}{Tikz-IM}
\DeclareOption{useAltTikzPackage}{\renewcommand{\IM@TikzPackage}{Tikz-IM-alt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptions\relax

\RequirePackage{\IM@TikzPackage}
