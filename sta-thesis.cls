%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyright 2015 - Jan de Muijnck-Hughes
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
\ProvidesClass{sta-thesis}[2015/04/07 v2015.04.07 sta-thesis]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX class for producing theses. This style builds upon existing
%% LaTeX packages combining them into a consistent class that is
%% (hopefully) easy to use, making the writing of a thesis easier.
%% Important packages included by default are:
%%   Memoir
%%   todonotes
%%   amsmath
%%   thmtools
%%
%% For the full list just scroll down a little further.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class Options:
%%
%%   customfonts -> Turn of import of default fonts
%%
%%
%% Mutually Exclusive options:
%%
%%   + Thesis Mode.
%%     + draft  -> send draft mode to memoir and todonotes
%%     + final* -> send final mode to memoir and disable todonotes
%%
%%   + Display Mode.
%%     + print*     -> ready thesis for printing.
%%     + electronic -> ready thesis for an electronic version.
%%     + screen     -> ready thesis for displaying in ebooks.
%%
%%   + Linespacing for print version.
%%     + single*  -> Single line spacing
%%     + onehalf  -> 1.5 line spacing
%%     + double   -> Double line spacing
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TODO:
%%
%% Set drafting page styling using Memoir only.
%% Setup KVOptions for booleans.
%%
% ---------------------------------------------------------------------- [ EOH ]
% ------------------------------------------------------------------ [ Options ]

% Line Spacing Options for Print
\newif\ifsingle{}
\newif\ifonehalf{}
\newif\ifdouble{}

% Which display mode are we in.
\newif\ifprinting{}
\newif\ifscreen{}
\newif\ifelectronic{}

% Use custom fonts
\newif\ifcustomfonts{}

% Cover Page
\newif\ifcoverpage{}

% Default boolean values
\printingtrue{}
\screenfalse{}
\electronicfalse{}

\singlefalse{}
\onehalftrue{}
\doublefalse{}

\customfontsfalse{}
\coverpagefalse{}
% --------------------------------------------------------- [ Drafting Options ]
\DeclareOption{draft}{%
  \PassOptionsToClass{draft}{memoir}
}

\DeclareOption{final}{%
  \PassOptionsToClass{final}{memoir}
  \PassOptionsToPackage{disable,colorinlistoftodos}{todonotes}
}
% ----------------------------------------------------- [ Line Spacing Options ]
\DeclareOption{single}{%
  \doublefalse{}
  \onehalffalse{}
  \singletrue{}
}
\DeclareOption{onehalf}{%
  \doublefalse{}
  \onehalftrue{}
  \singlefalse{}
}
\DeclareOption{double}{%
  \doubletrue{}
  \onehalffalse{}
  \singlefalse{}
}
% ----------------------------------------------------- [ Display Mode Options ]
\DeclareOption{screen}{%
  \electronicfalse{}
  \printingfalse{}
  \screentrue{}
  \PassOptionsToClass{pdftex,british,10pt,ebook}{memoir}
}

\DeclareOption{print}{%
  \electronicfalse{}
  \screenfalse{}
  \printingtrue{}
  \PassOptionsToClass{pdftex,british,12pt,a4paper}{memoir}
}

\DeclareOption{electronic}{%
  \printingfalse{}
  \screenfalse{}
  \electronictrue{}
  \PassOptionsToClass{pdftex,british,12pt,a4paper}{memoir}
}
% ------------------------------------------------- [ Custom Font Usage Option ]
\DeclareOption{customfonts}{%
  \customfontstrue{}
}
% ---------------------------------------------------------------- [ Coverpage ]
\DeclareOption{coverpage}{%
  \coverpagetrue{}
}
% --------------------------------------------------------------------- [ Misc ]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
% ---------------------------------------------------------- [ Process Options ]
\ProcessOptions\relax
% ------------------------------------------------------------------- [ Memoir ]
\LoadClass{memoir}
% ----------------------------------------------------------------- [ Packages ]
\RequirePackage[l2tabu,
                orthodox]{nag}
\RequirePackage{etoolbox}
\RequirePackage{microtype}
\RequirePackage{environ}
\RequirePackage{xspace}
\RequirePackage{tocbibind}
\RequirePackage{xcolor}
\RequirePackage[british,iso]{isodate}
\RequirePackage{color,calc,soul,fourier}
\RequirePackage[british]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[strict=true]{csquotes}

\ifcustomfonts%
%
\else
  \RequirePackage[sc]{mathpazo}
  \RequirePackage{helvet}
  \RequirePackage{courier}
  \RequirePackage[T1]{fontenc}
\fi

