%Copyright 2015 Jan Hauke Maase

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{naklatex}[3/5/2015 custom nak class]
\LoadClass[12pt,a4paper,titlepage]{article}

% Pakete
\RequirePackage[ngerman]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % Gerenderte Schrift
\RequirePackage{fancyhdr} % Kopfzeilen
\RequirePackage{graphicx}
%\RequirePackage[round, authoryear, comma]{natbib}
\RequirePackage[]{natbib}
\bibpunct{}{}{;}{a}{,}{,}
\providecommand{\BIBand}{und}

%Hyperlink und URL Umbrueche
\RequirePackage[hyphens]{url}
\RequirePackage[hidelinks]{hyperref}

%Microtype
\RequirePackage{microtype}

%Keine Einrückung bei neuen Absaetzen
\usepackage[parfill]{parskip}

%Fussnoten alle auf einer hoehe
\RequirePackage[bottom]{footmisc}


% Seitenränder
\RequirePackage[left=4cm,right=4cm,top=2cm,bottom=2cm,includeheadfoot,headheight=50pt]{geometry}

% Seitenumbrüche per Section
\RequirePackage{titlesec}
\newcommand{\sectionbreak}{\clearpage}

% Zielenabstand 1,5
\RequirePackage{setspace}
\onehalfspacing

% Kopf- und Fußzeile
\pagestyle{fancy} %eigener Seitenstil
\fancyhf{} %alle Kopf- und Fußzeilenfelder bereinigen
\fancyhead[L]{\@author} %Kopfzeile links
\fancyhead[R]{\includegraphics[height=40pt]{image/nak_logo}}
\renewcommand{\headrulewidth}{0.4pt} %obere Trennlinie
\fancyfoot[C]{\thepage} %Seitennummer

%Interimslösung: Firma einfügen
\newcommand{\Firma}{GLC Gl\"ucksburg Consulting AG }
% Wortumbrüche
%\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}
%\sloppy

% Kapitel 4. Ebene
\newcommand{\subsubsubsection}[1]{\paragraph{#1}\mbox{}\\}

% Titel Seite
\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{titlepage}
		
		\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Defines a new command for the horizontal lines, change thickness here
		
		\center 
		
		\includegraphics[width=\textwidth]{image/nak_logo}\\[2cm]
		% \textsc{\LARGE University Name}\\[1.5cm] % Name of your university/college
		%\HRule 
		%\\[0.4cm]
		{ \huge \bfseries \@title}\\[1.4cm] % Title of your document
		%\HRule 
		%\\[1.5cm]
				
		\textsc{\Large \@untertitel}\\[0.5cm] % Major heading such as course name
		\textsc{\Large \@unteruntertitel}\\[0.9cm] % Minor heading such as course title
		

		
		
		\begin{minipage}{0.4\textwidth}
			\begin{flushleft} \large
				\emph{Autor}\\
				\@author\\\@authoraddress % Your name
			\end{flushleft}
		\end{minipage}
		~
		\begin{minipage}{0.4\textwidth}
			\begin{flushright} \large
				\emph{Gutachter} \\
				\@gutachter\\\@gutachteraddress % Supervisor's Name
			\end{flushright}
		\end{minipage}\\[4cm]
		
		
		{\large \today}\\[3cm] % Date, change the \today to a set date if you want to be precise
		
		\vfill % Fill the rest of the page with whitespace
		
	\end{titlepage}}
	
% Ueberschriften ohne Zahl, aber in der TOC
\newcommand{\ueberschrift}[1]{
	\newpage
	\addcontentsline{toc}{section}{#1}
	\section*{#1}}

\newcommand{\romannumbering}{
	\pagenumbering{Roman}
	\setcounter{page}{1}}

\newcommand{\arabicnumbering}{
	\newcounter{frontmatter}
	\setcounter{frontmatter}{\value{page}}
	\pagenumbering{arabic}
	\setcounter{page}{1}}

\newcommand{\romannumberingtwo}{
	\pagenumbering{Roman}
	\setcounter{page}{\value{frontmatter}}}

\newcommand{\inhaltsverzeichnis}{
	\newpage
	\addcontentsline{toc}{section}{Inhaltsverzeichnis}
	\tableofcontents}
	
\newcommand{\literaturverzeichnis}{
	\newpage
	\addcontentsline{toc}{section}{Literaturverzeichnis}
	\bibliography{BT_ssch_2016}}

\newcommand{\abbildungsverzeichnis}{
	\newpage
	\addcontentsline{toc}{section}{Abbildungsverzeichnis}
	\listoffigures}	

\newcommand{\tabellenverzeichnis}{
	\newpage
	\addcontentsline{toc}{section}{Tabellenverzeichnis}
	\listoftables}

\newcommand{\eigenleistung}[1]{% Versicherung über Eigenleistung
	\newpage
	\addcontentsline{toc}{section}{Versicherung über Eigenleistung}
	\section*{Versicherung über Eigenleistung}
	Hiermit erkläre ich, dass ich die vorliegende Hausarbeit selbständig verfasst und keine anderen als die angegebenen Hilfsmittel benutzt habe.
	\\[2em]
	Die Stellen der Hausarbeit, die anderen Quellen im Wortlaut oder dem Sinn nach entnommen wurden, sind durch Angaben der Herkunft kenntlich gemacht. Dies gilt auch für Zeichnungen, Skizzen, bildliche Darstellungen sowie für Quellen aus dem Internet.
	\\[2em]
	#1, den \today
	\\[8em]
	\@author}

\newcommand{\quellenverzeichnis}{
	% Quellenverzeichnis
	\newpage
	\addcontentsline{toc}{section}{Literatur}
	%\section*{Quellenverzeichnis}
	% Literatur
	%\bibliographystyle{achemso}
	\bibliographystyle{nakcitstyle}
	}

\newenvironment{mainmatter}{\arabicnumbering}{\newpage}
\newenvironment{frontmatter}{\romannumbering}{\newpage}
\newenvironment{backmatter}{\romannumberingtwo}{}
\newenvironment{anhang}{\begin{appendix}
		\renewcommand{\thesection}{\Roman{section}}
	}{\end{appendix}}

\newcommand*{\gutachter}[1]{\gdef\@gutachter{#1}}
\newcommand*{\untertitel}[1]{\gdef\@untertitel{#1}}
\newcommand*{\unteruntertitel}[1]{\gdef\@unteruntertitel{#1}}
\newcommand*{\authoraddress}[1]{\gdef\@authoraddress{#1}}
\newcommand*{\gutachteraddress}[1]{\gdef\@gutachteraddress{#1}}