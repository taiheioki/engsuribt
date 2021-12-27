\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{engsuribt}[2021/12/27 Taihei OKI]

\RequirePackage{CJKutf8}
\newcommand*{\@ja}[1]{\begin{CJK}{UTF8}{ipxm}#1\end{CJK}}

\RequirePackage[en-US]{datetime2}
\DTMlangsetup[en-US]{showdayofmonth=false,monthdaysep={,~}}

\RequirePackage{emptypage,etoolbox,fancyhdr}

\newcommand*{\jtitle}[1]{\gdef\@jtitle{#1}}
\newcommand*{\jauthor}[1]{\gdef\@jauthor{#1}}
\newcommand*{\studentid}[1]{\gdef\@studentid{#1}}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\handin}[2]{\gdef\@date{\DTMdisplaydate{#1}{#2}{1}{0}}}

% Options
\newif\if@belongstosuri
\newif\if@undergraduate
\DeclareOption{mi}{\@belongstosuritrue\@undergraduatetrue}
\DeclareOption{suri}{\@belongstosuritrue\@undergraduatefalse}
\DeclareOption{ipc}{\@belongstosurifalse\@undergraduatetrue}
\DeclareOption{system}{\@belongstosurifalse\@undergraduatefalse}
\ExecuteOptions{suri}

\newif\if@hyperref
\@hyperreffalse
\DeclareOption{hyperref}{\@hyperreftrue}

\ProcessOptions

% Load the parent document class
\LoadClass[11pt,a4paper]{book}

% Margin
\setlength{\textheight}{210mm}
\setlength{\textwidth}{150mm}
\setlength{\topmargin}{10.6mm}
\setlength{\headsep}{10mm}
\setlength{\headheight}{5mm}
\setlength{\topskip}{0mm}

\setlength{\oddsidemargin}{\paperwidth}
\addtolength{\oddsidemargin}{-\textwidth}
\setlength{\oddsidemargin}{.5\oddsidemargin}
\addtolength{\oddsidemargin}{-1truein}
\setlength{\evensidemargin}{\oddsidemargin}

% Line spacing
\RequirePackage{setspace}
\setstretch{1.1}

% Matters
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
}

\renewcommand{\mainmatter}{%
  \cleardoublepage
  \@openrightfalse
  \@mainmattertrue
  \pagenumbering{arabic}
}

\renewcommand\backmatter{
  \clearpage
  \@openrightfalse
  \@mainmatterfalse
}

\renewcommand{\appendix}{\par
  \@mainmattertrue
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \gdef\@chapapp{\appendixname}
  \gdef\@chappos{}
  \gdef\thechapter{\@Alph\c@chapter}
}

% Header
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\chaptermark}[1]{\markboth{%
  \if@mainmatter%
    \@chapapp~\thechapter.~%
  \fi%
  #1%
}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.~#1}}
\fancyhead[RE,LO]{}
\fancyhead[LE]{\textbf{\thepage}\qquad\nouppercase{\leftmark}}
\fancyhead[RO]{\nouppercase{\rightmark}\qquad\textbf{\thepage}}
\renewcommand{\headrulewidth}{0pt}

\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

% Title page
\if@undergraduate
  \newcommand{\@subtitle}{Bachelor's~Thesis}
  \if@belongstosuri
    \newcommand{\@belongsto}{%
      Mathematical Information Engineering Course\\%
      Department of Mathematical Engineering and Information Physics\\%
      Faculty of Engineering, The University of Tokyo%
    }
  \else
    \newcommand{\@belongsto}{%
      Information Physics Course\\%
      Department of Mathematical Engineering and Information Physics\\%
      Faculty of Engineering, The University of Tokyo%
    }
  \fi
\else
  \newcommand{\@subtitle}{Master's~Thesis}
  \if@belongstosuri
    \newcommand{\@belongsto}{%
      Department of Mathematical Informatics\\%
      Graduate School of Information Science and Technology\\%
      The University of Tokyo%
    }
  \else
    \newcommand{\@belongsto}{%
      Department of Information Physics and Computing\\%
      Graduate School of Information Science and Technology\\%
      The University of Tokyo%
    }
  \fi
\fi

\renewcommand{\maketitle}{%
  \if@hyperref
    \pdfbookmark{Cover Page}{cover-page}
  \fi
  \begin{titlepage}%
    \null\vskip60\p@
    \begin{center}
      \Large\@subtitle\par
    \end{center}%
    \begin{center}
      \Huge\@title
    \end{center}%
    \begin{center}
      \LARGE\@ja{（\@jtitle）}
    \end{center}%
    \vfill
    \begin{center}
      \Large
      {\begin{tabular}[t]{rl}%
        \@studentid & {\LARGE\@author\@ja{（\@jauthor）}} \\[16\p@]
        Supervisor & \@supervisor
      \end{tabular}\par}%
      \vskip 2cm
      \@date\par%
      \vskip 2cm
      \@belongsto\par%
    \end{center}\par
    \vskip30\p@\null
    \newpage\clearpage
    \thispagestyle{empty}
    \setcounter{page}{0}
    \null\vfill
    \begin{flushleft}
      Copyright {\copyright} {\number\year},~\@author.
    \end{flushleft}\par
    \vskip60\p@\null
  \end{titlepage}
}

\newenvironment{abstract}{%
  \if@hyperref
    \pdfbookmark{Abstract}{abstract}
  \fi
  \titlepage
  \null\vfill
  \@beginparpenalty\@lowpenalty
  \begin{center}%
    \textbf{Abstract}
    \@endparpenalty\@M
  \end{center}\par%
}{%
  \par%
  \vfill\vfill\vfill\null
  \endtitlepage%
}

% Insert PDF bookmarks
\if@hyperref
  \pretocmd{\tableofcontents}{%
    \cleardoublepage
    \pdfbookmark{\contentsname}{toc}
  }{}{}%
\fi
