% resume.cls  (Trey Hunner, Medium Length Professional CV, LaTeXTemplates.com)
\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]
\LoadClass[10pt,a4paper]{article}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\pagestyle{empty}

\def \name#1{\def\@name{#1}}
\def \@name {}
\def \addressSep {$\diamond$}
\newcount\@addrcount \@addrcount=0
\def \address #1{%
  \global\advance\@addrcount by 1
  \expandafter\gdef\csname @addr\the\@addrcount\endcsname{#1}%
}
\def \printaddress #1{%
  \begingroup
    \def \\ {\addressSep\ }%
    \centerline{#1}%
  \endgroup
  \par
  \addressskip
}
\def \printname {%
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@addr1}{}{\printaddress{\csname @addr1\endcsname}}
  \@ifundefined{@addr2}{}{\printaddress{\csname @addr2\endcsname}}
  \@ifundefined{@addr3}{}{\printaddress{\csname @addr3\endcsname}}
}
\newenvironment{rSection}[1]{
  \sectionskip
  \MakeUppercase{\bf #1}
  \sectionlineskip
  \hrule
  \begin{list}{}{
    \setlength{\leftmargin}{1.5em}
  }
  \item[]
}{
  \end{list}
}
\newenvironment{rSubsection}[4]{
 {\bf #1} \hfill {#2}
 \ifthenelse{\equal{#3}{}}{}{
  \\
  {\em #3} \hfill {\em #4}
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em}
   \itemsep -0.5em \vspace{-0.5em}
  }{
  \end{list}
  \vspace{0.5em}
}
\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\bigskip}
\def\sectionskip{\medskip}