\RequirePackage{sta-colours}
%% Math Packages
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage[fixamsmath]{mathtools}
\RequirePackage{thmtools}
\RequirePackage{thm-restate}
\RequirePackage{fixmath}
\RequirePackage[all,
                error]{onlyamsmath}

\RequirePackage[inline]{enumitem}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage[pdftex,final]{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage[pdftex]{hyperref}
\RequirePackage{memhfixc}
\RequirePackage{bookmark}
\RequirePackage{tikz}
%% For Draft Mode
\RequirePackage[obeyDraft,
                colorinlistoftodos,
                textsize=small,
                color=orange!20!white,
                linecolor=black]{todonotes}
\RequirePackage{ifdraft}

% ------------------------------------------------ [ Because..you know...LaTeX ]
\let\@@tikzpicture\tikzpicture
\def\tikzpicture{\catcode`\$=3 \@@tikzpicture}
%% ------------------------------------------------------- [ Metadata Commands ]

\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\theuniversity}[1]{\@university\xspace}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\thedegree}{\@degree\xspace}
\newcommand{\logocmd}[1]{\gdef\@logocmd{#1}}
\newcommand{\wordcount}[1]{\gdef\@wordcount{#1}}
\newcommand{\thewordcount}{\@wordcount\xspace}
\newcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\email}[1]{\gdef\@email{%
  \ifprinting%
    \texttt{#1}
  \else%
    \href{mailto:#1}{#1}
  \fi}}
\newcommand{\keywordlist}[1]{\gdef\@keywordlist{#1}}
\newcommand{\startdate}[2]{\gdef\@startmonth{#1}\gdef\@startyear{#2}}
\newcommand{\finishdate}[2]{\gdef\@finishmonth{#1}\gdef\@finishyear{#2}}

\newcommand{\thestartdate}{\@startmonth~\@startyear}
\newcommand{\thestartmonth}{\@startmonth}
\newcommand{\thestartyear}{\@startyear}

\newcommand{\thefinishdate}{\@finishmonth~\@finishyear}
\newcommand{\thefinishmonth}{\@finishmonth}
\newcommand{\thefinishyear}{\@finishyear}

\newcommand{\thesigningdate}{{\origdate\thedate}}

\newcommand{\signature}[1]{%
\vspace{3em}
\noindent%
Signature of~#1:\xspace\dotfill\\
\begin{flushright}
  Date:~\thesigningdate{}
\end{flushright}}

\newcommand{\mySignature}{\signature{Candidate}}
\newcommand{\supervisorSignature}{\signature{Supervisor}}

\newcommand{\theAcknowledgementStamp}[1]{%
\vspace{3em}
\begin{flushright}
\theauthor{}\\
#1\\
\thesigningdate{}
\end{flushright}
\vfill}
% ------------------------------------------------------ [ Page Layout Styling ]

\newcommand{\tocChpAdd}[2]{#1\addcontentsline{toc}{chapter}{#2}}
\newcommand{\tocPage}[1]{#1\cleardoublepage}


% ------------------------------------------------------------ [ Draft Styling ]
\ifdraft{
%% Line Numbering
  \RequirePackage[pagewise]{lineno}
  \RequirePackage{geometry}
  \renewcommand{\linenumberfont}{\normalfont\scriptsize\bfseries}
  \setlength{\linenumbersep}{2mm}
  \linenumbers{}
  \modulolinenumbers[2]
  \DoubleSpacing{}
%% Page Layout
  \geometry{%
    asymmetric,
    includeall,
    vmargin=10mm,
    left=10mm,
    rmargin=5mm,
    marginparsep=5mm,
    marginparwidth=55mm
  }
%% Paragraph Styling
  \setlength{\parskip}{1.3ex plus 0.2ex minus 0.2ex}
  \setlength{\parindent}{0pt}
}{%
% ----------------------------------------------------- [ Styling for Printing ]
  \ifprinting
    \settrimmedsize{\stockheight}{\stockwidth}{*}
    \settrims{0pt}{0pt}

    \setlrmarginsandblock{*}{30mm}{1.5}
    \setulmarginsandblock{4cm}{*}{*}                      %

    \setheadfoot{\onelineskip}{2\onelineskip}
    \setheaderspaces{*}{2\onelineskip}{*}

    \ifsingle
      \SingleSpacing{}
    \fi
    \ifonehalf
     \OnehalfSpacing{}
    \fi
    \ifdouble
      \DoubleSpacing{}
    \fi
  \fi
% --------------------------------------------------- [ Styling for Electronic ]
  \ifelectronic
    \settrimmedsize{\stockheight}{\stockwidth}{*}
    \settrims{0pt}{0pt}

    \settypeblocksize{634pt}{448.13pt}{*}
    \setulmargins{4cm}{*}{*}
    \setlrmargins{*}{*}{1}

    \setheadfoot{\onelineskip}{2\onelineskip}
    \setheaderspaces{*}{2\onelineskip}{*}

    \OnehalfSpacing{}
  \fi
% ------------------------------------------------------- [ Styling for Screen ]
  \ifscreen

    \setlength{\parskip}{1.3ex plus 0.2ex minus 0.2ex}
    \setlength{\parindent}{0pt}


    \settrimmedsize{\stockheight}{\stockwidth}{*}
    \settrims{0pt}{0pt}

    \setlrmarginsandblock{*}{0.75in}{1}
    \setulmarginsandblock{0.75in}{*}{*}

    \setheadfoot{\onelineskip}{2\onelineskip}
    \setheaderspaces{*}{2\onelineskip}{*}

    \setmarginnotes{0pt}{0pt}{0pt}

    \OnehalfSpacing{}
\fi
%% Finalise the Layout
  \checkandfixthelayout{}
  \fixpdflayout{}
}

%% ------------------------------------------------ [ Default Look and Feel ]
\setsecnumdepth{subsection}

\settocdepth{section}
\renewcommand{\cftpartnumwidth}{2em}

%% Printing Dependent styling
\ifprinting
 \selectcolormodel{cmyk}
 \hypersetup{
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  urlcolor=black
 }
\else
 \selectcolormodel{RGB}
 \hypersetup{%
  colorlinks=true,
  linkcolor=sta-blue,
  anchorcolor=sta-blue,
  citecolor=sta-blue,
  urlcolor=sta-blue
 }
\fi
%% ---------------------------------------------------------------- [ enumitem ]
% Provide paralist compatible macroes
% TODO Make native
% Within Paragraph lists
\newlist{inparaenum}{enumerate*}{1}
\setlist[inparaenum,1]{label=(\alph*),
before=\unskip{: }, itemjoin={{; }}, itemjoin*={{; and }}
}

\newlist{inparaenumor}{enumerate*}{1}
\setlist[inparaenumor,1]{label=(\alph*),before=\unskip{: }, itemjoin={{; }}, itemjoin*={{; or }}}



\newlist{inparadesc}{description*}{1}
\setlist[inparadesc,1]{%
  font=\bfseries,%
  before=\unskip{: },%
  itemjoin={{; }},%
  itemjoin*={{; and }}%
}

% Compact Lists
\newlist{compactitem}{itemize}{3}
\setlist[compactitem]{topsep=0pt,partopsep=0pt,itemsep=0pt,parsep=0pt}
\setlist[compactitem,1]{label=\textbullet}
\setlist[compactitem,2]{label=--}
\setlist[compactitem,3]{label=*}

\newlist{compactdesc}{description}{3}
\setlist[compactdesc]{topsep=0pt,partopsep=0pt,itemsep=0pt,parsep=0pt}

\newlist{compactenum}{enumerate}{3}
\setlist[compactenum]{topsep=0pt,partopsep=0pt,itemsep=0pt,parsep=0pt}
\setlist[compactenum,1]{label=\arabic*)}
\setlist[compactenum,2]{label=\alph*)}
\setlist[compactenum,3]{label=\roman*)}

% ----------------------------------------------------------- [ Precis Styling ]
\NewEnviron{precise}{%
  \begin{quote}\em
    \BODY{}
  \end{quote}
}
% ------------------------------------------------------------------- [ Quotes ]
\newcommand{\squote}[1]{\xspace`#1'\xspace}
\newcommand{\dquote}[1]{\xspace``#1''\xspace}
%% ------------------------------------------------------------ [ contractions ]

\DeclareRobustCommand\onedot{\futurelet\@let@token\@onedot}
\def\@onedot{\ifx\@let@token.\else.\null\fi\xspace}
\def\eg{{e.g}\onedot}
\def\ie{{i.e}\onedot}
\def\cf{{cf}\onedot}
\def\etc{{etc}\onedot}
\def\vs{{vs}\onedot}
\def\wrt{w.r.t\onedot}
\def\dof{d.o.f\onedot}
\def\etal{{et al}\onedot}

% ----------------------------------------------------------------- [ Graphics ]
\graphicspath{{image/}{figure/}{logo/}}
\DeclareGraphicsExtensions{.pdf,.png,.jpg,.eps}

%% ----------------------------------------------------- [ Epigraph formatting ]
\epigraphposition{flushright}
\epigraphtextposition{flushleftright}
\epigraphsourceposition{flushright}
\setlength{\epigraphwidth}{0.5\textwidth}
%% ---------------------------------------------------------------- [ Abstract ]
\renewcommand{\abstractnamefont}{\sffamily\LARGE\bfseries}
\renewcommand{\abstracttextfont}{\normalfont\normalsize}
\addto\captionsbritish{\renewcommand*\abstractname{Abstract}}

\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}

%% ---------------------------------------------- [ Chapter and Heading Styles ]
% Draft
\makepagestyle{draft}

\makeoddhead{draft}{}{}{Draft compiled on \today}
\makeevenhead{draft}{}{}{Draft compiled on \today}

\makeoddfoot{draft}{}{}{Page--\thepage}
\makeevenfoot{draft}{}{}{Page--\thepage}

% Frontpage
\makepagestyle{frontpage}

\makeoddhead{frontpage}{}{}{}
\makeevenhead{frontpage}{}{}{}

\makeoddfoot{frontpage}{}{}{}
\makeevenfoot{frontpage}{}{}{}

% Apply Styling
\ifdraft{%
 \pagestyle{draft}
}{%
 \pagestyle{Ruled}
}

% Headings
\headstyles{komalike}
\chapterstyle{madsen}

%% ----------------------------------------------------------- [ Theorems ]
\declaretheoremstyle[%
  spaceabove=1em,
  spacebelow=1em,
  headfont=\sffamily\bfseries,
  bodyfont=\normalfont\em,
  postheadspace=0.75em
]{thmstyle}

\declaretheoremstyle[%
  spaceabove=1em,
  spacebelow=1em,
  headfont=\sffamily\bfseries,
  bodyfont=\normalfont,
  postheadspace=0.75em
]{notestyle}

\declaretheoremstyle[%
  spaceabove=1.5em,
  spacebelow=1.5em,
  headfont=\sffamily\bfseries,
  bodyfont=\normalfont\em,
  postheadspace=0.75em
]{hypostyle}

\declaretheorem[%
    style=hypostyle,
    name={Hypothesis}
  ]{hypothesis}

\declaretheorem[%
    style=hypostyle,
    parent=hypothesis,
    name={Sub-Hypothesis}
  ]{subhyp}

\declaretheorem[style=notestyle, starred, name={\textbf{Note}}]{note}
\declaretheorem[style=notestyle, starred, name={\textbf{Remark}}]{remark}
\declaretheorem[style=notestyle, starred, name={\textbf{Aside}}]{aside}

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

% -------------------------------------------------------------- [ Misc Macros ]

\newcommand{\furl}[1]{\footnote{\url{#1}}}

% ---------------------------------------------- [ TODO Note Macros ]

\newcommand{\addref}{\todo{Add Reference}}

\newcommand{\maybe}[1]{\todo{Should I: #1??}}
\newcommand{\maybecite}{\todo{Should Cite??}}

% nasty hack to get spacing to work
\newcommand{\fixtodo}[2][]{%
\todo[caption={#2}, size=\small, #1]{%
\begin{Spacing}{.75}#2\end{Spacing}}}

\NewEnviron{fncycomment}[1][Comment]{%
\fixtodo[inline, caption={#1}]{%
\begin{minipage}{\linewidth}%
\textbf{\uppercase{#1}}
\BODY{}
\end{minipage}}}

\newcommand{\anote}[2][]{%
\fixtodo{\textbf{\uppercase{#1}}~#2
}}

% ----------------------------------------------- [ Predefined Pages ]


%% Dedication Page
\NewEnviron{dedication}{%
 \thispagestyle{empty}
 \vspace*{0.2\textheight}%
 \begin{flushright}%
 \BODY{}
 \end{flushright}%
 \cleardoublepage{}
}

%% Declaration Page
\NewEnviron{declaration}{%
\thispagestyle{empty}
\BODY{}
\cleardoublepage{}}
%
%% Copyright page
\NewEnviron{permission}{%
\thispagestyle{empty}
\BODY{}
\cleardoublepage{}}

\newcommand{\makeDeclaration}{%
\begin{declaration}
\section*{Candidate's Declaration}

I, \theauthor{}, hereby certify that this thesis, which is approximately \thewordcount{} words in length, has been written by me, and that it is the record of work carried out by me, or principally by myself in collaboration with others as acknowledged, and that it has not been submitted in any previous application for a higher degree.\\

\noindent
I was admitted as a research student in \thestartdate{}, and as a candidate for the degree of \thedegree{} in \thefinishdate{}; the higher study, for which this is a record, was carried out in the \theuniversity{} between \thestartyear{} and \thefinishyear{}.
\\

\mySignature{}

\section*{Supervisor's Declaration}

I hereby certify that the candidate has fulfilled the conditions of the Resolution and Regulations appropriate for the degree of \thedegree{} in the \theuniversity{} and that the candidate is qualified to submit this thesis in application for that degree.

\supervisorSignature{}
\end{declaration}}


%% Acknowledgement Page
\NewEnviron{acknowledgements}{%
  \chapter*{Acknowledgements}
  %\addcontentsline{toc}{chapter}{Acknowledgements}
  \BODY{}
  \cleardoublepage{}
}

\newcommand{\makePermission}{%
\begin{permission}
\section*{Permission for Publication}

In submitting this thesis to the University of St Andrews I understand that I am giving permission for it to be made available for use in accordance with the regulations of the University Library for the time being in force, subject to any copyright vested in the work not being affected thereby.
I also understand that the title and the abstract will be published, and that a copy of the work may be made and supplied to any bona fide library or research worker, that my thesis will be electronically accessible for personal or research use unless exempt by award of an embargo as requested below, and that the library has the right to migrate my thesis into new electronic forms as required to ensure continued access to the thesis.
I have obtained any third-party copyright permissions that may be required in order to allow such access and migration, or have requested the appropriate embargo below.
\\

\noindent
The following is an agreed request by candidate and supervisor regarding the publication of this thesis:

\begin{center}
No embargo on any electronic nor print copy.
\end{center}

\mySignature{}
\supervisorSignature{}

\end{permission}}


%% Abstract
\NewEnviron{theabstract}{%
\thispagestyle{empty}
  \begin{abstract}
    \BODY{}
  \end{abstract}
\cleardoublepage{}}
%% -------------------------------------------------------------- [ Title Page ]
\renewcommand{\maketitle}{%
 \hypersetup{%
  pdfauthor={\@author},
  pdftitle={\@title},
  pdfkeywords={\@keywordlist}
 }
 \ifcoverpage{}
   \thispagestyle{empty}
   \begin{flushright}
   \vspace*{0.2\textheight}
   {\LARGE \@title}
   \rule{0.9\linewidth}{0.5em}\\[2em]
   {\Large \@author}\\[0.2em]
   {\Large \thefinishmonth~\thefinishyear}
   \vfill
 \end{flushright}
 \cleardoublepage
 \fi
 \begin{titlingpage}
 \centering
 \vspace*{0.025\textheight}
 {\Huge\bfseries\@title }
 \vfill
 {\Large by}
 \vfill
 {\huge\@author}\\[0.1em]
 \vfill
 \@logocmd
 \vfill
 {\Large This thesis is submitted to the}
 \vfill
 {\LARGE\textsc \@university}
 \vfill
 {\Large in partial fulfilment for the degree of}
 \vfill
 {\LARGE\textsc \@degree}
 \vfill
 {\Large submitted on}\\[2em]
 {\Huge\@date}
 \vfill
 {\large Copyright\xspace\copyright\xspace\the\year\xspace by\xspace\@author}
 \vfill
 \end{titlingpage}
 \thispagestyle{plain}
}

\newlength\dlf@normtxtw
\setlength\dlf@normtxtw{\textwidth}
\def\myhelvetfont{\def\sfdefault{mdput}}
\newsavebox{\feline@chapter}
\newcommand\feline@chapter@marker[1][4cm]{%
  \sbox\feline@chapter{%
    \resizebox{!}{#1}{\fboxsep=1pt%
      \colorbox{black}{\color{white}\bfseries\sffamily\thechapter}%
    }}%
  \rotatebox{90}{%
    \resizebox{%
      \heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}%
    {!}{\scshape\so\@chapapp}}\quad%
  \raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
}
\newcommand\feline@chm[1][4cm]{%
  \sbox\feline@chapter{\feline@chapter@marker[#1]}%
  \makebox[0pt][l]{% aka \rlap
    \makebox[1cm][r]{\usebox\feline@chapter}%
  }}
\makechapterstyle{daleif1}{
  \renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft\so}
  \renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{black}}
  \renewcommand\chapternamenum{}
  \renewcommand\printchaptername{}
  \renewcommand\printchapternum{\null\hfill\feline@chm[2.5cm]\par}
  \renewcommand\afterchapternum{\par\vskip\midchapskip}
  \renewcommand\printchaptertitle[1]{\chaptitlefont\raggedleft ##1\par}
}
\endinput
% ------------------------------------------------------------ [ EOF ]
