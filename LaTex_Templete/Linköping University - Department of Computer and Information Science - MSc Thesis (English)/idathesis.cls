%
% Document class based on book or report

% Usage:
%
% \documentclass[cropmarks, frame, swedish]{idamasterthesis}
% \documentclass[cropmarks, frame, english]{idamasterthesis}
% \documentclass[cropmarks, frame, english]{idalichesis}
% \documentclass[cropmarks, frame, english]{idaphdthesis}
% \documentclass[cropmarks, frame, english, philosophy]{idaphdthesis}
%
% Options
%   s5paper     Format approximately for s5 paper.  Generated pdf file
%               will be in s5 format.
%   english     Language is engish
%   swedish     Language is swedish
%   philosophy  Thesis or report done in philosophy faculty
%   cropmarks   Add crop marks using crop.sty. Paper format will be a4.
%   cam         Option passed to crop
%   frame       Option passed to crop
%   cross       Option passed to crop

%   book        Use book class as base class.  report is default.
%
%   All other options are passed to the book or report class

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idathesis}
              [2005/11/10
               LaTeX idathesis class]


%
%   Create conditionals
%
%   final     - True if we are producing a final version of the document
%               False if this is a draft version
%   pgm@      - True if we are using Adobe Garamond
%               False if we are using Computer Modern
%   oldstyle@ - True if we want old-style numerals
%               False if we are using regular numerals
%   apa@      - True if we are using an APA-like bibliography style
%               False otherwise
%

\newif\if@exhibitpage
\newif\if@sfivepaper
\newif\if@philosophy
\newif\if@cropmarks
\newif\if@langswedish

%
% Setting defaultsfor conditionals
%

\@cropmarksfalse
\@philosophyfalse
\@exhibitpagefalse
\@langswedishfalse

%
% Declare options
%

\DeclareOption{exhibitpage}{\@exhibitpagetrue}
\DeclareOption{s5paper}{\@sfivepapertrue}
\DeclareOption{philosophy}{\@philosophytrue}
\DeclareOption{cropmarks}{\@cropmarkstrue}

\DeclareOption{cam}{\PassOptionsToPackage{cam}{crop}}
\DeclareOption{cross}{\PassOptionsToPackage{cross}{crop}}
\DeclareOption{frame}{\PassOptionsToPackage{frame}{crop}}

