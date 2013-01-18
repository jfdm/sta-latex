%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyright 2012 - Jan de Muijnck-Hughes
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
\ProvidesClass{sta-letter}[2012/10/11 v2012.10.11 sta-letter]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX class for writing letters, adhereing to the University of St
%% Andrews corporate guidelines.
\LoadClass[pdftex, 10pt, article, oneside, final]{memoir}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProcessOptions
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
% ----------------------------------------- [ Font PackageWithOptionss ]
\RequirePackage[sc]{mathpazo}
\RequirePackage{helvet}
\linespread{1.05}
\RequirePackage[protrusion=true, expansion=true]{microtype}
% ---------------------------------------- [ Style PackageWithOptionss ]
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}
\RequirePackage{graphicx}

%% ---------------------------------------------------------------- [ Commands ]

\newcommand{\department}[1]{\gdef\STACS@department{#1}}
\newcommand{\address}[1]{\gdef\STACS@address{#1}}
\newcommand{\jobtitle}[1]{\gdef\STACS@jobtitle{#1}}
\newcommand{\email}[1]{\gdef\STACS@email{#1}}
\newcommand{\logo}[1]{\gdef\STACS@logo{#1}}
\newcommand{\tel}[1]{\gdef\STACS@tel{#1}}
\newcommand{\fax}[1]{\gdef\STACS@fax{#1}}
\newcommand{\www}[1]{\gdef\STACS@www{#1}}

\newcommand{\charityline}{The University of St Andrews is a charity registered in Scotland. No: SC013532AD}

\newcommand{\recipient}[1]{\gdef\STACS@recipient{#1}}
\newcommand{\opening}[1]{\gdef\STACS@opening{#1}}
\newcommand{\closing}[1]{\gdef\STACS@closing{#1}}

\newcommand{\subject}[1]{%
\vspace{-2em}\begin{center}\bfseries#1\end{center}}

%% -------------------------------------------------------------- [ Paper Size ]

\setulmarginsandblock{55mm}{50mm}{*}
\setlrmarginsandblock{25mm}{25mm}{*}

\setheadfoot{17mm}{30mm}
\setheaderspaces{10mm}{*}{*}
\checkandfixthelayout

% Paragraph Spacing
\setlength{\parskip}{1.75ex plus 0.2ex minus 0.42ex}
\setlength{\parindent}{0pt}

\fixpdflayout

%% ------------------------------------------------------- [ Header and Footer ]

\definecolor{sta-grey-print}{cmyk}{0.0, 0.2, 0.0, 0.68}
\definecolor{sta-blue}{RGB}{0,83,155}
\origdate
\hypersetup{%
  linkcolor=sta-blue, 
  anchorcolor=sta-blue,
  citecolor=sta-blue, 
  urlcolor=sta-grey-print
}
\makepagestyle{sta-frontpage}

\makeoddhead{sta-frontpage}{%
\includegraphics[width=\textwidth]{\STACS@logo}
\vspace*{5mm}
\hspace*{14mm}
\Large
\begin{tabular}{l}
\STACS@department{}\\
\@author, \STACS@jobtitle\\
\end{tabular}
}{}{}

\makeevenhead{sta-frontpage}{}{}{}

\makefootrule{sta-frontpage}{\textwidth}{1pt}{1.5mm}

\makeoddfoot{sta-frontpage}{\color{sta-grey-print}
\hspace{14mm}
\begin{tabular}{l}
\STACS@address\\
T:~\STACS@tel~F:\xspace\STACS@fax~E:~\href{mailto:\STACS@email}{\STACS@email}\\
W:~\STACS@www\\[0.5em]
\scriptsize\charityline\\
\end{tabular}
}{}{}

\makeheadfootruleprefix{sta-frontpage}
   {\color{sta-grey-print}}
   {\color{sta-grey-print}}

\makepagestyle{sta-normalpage}
\copypagestyle{sta-normalpage}{sta-frontpage}
\makeoddhead{sta-normalpage}{\@author}{Page-\thepage}{{\origdate\@date}}
\makeevenhead{sta-normalpage}{}{}{}
\pagestyle{sta-normalpage}

%% ------------------------------------------------------------- [ Letter Body ]
\NewEnviron{letter}{%
\thispagestyle{sta-frontpage}
\sffamily
\pagestyle{sta-normalpage}
\begin{raggedright}
\STACS@recipient\\[2em]
Date:~{\@date}\\[2em]
\end{raggedright}
\STACS@opening\newline
\BODY
\vspace{2em}
\STACS@closing
}

\endinput
