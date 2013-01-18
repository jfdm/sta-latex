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
\ProvidesClass{sta-thesis}[2012/03/15 v2012.03.15 sta-thesis]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX class for producing theses. This style builds upon existing
%% LaTeX packages combining them into a consistent class that is
%% (hopefully) easy to use, making the writing of a thesis easier.
%% Important packages included by default are:
%%   Memoir
%%   Glossaries
%%   todonotes
%%   amsmath
%%   thmtools
%%
%% For the full list just scroll down a little further.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class Options:
%%   coverpage -> add a cool coverpage
%%   print -> ready thesis for binding, default is electronic
%% Mutually Exclusive options:
%%   draft -> send draft mode to memoir and todonotes
%%   final -> send final mode to memoir and disable todonotes
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TODO:
%% Update lists to add inpara enums
%% Add predefined declaration and copyright pages
%% Add glossary stylings for math notation
%% Add predefined signature commands for declaration

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[pdftex,british,a4paper,10pt]{memoir}
% -------------------------------------------------------- [ Options ]

\newif\ifprinting
\newif\ifcoverpage

\DeclareOption{coverpage}{\coverpagetrue}

\DeclareOption{draft}{%
  \PassOptionsToClass{draft}{memoir}
}

\DeclareOption{final}{%
  \PassOptionsToClass{final}{memoir}
  \PassOptionsToPackage{disable,colorinlistoftodos}{todonotes}
}

\DeclareOption{print}{\printingtrue}

\ProcessOptions

% ------------------------------------------------------- [ Packages ]
\RequirePackage[l2tabu,
                orthodox]{nag}
\RequirePackage{fixltx2e}
\RequirePackage[T1]{fontenc}
\RequirePackage[british]{babel}
\RequirePackage[strict=true]{csquotes}
\RequirePackage{microtype}
\RequirePackage{xspace}
\RequirePackage{tocbibind}
\RequirePackage{color}
\RequirePackage[british,iso]{isodate}

\RequirePackage[sc]{mathpazo}
\RequirePackage{helvet}
\linespread{1.05}

\RequirePackage{sta-colours}
%% Math Packages
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{thmtools}
\RequirePackage[all,
                error]{onlyamsmath}
\RequirePackage[fixamsmath]{mathtools}

\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{memhfixc}

%% For Draft Mode
\RequirePackage{setspace}
\RequirePackage[obeyDraft,
                colorinlistoftodos,
                textsize=small]{todonotes}
\RequirePackage{ifdraft}
\RequirePackage{lineno}
\RequirePackage{environ}


