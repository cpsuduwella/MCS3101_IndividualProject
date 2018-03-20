\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idaexhibitpage}
              [2006/01/19
               LaTeX idaexhibitpage class]


\RequirePackage[utf8]{inputenc}

\DeclareOption{lic}{%
\newcommand{\exhibitpagebeforeabstract}{%
%\changetext{}{}{}{5mm}{}
\thispagestyle{empty}
\setlength{\parindent}{0mm}
\faculty{\centerline{\footnotesize Linköping Studies in Science and Technology}
\vspace{2mm}
\centerline{\footnotesize Licentiate Thesis No.\ \@thesisnumber}}{
\centerline{\footnotesize Faculty of Arts and Science Thesis No.\ \@thesisnumber}
}
\vspace{3mm}
{\centering\Large\textbf{\swedishenglish{\@titleswedish}{\@titleenglish}}\\[2mm]}
\centerline{\swedishenglish{av}{by}}
\vspace{2mm}
\centerline{\large\textbf{\@author}}
\vspace{5mm}
\footnotesize
\centerline{\textbf{Licentiatavhandling}}
\vspace{3mm}
\begin{center}%
som för avläggande av \@degreetype\ licentiatexamen  i \@degreesubject\ vid Linköpings universitet
kommer att offentligt presenteras i \@presentationplace, hus \@presentationhouse, 
Linköpings universitet, \@presentationtime.\end{center}
\setlength\parskip{8pt}%
\begin{center}
\textbf{Fakultetsopponent}\\%
\@facultyexaminername\\
\@facultyexaminertitle\\
\@facultyexamineraddress
\end{center}
\mbox{}\\[3cm]
\begin{center}
%\includegraphics[width=40mm]{LinkUniv_staende_sv}
\includegraphics[width=40mm]{linkuniv_en_vert_blk}
\end{center}
\vfill
\vspace{3mm}
\centerline{\swedishenglish{Institutionen för datavetenskap}{Department of Computer and Information Science}}
\centerline{Linköping University}
\centerline{\swedishenglish{581\,83 Linköping}{SE-581\,83 Linköping, Sweden}}
\vspace{7mm}
\hspace*{\fill}ISBN \@isbn\hspace*{\fill}\hspace*{\fill}ISSN \issn\hspace*{\fill}
\newpage
\thispagestyle{empty}
%\centerline{\textbf{\swedishenglish{Sammanfattning}{Abstract}}}
\centerline{\textbf{Abstract}}
%\vspace{3mm}\\[-\baselineskip]
}

\newcommand{\exhibitpageafterabstract}{%

\textit{\swedishenglish{Studien har finansierats av}{This work has been supported} \@supportedby.}\\
URL: \@thesisurl
}
}

\DeclareOption{master}{% !!!!NOTUSED but needed for other reasons (make)
\newcommand{\exhibitpagebeforeabstract}{%
%\changetext{}{}{}{5mm}{}
\thispagestyle{empty}
\setlength{\parindent}{0mm}
\faculty{\centerline{\footnotesize Linköping Studies in Science and Technology}
\vspace{2mm}
\centerline{\footnotesize Thesis No. \@thesisnumber}}{
\centerline{\footnotesize \swedishenglish{Filosofiska fakulteten FiF-avhandling}{Faculty of Arts and Science FiF-thesis} \@thesisnumber}
}
\vspace{3mm}
{\centering\Large\textbf{\swedishenglish{\@titleswedish}{\@titleenglish}}\\[2mm]}
\centerline{\swedishenglish{av}{by}}
\vspace{2mm}
\centerline{\large\textbf{\@author}}
\vspace{5mm}
\footnotesize
\centerline{\textbf{Licentiatavhandling}}
\vspace{3mm}
som för avläggande av \@degreetype\ licentiatexamen vid Linköpings universitet
kommer att offentligt presenteras i \@presentationplace, hus \@presentationhouse, 
Linköpings universitet, \@presentationtime.\\[7mm]
\setlength\parskip{8pt}\centerline{\textbf{\swedishenglish{Sammanfattning}{Abstract}}}
\vspace{3mm}\\[-\baselineskip]
}

\newcommand{\exhibitpageafterabstract}{% !!!!NOTUSED but needed for other reasons (make)

\textit{\swedishenglish{Studien har finansierats av}{This work has been supported} \@supportedby.}
\vfill
\centerline{URL: \@thesisurl}
\vspace{3mm}
\centerline{\swedishenglish{Institutionen för datavetenskap}{Department of Computer and Information Science}}
\centerline{Linköpings universitet}
\centerline{\swedishenglish{581\,83 Linköping}{SE-581\,83 Linköping, Sweden}}
\vspace{7mm}
\hspace*{\fill}ISBN \@isbn\hspace*{\fill}\hspace*{\fill}ISSN \issn\hspace*{\fill}
}
}

\DeclareOption{phd}{%
\newcommand{\exhibitpagebeforeabstract}{%
\thispagestyle{empty}
\setlength{\parindent}{0mm}
\centerline{\footnotesize Linköping Studies in \faculty{Science and Technology}{Arts and Science No. \@thesisnumber}}
\vspace{2mm}
\centerline{\footnotesize\faculty{Dissertations. No. \@thesisnumber}{\@institutionseries}}
\vspace{3mm}
%{\centering\Large\textbf{\swedishenglish{\@titleswedish}{\@titleenglish}}\\[2mm]}
{\centering\Large\textbf{\@titleenglish}\\[2mm]}
\centerline{\swedishenglish{av}{by}}
\vspace{2mm}
\centerline{\large\textbf{\@author}}
\vspace{5mm}
\footnotesize
\centerline{\textbf{Akademisk avhandling}}
\vspace{3mm}
\begin{center}%
som för avläggande av \@degreetype\ doktorsexamen i \@degreesubject\ vid Linköpings 
universitet
kommer att offentligt försvaras i \@presentationplace, hus \@presentationhouse, 
Linköpings universitet, \@presentationtime.\end{center}
\setlength\parskip{8pt}%
\begin{center}
\textbf{Fakultetsopponent}\\%
\@facultyexaminername\\
\@facultyexaminertitle\\
\@facultyexamineraddress
\end{center}
\mbox{}\\[3cm]
\begin{center}
%\includegraphics[width=40mm]{LinkUniv_staende_sv}
\includegraphics[width=40mm]{linkuniv_en_vert_blk}
\end{center}
\vfill
\vspace{3mm}
\centerline{\swedishenglish{Institutionen för datavetenskap}{Department of Computer and Information Science}}
\centerline{Linköping University}
\centerline{\swedishenglish{581\,83 Linköping}{SE-581\,83 Linköping, Sweden}}
\vspace{7mm}
\hspace*{\fill}ISBN \@isbn\hspace*{\fill}\hspace*{\fill}ISSN \issn\hspace*{\fill}
\newpage
\thispagestyle{empty}
%\centerline{\textbf{\swedishenglish{Sammanfattning}{Abstract}}}
\centerline{\textbf{Abstract}}
%\vspace{3mm}\\[-\baselineskip]
}

\newcommand{\exhibitpageafterabstract}{%

%\textit{\swedishenglish{Studien har finansierats av}{This work has been supported} \@supportedby.}\\
\textit{This work has been supported by \@supportedby.}\\
URL: \@thesisurl


}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{idathesis}}

\ProcessOptions

\LoadClass[exhibitpage]{idathesis}
%\LoadClass{idathesis}

\AtEndDocument{}
