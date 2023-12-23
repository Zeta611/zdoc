%%
%% This is file `zdoc.cls'.
%%
%% -----------------------------------------------------------------
%% The zdoc class --- A class for my documents
%% Maintained by Jay Lee
%% E-mail: jaeho.lee@snu.ac.kr
%% Released under the MIT License.
%% -----------------------------------------------------------------
%%
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\RequirePackage{expl3}
\ProvidesExplClass
  {zdoc}
  {2023/12/16}
  {0.1}
  {A class for my documents}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Class Options %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \DeclareKeys {
% }
% \SetKeys { }
% \ProcessKeyOptions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions*
\LoadClass[a4paper,oneside]{memoir}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{kotex}

\RequirePackage{xcolor}
\RequirePackage{graphicx}

\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}

\RequirePackage{amssymb,amsmath,mathtools} % Before unicode-math
\RequirePackage[
  math-style=ISO,
  warnings-off={mathtools-colon, mathtools-overbracket},
]{unicode-math}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Font setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{microtype}

% Works for pdfLaTeX, XeLaTeX, and LuaLaTeX
\RequirePackage{libertine}
% fake slant for libertine
\setmainfont{\libertine@base}[
  Extension = .otf,
  Numbers = {\libertine@figurealign,\libertine@figurestyle},
  UprightFont = *_R,
  ItalicFont = *_RI,
  BoldFont = *_\libertine@boldstyle,
  BoldItalicFont = *_\libertine@boldstyle I,
  SlantedFont = *_R,
  SlantedFeatures = {FakeSlant=0.17},
]

\setmathfont{LibertinusMath-Regular.otf}[Scale = MatchUppercase]
\setmathfont{Garamond-Math.otf}[
  Scale = MatchUppercase,
  range = {\Coloneq, \coloneq},
]
\setmathfont{XITSMath-Regular.otf}[
  Scale = MatchUppercase,
  range = {\cup, bb},
]

\setmonofont{MonaspaceArgon}[
  Extension = .otf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic,
  Scale=MatchLowercase,
]
% ≔
\RequirePackage{newunicodechar}
\newfontfamily{\zd@cfallbackfont}{JuliaMono}[Scale=MatchLowercase]
\DeclareTextFontCommand{\zd@ctextfallback}{\zd@cfallbackfont}
\newunicodechar{≔}{\zd@ctextfallback{≔}}

\setmainhangulfont{Noto Serif CJK KR}[
  Scale = MatchUppercase,
  AutoFakeSlant = 0.15
]
\setsanshangulfont{KoPubWorldDotum_Pro}[
  Scale = MatchUppercase,
  BoldFont={* Bold},
]
\setmonohangulfont{D2Coding}[
  Scale = MatchLowercase,
]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Metadata %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% https://github.com/latex3/hyperref/issues/242#issuecomment-1149845979
\AddToHook {begindocument/before} {
  \hypersetup{
    colorlinks,
    linkcolor={black},
    citecolor={red!73!black},
    urlcolor={blue!60!black},
  }
}
