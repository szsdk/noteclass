%vim: set ft=latex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{noteclass}[25/01/2012, v1.0]
\LoadClass[a4paper,twoside]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}

%\RequirePackage{vector}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=NOTECLASS, prefix=NOTECLASS@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{NOTECLASS}{#1}}

%---------------------------
%Color defination
%---------------------------

\RequirePackage[svgnames]{xcolor}

\definecolor{color1}{RGB}{0,0,90} % Color of the article title and sections
\definecolor{color2}{RGB}{0,20,20} % Color of the boxes behind the abstract and headings

%---------------------------
%Declare Options
%---------------------------

\DeclareStringOption[eng]{lang}[eng]
\DeclareVoidOption{eng}{\ekv{lang = eng}}
\DeclareVoidOption{zh}{\ekv{lang = zh}}

\DeclareStringOption[margin]{mgn}[margin]
\DeclareVoidOption{margin}{\ekv{mgn = margin}}
\DeclareVoidOption{nomargin}{\ekv{mgn = nomargin}}
%---------------------------
%hyperlink
%---------------------------

\RequirePackage[unicode,psdextra]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=color2,citecolor=color1,linkcolor=color1,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}

\ProcessKeyvalOptions*\relax

% ------ Language --

%\RequirePackage{amsmath}
\ifdefstring{\NOTECLASS@lang}{zh}{
    \RequirePackage{ctex}
%----------------------------------------------------------------------
%	Unicode
%----------------------------------------------------------------------
    %\RequirePackage{xeCJK}
    \RequirePackage{indentfirst}
    \setCJKmainfont[BoldFont={微软雅黑},ItalicFont={楷体}]{宋体}%方正书宋_GBK Adobe Song Std L
    \setCJKsansfont[]{微软雅黑}
    \setCJKsansfont[BoldFont={楷体}]{文泉驿微米黑}
    \setCJKmonofont[]{微软雅黑}
    \setmainfont[BoldFont={微软雅黑}]{Minion Pro}%方正书宋_GBK Adobe Song Std L
    \renewcommand{\contentsname}{目\hspace{1em}录}
    \renewcommand{\figurename}{图}
    \renewcommand{\abstractname}{摘\hspace{1em}要}
    \renewcommand{\tablename}{表}
    \renewcommand{\partname}{部分}
    \renewcommand{\listfigurename}{\bfseries 插图目录}
    \renewcommand{\listtablename}{\bfseries 表格目录}
%\renewcommand{\bibname}{\bfseries 参考文献}
    \renewcommand{\appendixname}{\bfseries 附\hspace{2em}录}
    \renewcommand{\indexname}{\bfseries 索\hspace{2em}引}
    \setlength{\parindent}{2em} 

    \renewcommand{\figureautorefname}{图}

    %\crefformat{equation}{#2式(#1)#3}
    %\crefformat{figure}{#2图#1#3}
    %\crefformat{table}{#2表#1#3}
    %\crefformat{section}{#2第#1章#3}
    %\crefformat{subsection}{#2第#1节#3}
}{\relax}

%---------------------------
%margin note and page style
%---------------------------

\ifdefstring{\NOTECLASS@mgn}{margin}{
\RequirePackage{marginnote}
%\RequirePackage[top=1.5cm, bottom=1.5cm, outer=5cm, inner=2cm, heightrounded, marginparwidth=2.5cm, marginparsep=2cm]{geometry}
\RequirePackage[top=3.5cm, bottom=3.5cm, outer=7cm, inner=2.5cm, heightrounded, marginparwidth=4.5cm, marginparsep=1.5cm]{geometry}
}{
\RequirePackage[top=3.5cm, bottom=3.5cm,outer=2cm, inner=3.5cm, heightrounded]{geometry}
}

%---------------------------
%section style
%---------------------------

\RequirePackage[center,pagestyles]{titlesec}
\ifdefstring{\NOTECLASS@lang}{zh}{
    \titleformat{\section}[hang]{\bfseries}
    {\hspace{-80pt}\makebox[70pt][r]{\rmfamily\fontspec{方正粗宋简体}\Large{\color{color1}\thesection}}}{10pt}{\rmfamily\fontspec{FZCuSong-B09S}\CJKfontspec{方正粗宋简体} \mdseries \Large\filright}
    }{
        \titleformat{\section}[hang]{\bfseries}
    {\hspace{-80pt}\makebox[70pt][r]{\Large{\color{color1}\thesection}}}{10pt}{\Large\filright}
}
\titleformat{\subsection}[hang]{\bfseries}
{\hspace{-80pt}\makebox[70pt][r]{\large\color{color1}\thesubsection}}{10pt}{\large\filright}
\titleformat{\subsubsection}[hang]{\bfseries}
{\thesubsubsection}{7pt}{}

%----------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}
\pagestyle{fancy}          % Enables the custom headers/footers
\fancyhead[RO,LE]{\color{color1!80}\thepage}
\fancyhead[LO,RE]{}
\lfoot{}%
\cfoot{}%
\rfoot{}%
\renewcommand{\headrulewidth}{1pt}% % No header rule
\newcommand{\headrulecolor}[1]{\patchcmd{\headrule}{\hrule}{\color{#1}\hrule}{}{}}
\headrulecolor{color1!30}
\renewcommand{\footrulewidth}{0pt}% % No footer rule


\renewcommand{\@maketitle}{%
    {\raggedright\color{color1}\bfseries\fontsize{20}{25}\selectfont \@title\par}%
    \vskip10pt%
%{\raggedright\color{color1}\it\fontsize{12}{16}\selectfont  \@author\par}%
    {\raggedright\itshape\fontsize{12}{16}\selectfont  \@author\par}%
    \noindent\rule{\textwidth}{0.4mm}
}%

%---------------------------
%caption font
%---------------------------
\RequirePackage[labelfont={bf,sf,small},%
    labelsep=period,%
justification=raggedright]{caption}


%---------------------------
%useful package
%---------------------------
\RequirePackage{graphicx}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}
\RequirePackage{makecell}
\RequirePackage{siunitx}
\RequirePackage{placeins}

%---------------------------
%Elegantpar
%---------------------------
\RequirePackage{tikz}
\definecolor{tcolor}{RGB}{90, 73, 121}
\definecolor{lcolor}{RGB}{96, 113, 191}
\definecolor{pcolor}{RGB}{240, 230, 240}
 
\newif\ifstartedinmathmode
\newcommand{\elegantpar}[2]{%
 \relax\ifmmode\startedinmathmodetrue\else\startedinmathmodefalse\fi
  %{\color{tcolor}\ifstartedinmathmode \ensuremath{\bm\langle #1 \bm\rangle}\else $\bm\langle$#1$\bm\rangle$\fi}%
  {\color{tcolor}\ifstartedinmathmode \ensuremath{#1}\else #1\fi}%
  \begin{tikzpicture}[remember picture, baseline=-0.75ex]%
    \node[coordinate] (inText) {};%
  \end{tikzpicture}%
  \marginnote{%
    \renewcommand{\baselinestretch}{1.0}%
    \begin{tikzpicture}[remember picture]%
      %\draw node[fill= pcolor, rounded corners,text width=\marginparwidth] (inNote){\footnotesize #2};%
      \draw node[fill= pcolor, text width=\marginparwidth] (inNote){\footnotesize #2};%
    \end{tikzpicture}%
    }%
  \begin{tikzpicture}[remember picture, overlay]%
    \draw[draw = lcolor, thick]
      ([yshift=-0.55em] inText)
        -| ([xshift=-3.55em] inNote.west)
        -| (inNote.west);%
  \end{tikzpicture}%
}

%----------------------
\newenvironment{explanation}%
{\begin{minipage}{0.8\textwidth}\small
        \vspace{6pt}
    }%
    {\end{minipage}}