\DeclareOption{swedish}{\PassOptionsToPackage{swedish}{babel}\@langswedishtrue}
\DeclareOption{english}{\PassOptionsToPackage{english}{babel}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

%
% Default options
%

\ExecuteOptions{s5paper}
\ExecuteOptions{cross}

\ProcessOptions

\RequirePackage[utf8]{inputenc}
\RequirePackage{chngpage}
\RequirePackage{fancyhdr}
\RequirePackage{babel}
\RequirePackage{graphicx}
\RequirePackage{amsfonts}

%% Include articles
%%% \RequirePackage{pdfpages}  %%% require pdflatex
\newcounter{article}
\setcounter{article}{0}
\renewcommand{\thearticle}{\Roman{article}}

\newcommand{\includearticle}[2]{%
  \refstepcounter{article}%
  \cleardoublepage{}%
  \thispagestyle{empty}
  \mbox{}%
  \vspace*{\fill}%
  \begin{center}%
    \Huge{\bfseries{Paper \Roman{article}}}%
  \end{center}%
  \vspace*{\fill}%
  \newpage{}%
  \includepdf[pages=-]{#1}%
  \label{art:#2}%
  \addcontentsline{toc}{chapter}{Paper \thearticle}%

}

\newcommand{\abstractpar}{\csname par\endcsname}


%%\RequirePackage{nextpage}

\AtEndDocument{%%
  \if@exhibitpage
  \else
  \newwrite\@filenumb
  \openout\@filenumb=exhibitpage.tex\relax
%  \write\@filenumb{\noexpand\issn{\issn}}
  \faculty{\swedishenglish{\write\@filenumb{\noexpand\documentclass[cropmarks, frame, english, \idathesistype]{\faculty{idaexhibitpage}{\islic{idaexhibitpage}\isphd{idaphilexhibitpage}}}}}{\write\@filenumb{\noexpand\documentclass[cropmarks, frame, english, \idathesistype]{\faculty{idaexhibitpage}{\islic{idaexhibitpage}\isphd{idaphilexhibitpage}}}}}}{\swedishenglish{\write\@filenumb{\noexpand\documentclass[cropmarks, frame, english, \idathesistype]{\faculty{idaexhibitpage}{\islic{idaexhibitpage}\isphd{idaphilexhibitpage}}}}}{\write\@filenumb{\noexpand\documentclass[cropmarks, frame, philosophy, english, \idathesistype]{\faculty{idaexhibitpage}{\islic{idaexhibitpage}\isphd{idaphilexhibitpage}}}}}}
  \write\@filenumb{\noexpand\usepackage[latin1]{inputenc}}
  \write\@filenumb{\noexpand\isbn{\@isbn}}
  \write\@filenumb{\noexpand\author{\@author}}
  \write\@filenumb{\noexpand\thesisnumber{\@thesisnumber}}
  \write\@filenumb{\noexpand\titleswedish{\@titleswedish}}
  \write\@filenumb{\noexpand\titleenglish{\@titleenglish}}
  \write\@filenumb{\noexpand\degreetype{\@degreetype}}
  \write\@filenumb{\noexpand\degreesubject{\@degreesubject}}
  \write\@filenumb{\noexpand\degreesubjectswedish{\@degreesubjectswedish}}
  \write\@filenumb{\noexpand\presentationplace{\@presentationplace}}
  \write\@filenumb{\noexpand\presentationhouse{\@presentationhouse}}
  \write\@filenumb{\noexpand\presentationhus{\@presentationhus}}
  \write\@filenumb{\noexpand\presentationdate{\@presentationdate}}
  \write\@filenumb{\noexpand\presentationdatum{\@presentationdatum}}
  \write\@filenumb{\noexpand\presentationtime{\@presentationtime}}
  \write\@filenumb{\noexpand\keywords{\@keywords}}
  \write\@filenumb{\noexpand\nyckelord{\@nyckelord}}
  \write\@filenumb{\noexpand\facultyexaminername{\@facultyexaminername}}
  \write\@filenumb{\noexpand\facultyexaminertitle{\@facultyexaminertitle}}
  \write\@filenumb{\noexpand\facultyexamineraddress{\@facultyexamineraddress}}
  \write\@filenumb{\noexpand\thesisurl{\@thesisurl}}
  \write\@filenumb{\noexpand\supportedby{\@supportedby}}
  \write\@filenumb{\noexpand\newcommand{\noexpand\issn}{\issn}}
  \write\@filenumb{\noexpand\begin{document}}
\faculty{
  \write\@filenumb{\noexpand\exhibitpagebeforeabstract}
  \write\@filenumb{\@abstract}
  \write\@filenumb{\noexpand\exhibitpageafterabstract}
}{
\islic{
  \write\@filenumb{\noexpand\exhibitpagebeforeabstract}
  \write\@filenumb{\@abstract}
  \write\@filenumb{\noexpand\exhibitpageafterabstract}
}
\isphd{
  \write\@filenumb{\noexpand\exhibitpagebeforeswedishabstract}
  \write\@filenumb{\@swedishabstract}
  \write\@filenumb{\noexpand\exhibitpageafterswedishabstract}
  \write\@filenumb{\noexpand\newpage}
  \write\@filenumb{\noexpand\exhibitpagebeforeabstract}
  \write\@filenumb{\@abstract}
  \write\@filenumb{\noexpand\exhibitpageafterabstract}
}
}
  \write\@filenumb{\noexpand\end{document}}
  \closeout\@filenumb
  \fi
}

% openright option???
% 11pt option ???
\LoadClass{report}
%%\LoadClass[twoside]{report}

% Executeoptions in report

\newcommand{\idathesistype}{lic}
\newcommand{\isphd}[1]{}
\newcommand{\islic}[1]{}
\newcommand{\ismaster}[1]{}

\newcommand{\swedishenglish}[2]{%
%  \iflanguage{english}{#2}{#1}% If not english then swedish is assumed
\if@langswedish#1\else#2\fi%
}

\newcommand{\faculty}[2]{%
  \if@philosophy#2\else#1\fi%
}

\if@sfivepaper
  \if@exhibitpage
    \RequirePackage[papersize={165mm,240mm}, vscale=0.8]{geometry}
  \else 
    \RequirePackage[twoside, papersize={165mm,240mm}, vscale=0.8]{geometry}
  \fi
\fi

\if@cropmarks
    \RequirePackage[a4,center]{crop}
\fi


%% --- Defines variables
\def\thesisnumber#1{\gdef\@thesisnumber{#1}}
\def\departmentseries#1{\gdef\@departmentseries{#1}}
\def\thesisyearnumber#1{\gdef\@thesisyearnumber{#1}}
\def\publicationyear#1{\gdef\@publicationyear{#1}}
\def\publicationmonth#1{\gdef\@publicationmonth{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\examiner#1{\gdef\@examiner{#1}}
\def\titleenglish#1{\gdef\@titleenglish{#1}}
\def\titleswedish#1{\gdef\@titleswedish{#1}}
\def\titlebibpage#1{\gdef\@titlebibpage{#1}}
%\def\titleswedish#1{\gdef\@titleswedish{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\nyckelord#1{\gdef\@nyckelord{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\swedishabstract#1{\gdef\@swedishabstract{#1}}
\def\division#1{\gdef\@division{#1}}
\def\divisionshort#1{\gdef\@divisionshort{#1}}
\def\dateofpublication#1{\gdef\@dateofpublication{#1}}
\def\isbn#1{\gdef\@isbn{#1}}
\def\degreesubject#1{\gdef\@degreesubject{#1}}
\def\degreesubjectswedish#1{\gdef\@degreesubjectswedish{#1}}
\def\supportedby#1{\gdef\@supportedby{#1}}
\def\degreetype#1{\gdef\@degreetype{#1}}
\def\presentationplace#1{\gdef\@presentationplace{#1}}
\def\presentationhouse#1{\gdef\@presentationhouse{#1}}
\def\presentationhus#1{\gdef\@presentationhus{#1}}
\def\presentationdate#1{\gdef\@presentationdate{#1}}
\def\presentationdatum#1{\gdef\@presentationdatum{#1}}
\def\presentationtime#1{\gdef\@presentationtime{#1}}
\def\facultyexaminername#1{\gdef\@facultyexaminername{#1}}
\def\facultyexaminertitle#1{\gdef\@facultyexaminertitle{#1}}
\def\facultyexamineraddress#1{\gdef\@facultyexamineraddress{#1}}
\def\thesisurl#1{\gdef\@thesisurl{#1}}
\def\departmentseries#1{\gdef\@departmentseries{#1}}

\titleenglish{ENGLISHTITLE}
\titleswedish{SWEDISHTITLE}
\publicationmonth{PUBMONTH}
\publicationyear{PUBYEAR}
\isbn{ISBN}
\thesisnumber{THESISNUMBER}
\thesisyearnumber{THESISYEARNUMBER}
\abstract{ABSTRACT}
\swedishabstract{SWEDISHABSTRACT}
\dateofpublication{DATEOFPUBLICATION}
\supervisor{SUPERVISOR}
\examiner{EXAMINER}
\degreesubject{Engineering}
\supportedby{SUPPORTEDBY}

\division{DIVISION}
\divisionshort{DIVISIONSHORT}
\titlebibpage{TITLEBIBPAGE}
\keywords{KEYWORDS}
\nyckelord{NYCKELORD}

%%\if@philosophy\degreetype{teknologie}\else\degreetype{filosofie}\fi
\degreetype{teknologie}
\presentationplace{PRESENTATIONPLACE}
\presentationhouse{PRESENTATIONHOUSE}
\presentationhus{PRESENTATIONHUS}
\presentationdate{PRESENTATIONDATE}
\presentationdatum{PRESENTATIONDATUM}
\presentationtime{PRESENTATIONTIME}
\degreesubject{DEGREESUBJECT}
\degreesubjectswedish{DEGREESUBJECTSWEDISH}
\facultyexaminername{OPPONENT NAME}
\facultyexaminertitle{OPPONENT TITEL}
\facultyexamineraddress{OPPONENT ADDRESS}
\thesisurl{http://XXX}
\departmentseries{DEPARTMENTSERIES No. XXX}


\def\librarypage{
%%% Här ritas blanketten upp:
%%% -------------------------
  \enlargethispage{30mm}
  \thispagestyle{empty}
  \scriptsize
  \setlength{\unitlength}{1mm}
  \begin{picture}(126,212)(6,-5)
    \fontsize{7}{8pt}\selectfont
%% Universitetslogon:
%    \put(1,191){\includegraphics[width=20mm]{LinkUniv_staende_sv}}
    \put(1,191){\includegraphics[width=20mm]{linkuniv_en_vert_blk}}
%% Rutor:
    \put(0,190){\framebox(92,22)}  % dept, division etc
    \put(93,190){\framebox(33,22)} % date
    \put(0,157){\framebox(32,32)}  % language
    \put(33,157){\framebox(33,32)} % report category
    \put(67,143){\framebox(59,46)} % isbn etc
    \put(0,143){\framebox(66,13)}  % url
    \put(0,108){\framebox(126,34)} % title
    \put(0,12){\framebox(126,95)}   % abstract
    \put(0,0){\framebox(126,11)}    % keywords
%% Rubriker:
    \put(27,209){\bf Avdelning, Institution}
    \put(27,206){Division, Department}
    \put(94,209){\bf Datum}
    \put(94,206){Date}
    \put(1,186){\bf Språk}
    \put(1,182){Language}
    \put(1,178){$\Box$ Svenska/Swedish}
    \put(1,174){$\Box$ Engelska/English}
    \put(1,162){$\Box$}
    \put(5,162){\line(1,0){20}}

    \put(34,186){\bf Rapporttyp}
    \put(34,183){Report category}
    \put(34,178){$\Box$ Licentiatavhandling}
    \put(34,174){$\Box$ Examensarbete}
    \put(34,170){$\Box$ C-uppsats}
    \put(34,166){$\Box$ D-uppsats}
    \put(34,162){$\Box$ Övrig rapport}
    \put(34,158){$\Box$}
    \put(37,158){\line(1,0){20}}
    \put(1,153){\bf URL för elektronisk version}
    \put(68,186){\bf ISBN}
    \put(68,181){\line(1,0){57}}
    \put(68,178){\bf ISRN}
    \put(68,171){\line(1,0){57}}
    \put(68,168){\bf Serietitel och serienummer}
    \put(68,165){Title of series, numbering}
    \put(107,168){\bf ISSN}
    \put(107,163){\line(1,0){18}}
    \faculty{\put(69,155){Linköping Studies in Science and Technology}
    \put(69,150){Thesis No. \@thesisnumber}}{
    \put(69,155){\swedishenglish{Filosofiska fakulteten FiF-avhandling }{Faculty of Arts and Science Thesis No.\ }\@thesisnumber}
    }
    \put(1,138){\bf Titel}
    \put(1,135){Title}
    \put(1,122){\bf Författare}
    \put(1,119){Author}
    \put(1,104){\bf Sammanfattning}
    \put(1,101){Abstract}
    \put(1,8){\bf Nyckelord}
    \put(1,5){Keywords}
%%% Här fylls aktuella uppgifter i
%%% -------------------------------
    \fontsize{9}{10pt}\selectfont
%%% Sammanfattning:
    \put(7,96){\parbox[t]{110mm}{\setlength{\parindent}{3mm}
        \@abstract}}
    \put(27,200){\@divisionshort,}
    \put(27,197){Dept. of Computer and Information Science}
    \put(27,194){581 83 Linköping}
%%% Datum:
    \put(95,197){
      \@dateofpublication
      }
%%% ISBN:
    \put(70,183){\@isbn}
%%% ISRN:
    \faculty{\put(70,173){LiU-Tek-Lic--\@publicationyear:\@thesisyearnumber}}{}
%%% ISSN:
    \put(108,164){\issn}
%%% URL:
%    \put(1,148){\parbox{58mm}{\url{http://www-und.ida.liu.se/~fffee000/exjobb/report/report.pdf}}}
    \put(1,145){\parbox{58mm}{\@thesisurl}}
%%% Datum:
    \put(131,261){
      \@dateofpublication
      }
%%% Svensk och engelsk titel:
    \put(7,130){\parbox[t]{100mm}{\@titlebibpage}}
    %%\put(17,138){\parbox[t]{100mm}{\@titleswedish}}
%%% Författare:
    \put(7,114){\@author}
%%% Rapporttyp
    \islic{\put(33.98,178.25){\scriptsize $\times$}}
    \ismaster{\put(33.98,174.25){\scriptsize $\times$}}
%%% Språk
    \swedishenglish{\put(0.98,178.25){\scriptsize $\times$}}{\put(0.98,174.25){\scriptsize $\times$}}
%%% Nyckelord:
    \put(17,5){\parbox{100mm}{\@keywords}}
  \end{picture}
  \pagestyle{plain}
}

