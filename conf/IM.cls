%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialization boilerplate & debug methods %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\typeout{IM Document Class Version 2019-10-14}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IM}

\newcommand{\IM@debug}[1]{%
  \typeout{*****> IM: #1}}

\IM@debug{loading base class: standalone}
\LoadClass[border=0pt, 12pt, tikz]{standalone}

%%%%%%%%%%%%%%%%%%%%%%%%%
% math font definitions %
%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\IM@TikzFontDeclaration}{\protect\normalfont}
\newcommand{\IM@TikzFontUsesSansMath}{%
  \IM@debug{setting tikz math declaration to use sansmath fonts}%
  \renewcommand{\IM@TikzFontDeclaration}{\protect\sansmath\protect\sffamily}}
\newcommand{\IM@TikzFontUsesStixMath}{%
  \IM@debug{setting tikz math declaration to use stix math fonts}%
  \renewcommand{\IM@TikzFontDeclaration}{\protect\normalfont}}

\newcommand{\IM@LoadMathFonts}{\relax}
\newcommand{\IM@LoadSansMathFonts}{%
  \IM@debug{math fonts: loading sfmath and sansmath packages}%
  \usepackage{sfmath}%
  \usepackage{sansmath}%
  \IM@TikzFontUsesSansMath}
\newcommand{\IM@LoadStixMathFonts}{%
  \IM@debug{math fonts: loading stix package}%
  \usepackage[notext]{stix}%
  \IM@TikzFontUsesStixMath}
\newcommand{\IM@LoadDefaultMathFonts}{%
  \IM@debug{loading default math fonts}%
  \IM@LoadSansMathFonts}

\newcommand{\IM@UseDefaultMathFonts}{%
  \renewcommand{\IM@LoadMathFonts}{\IM@LoadDefaultMathFonts}}
\newcommand{\IM@UseSansMathFonts}{%
  \renewcommand{\IM@LoadMathFonts}{\IM@LoadSansMathFonts}}
\newcommand{\IM@UseStixMathFonts}{%
  \renewcommand{\IM@LoadMathFonts}{\IM@LoadStixMathFonts}}

%%%%%%%%%%%%%%%%%%%%%%%%%
% text font definitions %
%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\IM@LoadTextFonts}{\relax}
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
\newcommand{\IM@LoadDefaultTextFonts}{%
  \IM@debug{loading default text fonts}%
  \IM@LoadOpenSansFonts}

\newcommand{\IM@UseDefaultTextFonts}{%
  \renewcommand{\IM@LoadTextFonts}{\IM@LoadDefaultTextFonts}}
\newcommand{\IM@UseOpenSansFonts}{%
  \renewcommand{\IM@LoadTextFonts}{\IM@LoadOpenSansFonts}}
\newcommand{\IM@UseMontserratFonts}{%
  \renewcommand{\IM@LoadTextFonts}{\IM@LoadMontserratFonts}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IM document class font options  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{opensansfonts}{%
  \IM@debug{IM.cls called with `opensansfonts' option}%
  \IM@UseOpenSansFonts
  \IM@UseSansMathFonts}

\DeclareOption{montserratfonts}{%
  \IM@debug{IM.cls called with `montserratfonts' option}%
  \IM@UseMontserratFonts
  \IM@UseStixMathFonts}

\IM@UseDefaultTextFonts
\IM@UseDefaultMathFonts

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handle other options and load other packages %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptions\relax

\RequirePackage{Tikz-IM}
