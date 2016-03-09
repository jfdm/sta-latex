%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyright 2012, 2016 - Jan de Muijnck-Hughes
%%
%% This work may be distributed and/or modified under the  conditions
%% of the LaTeX Project Public License, either version 1.3c of this
%% license or (at your option) any later version.
%%
%% The latest version of this license can be found at:
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Jan de Muijnck-Hughes
%%
%% This work consists of the file: sta-thesis.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sta-article}[2016/03/09 v2016.03.09 sta-article]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX class for writing letters, adhereing to the University of St
%% Andrews corporate guidelines.
\LoadClass[pdftex, 10pt, article, oneside, final]{memoir}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProcessOptions{}
% ------------------------------------ [ Fix LaTex Packages ]
\RequirePackage[l2tabu,orthodox]{nag}
\RequirePackage{fixltx2e}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[british]{babel}
\RequirePackage[strict=true]{csquotes}
\RequirePackage[british,cleanlook]{isodate}
\RequirePackage{xspace}
\RequirePackage{environ}
\RequirePackage[colorlinks=true]{hyperref}
\RequirePackage{sta-colours}

\RequirePackage[protrusion=true, expansion=true]{microtype}

\RequirePackage{graphicx}

%% ---------------------------------------------------------------- [ Commands ]

\newcommand{\department}[1]{\gdef\STACS@department{#1}}
\newcommand{\address}[1]{\gdef\STACS@address{#1}}
\newcommand{\email}[1]{\gdef\STACS@email{#1}}
\newcommand{\logo}[1]{\gdef\STACS@logo{#1}}
\newcommand{\tel}[1]{\gdef\STACS@tel{#1}}
\newcommand{\fax}[1]{\gdef\STACS@fax{#1}}
\newcommand{\www}[1]{\gdef\STACS@www{#1}}

%% -------------------------------------------------------------- [ Paper Size ]

\setulmarginsandblock{55mm}{50mm}{*}
\setlrmarginsandblock{25mm}{25mm}{*}

\setheadfoot{17mm}{30mm}
\setheaderspaces{10mm}{*}{*}
\checkandfixthelayout{}

% Paragraph Spacing
\setlength{\parskip}{1.75ex plus 0.2ex minus 0.42ex}
\setlength{\parindent}{0pt}

\fixpdflayout{}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}
\headstyles{komalike}
%% ------------------------------------------------------- [ Header and Footer ]

\origdate%
\hypersetup{%
  linkcolor=sta-blue,
  anchorcolor=sta-blue,
  citecolor=sta-blue,
  urlcolor=sta-black
}
\makepagestyle{sta-frontpage}

\makeoddhead{sta-frontpage}{%
\includegraphics[height=17mm]{\STACS@logo}\newline
\vspace{5mm}
\hspace*{14mm}
\LARGE
\begin{tabular}{>{\sffamily}l}
\STACS@department{}\\
\end{tabular}
}{}{}

\makeevenhead{sta-frontpage}{}{}{}

\makeoddfoot{sta-frontpage}{}{Page-\thepage}{}

\makepagestyle{sta-normalpage}
\copypagestyle{sta-normalpage}{sta-frontpage}

\makeoddhead{sta-normalpage}{}{}{}
\makeevenhead{sta-normalpage}{}{}{}
\pagestyle{sta-normalpage}

%% ------------------------------------------------------------- [ Letter Body ]

\AtBeginDocument{%
\thispagestyle{sta-frontpage}
\pagestyle{sta-normalpage}
}

\renewcommand{\maketitle}{
  \begin{center}
    \LARGE\thetitle
  \end{center}
  \begin{center}
    \large\href{mailto:\STACS@email}{\theauthor}
    \par\thedate
  \end{center}}
\endinput
