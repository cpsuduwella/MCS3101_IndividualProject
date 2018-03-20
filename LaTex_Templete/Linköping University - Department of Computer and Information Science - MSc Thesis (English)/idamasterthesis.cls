\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idamasterthesis}
              [2011/04/19
               LaTeX idamasterthesis class]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{idathesis}}

\ProcessOptions

\LoadClass{idathesis}

\AtEndDocument{\cleardoublepage\librarypage}

\isbn{-}

\newcommand{\issn}{-}

\renewcommand{\idathesistype}{master}
\renewcommand{\ismaster}[1]{#1}

\newcommand{\makefront}{
  \renewcommand{\plainheadrulewidth}{0pt}
  \setcounter{page}{-1}       %% Front page starts at page -1
   \enlargethispage{8mm}
   \begin{center}
   \vspace*{-0mm}
   \center
    \faculty{%
      {\Large \swedishenglish{Examensarbete}{Final thesis}}\\[15mm]}
    {%
      {\footnotesize \swedishenglish{Filosofiska fakulteten FiF-avhandling}{Faculty of Arts and Science FiF-thesis} \@thesisnumber}\\[8mm]
    }
    {\LARGE\textbf{\swedishenglish{\@titleswedish}{\@titleenglish}}}\\[8mm]
    \swedishenglish{av}{by}
    \\[10mm]
    {\Large\textbf{\@author}}\\[15mm]
    \Large LITH-IDA-EX-\@publicationyear/\@thesisnumber\\[4mm]
    \@dateofpublication
   \end{center}
}


\renewcommand{\maketitle}{
  \renewcommand{\plainheadrulewidth}{0pt}
   \enlargethispage{8mm}
   \begin{center}
   \vspace*{-0mm}
   \center
    \faculty{%
      {\Large \swedishenglish{Examensarbete}{Final thesis}}\\[15mm]}
    {%
      {\footnotesize \swedishenglish{Filosofiska fakulteten FiF-avhandling}{Faculty of Arts and Science FiF-thesis} \@thesisnumber}\\[8mm]
    }
    {\LARGE\textbf{\swedishenglish{\@titleswedish}{\@titleenglish}}}\\[8mm]
    \swedishenglish{av}{by}
    \\[10mm]
    {\Large\textbf{\@author}}\\[15mm]
    \Large LITH-IDA-EX-\@publicationyear/\@thesisnumber\\[4mm]
    \@dateofpublication
   \end{center}
   \vfill
   {\setlength{\parindent}{0mm}
   \makebox[20mm][l]{\swedishenglish{Handledare}{Supervisor}:}
    \begin{minipage}[t]{70mm}
      \@supervisor
    \end{minipage}\\[3mm]
    \makebox[20mm][l]{\swedishenglish{Examinator}{Examiner}:}
    \begin{minipage}[t]{70mm}
      \@examiner
    \end{minipage}} \\ \vspace*{4mm}

}


\newcommand{\maketitleold}{
  \pagenumbering{roman}
  \pagestyle{empty}
  \setcounter{page}{-1}       %% Front page starts at page -1

  %% Front page. Should not be edited.
  \hfil\hspace*{-4mm}
  \begin{minipage}{100mm}
    \center
    \textbf{\swedishenglish{Examensarbete}{Final thesis}} \\
    {\vbox to 28mm{\vfil\Large\textbf\makeatother\swedishenglish{\@titleswedish}{\@titleenglish}\makeatletter}}
    \vspace*{5mm}
    %Performed for \textbf{COMPANY A}\\
    %in cooperation with \textbf{COMPANY C} \\
    \vspace*{2mm}
    \swedishenglish{av}{by} \\
    \textbf{\@author} \\ \vspace*{4mm}
    LITH-IDA-EX-{}-\@publicationyear/\@thesisnumber-{}-SE \\ \vspace*{4mm}
    \@dateofpublication

  \end{minipage}
  
  \clearpage

%  \lhead[Linköpings universitet\\
%         Institutionen för datavetenskap]{}
  \renewcommand{\plainheadrulewidth}{0pt}
  \pagestyle{empty}

%% Title page. This page can be edited.
  \hfil\hspace*{-4mm}
  
  \begin{minipage}{110mm}
    \center
    \textbf{\swedishenglish{Examensarbete}{Final thesis}} \\
    {\vbox to 18mm{\vfil\Large\textbf\makeatother\swedishenglish{\@titleswedish}{\@titleenglish}\makeatletter}}
    \vspace*{3mm}
    \vspace*{2mm}
    \swedishenglish{av}{by} 
    \vspace*{2mm}
    \textbf{\@author} \\ \vspace*{4mm}
    LITH-IDA-EX-{}-\@publicationyear/\@thesisnumber-{}-SE
    \vspace*{70mm}
    \flushleft
    \swedishenglish{Handledare}{Supervisor}:
    \begin{minipage}[t]{70mm}
      \@supervisor
    \end{minipage} \\ \vspace*{4mm}
    \swedishenglish{Examinator}{Examiner}:\hspace*{5.5pt}
    \begin{minipage}[t]{70mm}
      \@examiner
    \end{minipage} \\ \vspace*{4mm}
    
  \end{minipage}\hfil
  \newpage
%  \lhead[]{}
  \pagestyle{empty}
  \phantom{Empty page}
  \newpage
  \normalsize
}


\newcommand{\makeintropages}{

%  \newcommand{\abstractparii}{\csname par\endcsname}
  %% pdfgraphics defines the standard file extension for includegraphics
  %%\pdfgraphics
  \changetext{}{}{}{5mm}{}
%  \changepage{40mm}{14mm}{-7mm}{-7mm}{0mm}{-25mm}{}{}{}
  \pagestyle{empty}
  \pagenumbering{roman}
  \makefront
  \thispagestyle{empty}
  \cleardoublepage
  \maketitle
  \thispagestyle{empty}
  \cleardoublepage
  \changetext{}{}{}{-5mm}{}
%  \thispagestyle{empty}
   \chapter*{\swedishenglish{Sammanfattning}{Abstract}}
   \@abstract
%  \abstractpage
  \cleardoublepage
%  \changepage{-40mm}{-14mm}{7mm}{7mm}{0mm}{25mm}{}{}{}
  \thispagestyle{empty}
  \cleardoublepage
%  \input{acknowledgement.tex}
%  \cleardoublepage

  \pagestyle{fancy}
  \thispagestyle{fancy}
  \tableofcontents
  \cleardoublepage
  \pagenumbering{arabic}
}

% \newcommand{\exhibitpagebeforeabstract}{%
% \changetext{}{}{}{5mm}{}
% \thispagestyle{empty}
% \setlength{\parindent}{0mm}
% \faculty{\centerline{\footnotesize Linköping Studies in Science and Technology}
% \vspace{2mm}
% \centerline{\footnotesize Thesis No. \@thesisnumber}}{
% \centerline{\footnotesize \swedishenglish{Filosofiska fakulteten FiF-avhandling}{Faculty of Arts and Science FiF-thesis} \@thesisnumber}
% }
% \vspace{3mm}
% {\centering\Large\textbf{\swedishenglish{\@titleswedish}{\@titleenglish}}\\[2mm]}
% \centerline{\swedishenglish{av}{by}}
% \vspace{2mm}
% \centerline{\large\textbf{\@author}}
% \vspace{5mm}
% \footnotesize
% \centerline{\textbf{Licentiatavhandling}}
% \vspace{3mm}
% som för avläggande av \@degreetype\ licentiatexamen vid Linköpings universitet
% kommer att offentligt presenteras i \@presentationplace, hus \@presentationhouse, 
% Linköpings universitet, \@presentationtime.\\[7mm]
% \setlength\parskip{8pt}\centerline{\textbf{\swedishenglish{Sammanfattning}{Abstract}}}
% \vspace{3mm}\\[-\baselineskip]
% }
% 
% \newcommand{\exhibitpageafterabstract}{%
% 
% \textit{\swedishenglish{Studien har finansierats av}{This work has been supported} \@supportedby.}
% \vfill
% \centerline{\swedishenglish{Institutionen för datavetenskap}{Department of Computer and Information Science}}
% \centerline{Linköpings universitet}
% \centerline{\swedishenglish{581\,83 Linköping}{SE-581\,83 Linköping, Sweden}}
% \vspace{7mm}
% \hspace*{\fill}ISBN \@isbn\hspace*{\fill}\hspace*{\fill}ISSN \issn\hspace*{\fill}
% }
% 
