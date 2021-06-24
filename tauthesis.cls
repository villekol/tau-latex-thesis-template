%% tauthesis.cls
%% Copyright 2018 Tampere University
%
% This work may be distributed and/or modified
% under the conditions of the LaTeX Project Public
% License, either version 1.3 of this license or
% (at your option) any later version.
%
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is
%   Ville Koljonen (ville.koljonen (at) tuni.fi)
%
% This work consists of the files tauthesis.cls.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tauthesis}
[2021/06/24 v2.0 Thesis styles used in Tampere University]

% Inherit from the report document class.
% Use 12pt nonetheless and scale fonts back
% to make maths closer to actual font size.
\LoadClass[12pt, a4paper]{report}

% Gain access to internal macros.
\makeatletter

%%%%% CLASS OPTIONS %%%%%

\newcommand{\@mainlanguage}{finnish}
\newcommand{\@otherlanguage}{english}
\newcommand{\@citationstyle}{numeric}
\newcommand{\@citationsorting}{none}
\newif\if@customcitation\@customcitationtrue
\newif\if@apacitation\@apacitationfalse

\newif\if@langenglish\@langenglishfalse
\newif\if@taunotdraftmode\@taunotdraftmodetrue
\newif\if@programs\@programsfalse

% Language selection.
\DeclareOption{english}{%
    \@langenglishtrue
    \renewcommand{\@mainlanguage}{english}
    \renewcommand{\@otherlanguage}{finnish}
}
\DeclareOption{finnish}{%
    \@langenglishfalse
    \renewcommand{\@mainlanguage}{finnish}
    \renewcommand{\@otherlanguage}{english}
}

% Citation style selection.
\DeclareOption{numeric}{%
    \renewcommand{\@citationstyle}{numeric}
}
\DeclareOption{authoryear}{%
    \renewcommand{\@citationstyle}{authoryear}
    \renewcommand{\@citationsorting}{nyt}
}
\DeclareOption{apa}{%
    \renewcommand{\@citationstyle}{apa}
    \renewcommand{\@citationsorting}{nyt}
    \@customcitationfalse
    \@apacitationtrue
}
\DeclareOption{ieee}{%
    \renewcommand{\@citationstyle}{ieee}
    \@customcitationfalse
}

% Draft setting
\DeclareOption{draft}{%
    \@taunotdraftmodefalse
}

% Programs to list?
\DeclareOption{programs}{%
    \@programstrue
}

\DeclareOption*{
  \ClassWarning{tauthesis}{Unknown option '\CurrentOption'}
}

% Default options.
\ExecuteOptions{finnish,numeric}

\ProcessOptions\relax

%%%%% PACKAGES AND RELATED DEFINITIONS %%%%%

% ISO-19005 compliant document (pdf/A-2b)
\if@taunotdraftmode
    \RequirePackage[a-2b,mathxmp]{pdfx}
    \catcode30=12
\fi

% UTF-8 input
\RequirePackage[utf8]{inputenc}

% Arial-like font selection
\RequirePackage[scaled=0.91]{helvet}
\RequirePackage[T1]{fontenc}
\renewcommand*\familydefault{\sfdefault}

% Page geometry and heading handling
\RequirePackage
    [top=2.5cm,
    bottom=2.5cm,
    left=4cm,
    right=2cm]{geometry}
\special{papersize={210mm,297mm}}
\RequirePackage{fancyhdr}
\RequirePackage[explicit]{titlesec}
\RequirePackage{setspace}
\RequirePackage{parskip}

\spacing{1.213}
\setlength{\headheight}{14.5pt}

\newlength\chapterspace
\setlength\chapterspace{0.4cm}
\newlength\chapterindent
\setlength\chapterindent{0.5in}

% Try to prevent large figures appearing
% by themselves without any text. Be
% careful not to make \floatpagefraction
% larger than \topfraction.
\renewcommand{\topfraction}{0.85}        % default 0.7
\renewcommand{\textfraction}{0.1}        % default 0.2
\renewcommand{\floatpagefraction}{0.75}

% Define the header and footer content.

\pagestyle{fancyplain}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Define chapter and section heading styles.

\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

