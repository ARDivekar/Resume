% Intro Options
\ProvidesClass{deedy-resume-openfont}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[hidelinks]{hyperref}
\usepackage{titlesec}
\usepackage{setspace}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode}
\usepackage{ragged2e}

% Color definitions
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

% Set main fonts
\newcommand{\contentfontsize}{10}
\newcommand{\contentlinespacing}{1.25}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary, Path = fonts/lato/]{Lato-Lig}[
    SizeFeatures={Size=\contentfontsize},
]
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}
\newcommand{\custombold}[1]{\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Reg}\selectfont #1 \normalfont}

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm} % start everyth
\newcommand{\lastupdated}{\begin{textblock}{60}(165,0)
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont 
Updated on
\today \quad 
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
	\centering{
		\sffamily
		\fontspec[Path = fonts/lato/]{Lato-Hai}\fontsize{26pt}{10cm}\selectfont #1 
		\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2
	} \\
	\vspace{10pt}
	\centering{ \color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont #3}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	\vspace{-15pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{15pt}{22pt}\selectfont \raggedright\uppercase}{} {0em}{}

% Subeadings command
\titleformat{\subsection}{\color{subheadings}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\raggedright\bfseries\uppercase}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}

\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{naturalnames}{hyperref}

\newcommand{\runsection}[2]{
    \sectionsep
    %% Ref: https://stackoverflow.com/a/7314951
    \ifthenelse { \equal {#1} {} }  %if Icon not specified, return blank
    {\section[#2]{#2}}   % if #1 == blank
    {\section[#2]{#1 {} #2}}   % else, add the icon and space.
    \normalfont
    \subsectionsep
}

\newcommand{\runsubsection}[1]{
    \color{subheadings}
    \fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\uppercase {#1} 
    \normalfont
    \subsectionsep 
}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{14pt}\selectfont {| #1} \normalfont}

% Location command
\newcommand{\location}[1]{
    \color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} 
    \normalfont
}

\newcommand{\runsubsubsection}[2]{
    \color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{10pt}{12pt}\selectfont {#1} 
    \ifthenelse { \equal {#2} {} } {} {\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-LightItalic}\fontsize{10pt}{12pt}\selectfont {(#2)} }   % else (not blank)
    \normalfont
    \\ 
}

\newcommand{\runsingleline}[1]{
    \color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1}
    \normalfont
}

\newcommand{\runsinglelinebold}[1]{
    \color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{11pt}{13pt}\selectfont {#1}
    \normalfont
}

\newcommand{\runsinglelinelight}[1]{
    \raggedright\fontspec[Path = fonts/raleway/]{Raleway-Light}\fontsize{11pt}{13pt}\selectfont {#1}
    \normalfont
}


\newcommand{\runsinglelinelightitalic}[1]{
    \raggedright\fontspec[Path = fonts/raleway/]{Raleway-LightItalic}\fontsize{11pt}{13pt}\selectfont {#1}
    \normalfont
}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{8pt}}
\newcommand{\subsectionsep}[0]{\vspace{4pt}}
\newcommand{\subsubsectionsep}[0]{\vspace{2pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
    \justifying
    \vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt
}{
    \justifying
    \end{itemize}\vspace{-\topsep}
}

\newcommand{\publication}[5]{
    \justifying 
    \setstretch{\contentlinespacing}  %% Ref http://kb.mit.edu/confluence/pages/viewpage.action?pageId=3907092
    \fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{\contentfontsize}{\contentfontsize}\selectfont{#1. (#2).}
    \fontspec[Path = fonts/lato/]{Lato-Reg}\fontsize{\contentfontsize}{\contentfontsize}\selectfont{#3.}
    \fontspec[Path = fonts/lato/]{Lato-LigIta}\fontsize{\contentfontsize}{\contentfontsize}\selectfont{#4. }
    %% Ref: https://stackoverflow.com/a/7314951
    \ifthenelse { \equal {#5} {} }  %if URL not specified, return blank
    {}   % if #1 == blank
    {\url{#5}}   % else (not blank)
    \normalfont
}