% ---------------------------------------------- [ Metadata Commands ]
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\theuniversity}[1]{\@university}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\logocmd}[1]{\gdef\@logocmd{#1}}

% For ready made delcaration
% \newcommand{\startdate}[2]{%
%   \gdef\@startyear{#1}
%   \gdef\@startmonth{#2}
% }
% \newcommand{\enddate}[2]{%
%   \gdef\@endyear{#1}
%   \gdef\@endmonth{#2}
% }

\newcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\email}[1]{\gdef\@email{%
\ifprinting\texttt{#1}\else\href{mailto:#1}{#1}\fi}}
\newcommand{\keywordlist}[1]{\gdef\@keywordlist{#1}}

% -------------------------------------------- [ Page Layout Styling ]
\settrimmedsize{297mm}{210mm}{*}
\setlength{\trimtop}{0pt}
\setlength{\trimedge}{\stockwidth}
\addtolength{\trimedge}{-\paperwidth}
\settypeblocksize{634pt}{448.13pt}{*}

\setmarginnotes{17pt}{51pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}

\setlrmarginsandblock{3cm}{2.5cm}{*}
\setulmarginsandblock{4cm}{*}{*}
\checkandfixthelayout
\fixpdflayout

% ------------------------------------------ [ Default Look and Feel ]
\setsecnumdepth{subsection}

\settocdepth{section}
\renewcommand{\cftpartnumwidth}{2em}

%% Printing Dependent styling
\ifprinting
 \hypersetup{
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  urlcolor=black
 }

\else
 \hypersetup{%
  colorlinks=true,
  linkcolor=sta-blue,
  anchorcolor=sta-blue,
  citecolor=sta-blue,
  urlcolor=sta-blue
 }
\fi

%% Epigraph formatting
\epigraphposition{flushright}
\epigraphtextposition{flushleftright}
\epigraphsourceposition{flushright}

%% Chapter and Heading Styles
\headstyles{komalike}
\chapterstyle{madsen}
\pagestyle{Ruled}
\makepagestyle{frontpage}
\makeoddhead{frontpage}{}
\makeevenhead{frontpage}{}
\makeoddfoot{frontpage}{}
\makeevenfoot{frontpage}{}

% ------------------------------------------------------- [ Theorems ]
\declaretheoremstyle[%
  spaceabove=6pt, spacebelow=6pt,
  headfont=\normalfont\bfseries,
  bodyfont=\normalfont\em,
  postheadspace=1em
]{thmstyle}

\declaretheorem[style=thmstyle, starred, name={\textbf{Note}}]{note}
\declaretheorem[style=thmstyle, starred, name={\textbf{Remark}}]{remark}
\declaretheorem[style=thmstyle, name={Definition}]{definition}
\declaretheorem[style=thmstyle, name={Example}]{example}
\declaretheorem[style=thmstyle, name={Exercise}]{exercise}
\declaretheorem[style=thmstyle, name={Problem}]{problem}
\declaretheorem[style=thmstyle, name={Question}]{question}
\declaretheorem[style=thmstyle, name={Solution}]{solution}

\declaretheorem[style=thmstyle, name={Corollary}]{corollary}
\declaretheorem[style=thmstyle, name={Lemma}]{lemma}
\declaretheorem[style=thmstyle, name={Proposition}]{proposition}
\declaretheorem[style=thmstyle, name={Theorem}]{theorem}

% --------------------------------------------- [ Glossary Stylings ]
%% TODO
% ---------------------------------------------- [ TODO Note Macros ]
\newcommand{\insertCite}{\todo{Need citation}}

\newcommand{\anote}[2][]
 {\todo[caption={#2}, backgroundcolor=orange!20!white,
     linecolor=orange, #1]{\small #2}}

\newcommand{\commentinline}[1]{\anote[inline]{#1}}

\NewEnviron{inlinecomment}[1][Inline Comment]{%
\anote[inline, caption={#1}]{%
\begin{minipage}{\linewidth}
\textbf{#1}
\BODY
\end{minipage}}}

% ----------------------------------------------- [ Predefined Pages ]
%% Dedication Page
\newenvironment{dedication}{%
 \thispagestyle{empty}
 \begin{flushright}%
 \vspace*{0.2\textheight}%
}{%
 \end{flushright}%
 \cleardoublepage
}
%% Acknowledgement Page
\newenvironment{acknowledgements}{%
 \chapter*{Acknowledgements}%
 \addcontentsline{toc}{chapter}{Acknowledgements}
}{\cleardoublepage}

%% Declaration Page
\newenvironment{declaration}{%
 \thispagestyle{empty}
 \vspace*{0.2\textheight}%
}{\cleardoublepage}

%% Copyright Page
\newenvironment{copyrightnotice}{%
 \thispagestyle{empty}
 \vspace*{0.2\textheight}%
}{\cleardoublepage}

% ------------------------------------------ [ Title and Cover Pages ]
\renewcommand{\maketitle}{%
 \hypersetup{%
  pdfauthor={\@author},
  pdftitle={\@title},
  pdfkeywords={\@keywordlist}
 }
%% Cover Page
\ifcoverpage
{
 \thispagestyle{empty}
 \raggedleft
  \vspace*{0.2\textheight}
 {\HUGE\bfseries \@title}
 \rule{0.9\linewidth}{0.5em}\\[2em]
 {\LARGE \@author}\\[0.2em]
 {\LARGE \@date}
 \vfill
 \cleardoublepage
}
\else\fi
%% Title Page
{
 \thispagestyle{empty}
 \centering
 \vspace*{0.025\textheight}
 \rule{\linewidth}{0.1em}\\[2em]
 {\Huge\bfseries\@title }\\[1em]
 \rule{\linewidth}{0.1em}\\[4em]
 {\LARGE THESIS}
 \vfill
 {\Large submitted to the}
 \vfill
 {\LARGE\textsc \@university}
 \vfill
 {\Large for the degree of}
 \vfill
 {\LARGE\textsc \@degree}
 \vfill
 {\Large by}\\[0.1em]
 {\Large\@author}\\[0.1em]
 {\Large\@email}
 \vfill
 \@logocmd
 \vfill
 {\large\@address}\\[0.1em]
 {\large\@date}
 \vfill
}
\cleardoublepage
\pagestyle{Ruled}
}
\endinput
% ------------------------------------------------------------ [ EOF ]