% Chapter
\titleformat
    {\chapter}[block]{\raggedright\bf\Large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thechapter.}}{0em}
    {\fancyhf{}\rhead{\thepage}\MakeUppercase{#1}}
\titleformat
    {name=\chapter, numberless}
    {\raggedright\bf\Large}{}{0em}
    {\fancyhf{}\rhead{\thepage}\MakeUppercase{#1}}
\titlespacing{\chapter}{0em}{42pt}{42pt}
\titlespacing{name=\chapter, numberless}{0em}{18pt}{18pt}

% Section
\titleformat
    {\section}[block]{\raggedright\bf\large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thesection}}{0em}{#1}
\titleformat
    {name=\section, numberless}
    {\raggedright\bf\large}{}{0em}{#1}
\titlespacing{\section}{0em}{18pt}{12pt}
\titlespacing{name=\section, numberless}{0em}{18pt}{12pt}

% Subsection
\titleformat
    {\subsection}[block]{\raggedright\bf\large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thesubsection}}{0em}{#1}
\titleformat
    {name=\subsection, numberless}
    {\raggedright\bf\large}{}{0em}{#1}
\titlespacing{\subsection}{0em}{18pt}{12pt}
\titlespacing{name=\subsection, numberless}{0em}{18pt}{12pt}

% Subsubsection
%\titleformat
%    {\subsubsection}{\raggedright\bf\normalsize}
%    {\thesubsubsection}{\chapterspace}{#1}
\titleformat
    {name=\subsubsection, numberless}
    {\raggedright\bf\normalsize}{}{0em}{#1}
\titlespacing{\subsubsection}{0em}{18pt}{12pt}
\titlespacing{name=\subsubsection, numberless}{0em}{18pt}{12pt}

% Language support for Finnish and English
\RequirePackage[\@otherlanguage, main=\@mainlanguage]{babel}
\RequirePackage{csquotes}

% Powerful color package
\RequirePackage{xcolor}
\definecolor{taupurple}{RGB}{78,0,148}

% Date and time handling
\RequirePackage[en-GB,finnish]{datetime2}
\DTMlangsetup[en-GB,finnish]{showdayofmonth=false}

% Smart bibliography handling
\RequirePackage
    [backend=biber,
    autolang=other,
    citestyle=\@citationstyle,
    bibstyle=\@citationstyle]{biblatex}

\DefineBibliographyStrings{finnish}{%
    bibliography = {Lähteet},
    references = {Lähteet}
}
\DefineBibliographyStrings{english}{%
    bibliography = {References},
    references = {References}
}

\if@apacitation
    \DeclareLanguageMapping{english}{english-apa}
\fi

% Graphics inclusion and drawing
\RequirePackage{graphicx}

% Caption formatting
\RequirePackage
    [labelfont={bf,it},
    font=it,
    labelsep=period]{caption}
\renewcommand{\arraystretch}{1.25}

% Code listing handling
\if@programs
    \RequirePackage{listings}
    % textcl=true courtesy of Mika Kuitula
    \lstset{texcl=true, captionpos=b, commentstyle=\tt}
\fi

% List of symbols and abbreviations
\RequirePackage[automake, nonumberlist, nopostdot]{glossaries}

\if@langenglish
    \newcommand{\@glossaryname}{List of Symbols and Abbreviations}
    \newcommand{\@appendixname}{Appendix}
\else
    \newcommand{\@glossaryname}{Lyhenteet ja merkinnät}
    \newcommand{\@appendixname}{Liite}
\fi

\newlength\glsnamewidth
\newglossarystyle{taulong}{%
    \setglossarystyle{long}%
    \renewenvironment{theglossary}{%
      \tablehead{}%
      \tabletail{}%
      \begin{longtable}{p{\glsnamewidth}p{\glsdescwidth}}%
    }{%
      \end{longtable}%
    }%
    \renewcommand{\glossentry}[2]{%
    \raggedright
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \glossentrydesc{##1}\glspostdescription\space ##2\tabularnewline
    }%
}

% Table of contents formatting
\RequirePackage{titletoc}

\titlecontents{chapter}[0pt]{}%
    {\parbox[t]{2em}{\thecontentslabel.}}{}{\titlerule*[1pc]{.}\contentspage}
\dottedcontents{section}[4em]{}{2em}{1pc}
\dottedcontents{subsection}[7em]{}{3em}{1pc}

\newenvironment{appendices}{%
\setcounter{chapter}{0}
\renewcommand{\thechapter}{\Alph{chapter}}
\renewcommand{\theHchapter}{\Alph{chapter}}
\titleformat
    {\chapter}{\raggedright\bf\Large%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\MakeUppercase{\appendixname~\thechapter:}}{\chapterspace}
    {\fancyhf{}\rhead{\thepage}\MakeUppercase{##1}}
\titlecontents{chapter}[0pt]{}%
    {\@appendixname~\thecontentslabel:~}{}{\titlerule*[1pc]{.}\contentspage}
}{}

\if@langenglish
    \addto\captionsenglish{%
        \renewcommand{\contentsname}{Contents}%
        \renewcommand\listfigurename{List of Figures}%
        \renewcommand{\listtablename}{List of Tables}%
    }
    \renewcommand{\appendixname}{\MakeUppercase{Appendix}}
    \if@programs
        \renewcommand{\lstlistlistingname}{List of Programs and Algorithms}
    \fi
\else
    \addto\captionsfinnish{%
        \renewcommand{\contentsname}{Sisällysluettelo}%
        \renewcommand\listfigurename{Kuvaluettelo}%
        \renewcommand{\listtablename}{Taulukkoluettelo}%
    }
    \renewcommand{\appendixname}{\MakeUppercase{Liite}}
    \if@programs
        \renewcommand{\lstlistlistingname}{Ohjelma- ja algoritmiluettelo}
    \fi
\fi

% Flexible list modifications
\RequirePackage{enumitem}

\setlist{itemsep=-3pt, labelindent=1.27cm}

% Image alt texts
\RequirePackage{pdfcomment}

% Automated math alt texts.
\RequirePackage[accsupp]{axessibility}

% Text hyperlinking
\RequirePackage{hyperref}
%\RequirePackage{url}
\urlstyle{same}

%%%%% COMMAND DEFINITIONS %%%%%

% Functional language selection
\newcommand{\xselectlanguage}[1]{%
  \begingroup\edef\x{\endgroup
    \noexpand\selectlanguage{#1}}\x
}

% \title command
\renewcommand{\title}[2]{%
    \gdef\@title{#1}
    \gdef\@othertitle{#2}
}
\renewcommand{\@title}[1]{
    \@latex@warning@no@line{No \noexpand\title given.}
}
\newcommand{\@othertitle}[1]{
    \@latex@warning@no@line{No \noexpand\othertitle given.}
}

% \subtitle command
\newcommand{\subtitle}[2]{%
    \gdef\@subtitle{#1}
    \gdef\@othersubtitle{#2}
}
\newcommand{\@subtitle}[1]{
    \@latex@warning@no@line{No \noexpand\subtitle given.}
}
\newcommand{\@othersubtitle}[1]{
    \@latex@warning@no@line{No \noexpand\othersubtitle given.}
}

% \thesistype command
\newcommand{\thesistype}[2]{
    \gdef\@thesistype{#1}
    \gdef\@otherthesistype{#2}
}
\newcommand{\@thesistype}[1]{%
    \@latex@warning@no@line{No \noexpand\thesistype given.}
}
\newcommand{\@otherthesistype}[1]{%
    \@latex@warning@no@line{No \noexpand\otherthesistype given.}
}

% \facultyname command
\newcommand{\facultyname}[2]{
    \gdef\@facultyname{#1}
    \gdef\@otherfacultyname{#2}
}
\newcommand{\@facultyname}[1]{
    \@latex@warning@no@line{No \noexpand\facultyname given.}
}
\newcommand{\@otherfacultyname}[1]{
    \@latex@warning@no@line{No \noexpand\otherfacultyname given.}
}

% \examiner command
\if@langenglish
    \newcommand{\@examinername}{Examiner}
\else
    \newcommand{\@examinername}{Tarkastaja}
\fi

\newcommand{\examiner}[2][\@examinername]{
    \gdef\@finalexaminername{#1}
    \gdef\@givenexaminer{#2}
}
\newcommand{\@examiner}[2]{
    #1: #2
}

% \finishdate command
\newcommand{\finishdate}[3]{
    \gdef\@finishyear{#1}
    \gdef\@finishmonth{#2}
    \gdef\@finishday{#3}
}
\newcommand{\@finishyear}[1]{
    \@latex@warning@no@line{No \noexpand\finishyear given.}
}
\newcommand{\@finishmonth}[1]{
    \@latex@warning@no@line{No \noexpand\finishmonth given.}
}
\newcommand{\@finishday}[1]{
    \@latex@warning@no@line{No \noexpand\finishday given.}
}

% \programmename command
\newcommand{\programmename}[2]{
    \gdef\@programmename{#1}
    \gdef\@otherprogrammename{#2}
}
\newcommand{\@programmename}[1]{
    \@latex@warning@no@line{No \noexpand\programmename given.}
}
\newcommand{\@otherprogrammename}[1]{
    \@latex@warning@no@line{No \noexpand\otherprogrammename given.}
}

% \keywords command
\newcommand{\keywords}[2]{
    \gdef\@keywords{#1}
    \gdef\@otherkeywords{#2}
}
\newcommand{\@keywords}[1]{
    \@latex@warning@no@line{No \noexpand\keywords given.}
}
\newcommand{\@otherkeywords}[1]{
    \@latex@warning@no@line{No \noexpand\otherkeywords given.}
}

% \frontmatter command
\newcommand{\frontmatter}{
    \clearpage
    \pagenumbering{roman}
    \setcounter{page}{0}
}

% \mainmatter command
\newcommand{\mainmatter}{
    \clearpage
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

% Originality texts
\newcommand{\@finoriginalitytext}{%
Tämän julkaisun alkuperäisyys on tarkastettu Turnitin OriginalityCheck -ohjelmalla.
}
\newcommand{\@engoriginalitytext}{%
The originality of this thesis has been checked using the Turnitin OriginalityCheck service.
}

% Terminology settings
\if@langenglish
    \newcommand{\@abstractname}{Abstract}
    \newcommand{\@otherabstractname}{Tiivistelmä}
    \newcommand{\@university}{Tampere University}
    \newcommand{\@otheruniversity}{Tampereen yliopisto}
    \newcommand{\@keywordname}{Keywords}
    \newcommand{\@otherkeywordname}{Avainsanat}
    \newcommand{\@prefacename}{Preface}
    \newcommand{\@originalitytext}{\@engoriginalitytext}
    \newcommand{\@otheroriginalitytext}{\@finoriginalitytext}
    \newcommand{\@logofile}{figures/tau-logo-eng.eps}
\else
    \newcommand{\@abstractname}{Tiivistelmä}
    \newcommand{\@otherabstractname}{Abstract}
    \newcommand{\@university}{Tampereen yliopisto}
    \newcommand{\@otheruniversity}{Tampere University}
    \newcommand{\@keywordname}{Avainsanat}
    \newcommand{\@otherkeywordname}{Keywords}
    \newcommand{\@prefacename}{Alkusanat}
    \newcommand{\@originalitytext}{\@finoriginalitytext}
    \newcommand{\@otheroriginalitytext}{\@engoriginalitytext}
    \newcommand{\@logofile}{figures/tau-logo-fin.eps}
\fi

% Make the title
\renewcommand\maketitle{
    \thispagestyle{empty}
    \vspace*{-1.88cm}\hspace*{-2.7cm}\includegraphics[height=2.07cm]{\@logofile}
    \par\medskip
    \vspace{102pt}
    {\raggedleft\Large\@author\par}
    \vspace{42pt}
    {\raggedleft\bf\LARGE\color{taupurple}%
        \MakeUppercase{\@title}\par}
    {\raggedleft\Large\color{taupurple}%
        \@subtitle\par}
    \vfill
    {\raggedleft%
        \@thesistype\\%
        \@facultyname\\%
        \@examiner{\@finalexaminername}{\@givenexaminer}\\%
        \DTMDisplaydate%
            {\@finishyear}%
            {\@finishmonth}%
            {\@finishday}{-1}%
    \par}
    \vspace{42pt}
    \clearpage
}

% Make the abstracts
\renewcommand{\abstract}[1]{
    \clearpage
    \chapter*{\abstractname}
    \begin{spacing}{1.000}
    {\small
        \setlength{\parindent}{15pt}
        \setlength{\parskip}{0pt}
        \noindent\@author: \@title\par
        \noindent\@thesistype\par
        \noindent\@university\par
        \noindent\@programmename\par
        \noindent\DTMDisplaydate%
            {\@finishyear}%
            {\@finishmonth}%
            {\@finishday}{-1}\par
        \noindent\hrulefill\par
        \vspace{0.5\baselineskip}
        \input{#1}\par
        \bigskip
        \noindent\@keywordname: \@keywords\par
        \bigskip
        \noindent\@originalitytext
    \par}
    \end{spacing}
    \clearpage
}
\newcommand{\otherabstract}[1]{
    \clearpage
    \xselectlanguage{\@otherlanguage}
    \chapter*{\@otherabstractname}
    \begin{spacing}{1.000}
    {\small
        \setlength{\parindent}{15pt}
        \setlength{\parskip}{0pt}
        \noindent\@author: \@othertitle\par
        \noindent\@otherthesistype\par
        \noindent\@otheruniversity\par
        \noindent\@otherprogrammename\par
        \noindent\DTMDisplaydate%
            {\@finishyear}%
            {\@finishmonth}%
            {\@finishday}{-1}\par
        \noindent\hrulefill\par
        \vspace{0.5\baselineskip}
        \input{#1}\par
        \bigskip
        \noindent\@otherkeywordname: \@otherkeywords\par
        \bigskip
        \noindent\@otheroriginalitytext
    \par}
    \end{spacing}
    \xselectlanguage{\@mainlanguage}
}

% Make the preface
\newcommand{\preface}[2]{
    \clearpage
    \chapter*{\@prefacename}
    \noindent\input{#1}\par
    \bigskip
    \DTMlangsetup[en-GB,finnish]{showdayofmonth=true}
    \noindent#2,
    \DTMdisplaydate%
        {\@finishyear}%
        {\@finishmonth}%
        {\@finishday}{-1}\par
    \bigskip
    \noindent\@author
    \clearpage
}

\makeatother

\endinput