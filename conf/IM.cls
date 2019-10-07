\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IM}

\newcommand{\IM@debug}[1]{%
  \typeout{*****> IM: #1}}

\IM@debug{loading base class: standalone}
\LoadClass[border=0pt, 12pt, tikz]{standalone}

\newcommand{\IM@LoadOpenSansFonts}{%
  \IM@debug{loading opensans fonts}%
  \usepackage[default,scale=0.95]{opensans}%
  \usepackage[T1]{fontenc}}

\newcommand{\IM@LoadMontserratFonts}{%
  % EDC: see
  % - https://w3bits.com/proxima-nova-alternative-fonts/
  % - montserrat: https://tug.org/FontCatalogue/montserratregular/
  \IM@debug{loading montserrat fonts}%
  \usepackage[defaultfam,tabular,lining]{montserrat}%
  \usepackage[T1]{fontenc}%
  \renewcommand*\oldstylenums[1]{{\fontfamily{Montserrat-TOsF}\selectfont ##1}}}

\newcommand{\IM@LoadDefaultFonts}{%
  \IM@debug{loading default fonts}%
  \IM@LoadOpenSansFonts}

\newcommand{\IM@LoadFonts}{\IM@LoadDefaultFonts}

\DeclareOption{opensansfonts}{%
  \IM@debug{IM.cls called with `opensansfonts' option}
  \renewcommand{\IM@LoadFonts}{\IM@LoadOpenSansFonts}}

\DeclareOption{montserratfonts}{%
  \IM@debug{IM.cls called with `montserratfonts' option}
  \renewcommand{\IM@LoadFonts}{\IM@LoadMontserratFonts}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptions\relax

\RequirePackage{Tikz-IM}
