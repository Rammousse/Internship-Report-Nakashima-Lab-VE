\LoadClass[a4paper,11pt]{article}

%--------------------- Packages ------------------------
\RequirePackage[english]{babel} % <--- CHANGÉ EN ANGLAIS
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathtools}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage[justification=centering]{caption}
\RequirePackage{subcaption}
\RequirePackage{wallpaper}
\RequirePackage{nomencl}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[left=2cm,right=2cm,top=2cm,bottom=3cm]{geometry}
\RequirePackage[most]{tcolorbox}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{amssymb}
\RequirePackage{setspace}
\RequirePackage{empheq}
\RequirePackage{lipsum}
\RequirePackage{multirow}

\usepackage[T1]{fontenc}
\usepackage{lmodern}

% CORRECTION DU CONFLIT PHYSICS / SIUNITX
\RequirePackage{siunitx}
\DeclareSIUnit{\rpm}{rpm}
\AtBeginDocument{\RenewCommandCopy\qty\SI} 

% ==========================================
%        TEXT FORMATTING (STANDARDS)
% ==========================================
% Multiple line spacing of 1.15
\setstretch{1.15}

% 6 pts space after each paragraph
\setlength{\parskip}{6pt}

%-------------------- Internal Variables ----------------------
\newcommand{\@mention}{}
\newcommand{\@trigrammemention}{}
\newcommand{\@master}{}
\newcommand{\@filiere}{}
\newcommand{\@typestage}{} 
\newcommand{\@titre}{}
\newcommand{\@eleve}{}
\newcommand{\@annee}{}
\newcommand{\@tuteurentreprise}{}
\newcommand{\@logoentreprise}{} 
\newcommand{\@dates}{}
\newcommand{\@institut}{}    % NEW: For the institute
\newcommand{\@laboratoire}{} 

% User commands
\newcommand{\mention}[1]{\renewcommand{\@mention}{#1}}
\newcommand{\trigrammemention}[1]{\renewcommand{\@trigrammemention}{#1}}
\newcommand{\master}[1]{\renewcommand{\@master}{#1}}
\newcommand{\filiere}[1]{\renewcommand{\@filiere}{#1}}
\newcommand{\typestage}[1]{\renewcommand{\@typestage}{#1}}
\newcommand{\titre}[1]{\renewcommand{\@titre}{#1}}
\newcommand{\eleve}[1]{\renewcommand{\@eleve}{#1}}
\newcommand{\annee}[1]{\renewcommand{\@annee}{#1}}
\newcommand{\tuteurentreprise}[1]{\renewcommand{\@tuteurentreprise}{#1}}
\newcommand{\logoentreprise}[1]{\renewcommand{\@logoentreprise}{#1}}
\newcommand{\dates}[1]{\renewcommand{\@dates}{#1}}
\newcommand{\institut}[1]{\renewcommand{\@institut}{#1}}       % NEW
\newcommand{\laboratoire}[1]{\renewcommand{\@laboratoire}{#1}}

\newcommand{\fairemarges}{
    \makenomenclature
    \pagestyle{fancy}
    \fancyheadoffset{0.5cm}
    \lhead{\includegraphics[height=1cm]{logos/logo su fsi.png}}
    \rhead{\nouppercase{\leftmark}}
    \lfoot{\trigrammemention}
}

\newcommand{\fairepagedegarde}{
\begin{titlepage}
% --- Disabling spacing for the cover page ---
\setlength{\parskip}{0pt}
\setstretch{1.0}
\centering 

% --- HEADER LOGOS ---
\noindent
\begin{minipage}{\textwidth}
    \ifdefempty{\@logoentreprise}{%
        \hfill 
    }{%
        \includegraphics[height=2cm]{\@logoentreprise}
        \hfill 
    }%
    \includegraphics[height=2cm]{logos/logo su fsi.png}
\end{minipage}

\vspace{1.5cm}

% --- INTERNSHIP TYPE & LOCATION ---
{\LARGE \textsc{\@typestage} \par}
\vspace{0.4cm}
{\Large \textbf{\@institut} \par}
\vspace{0.1cm}
{\Large \@laboratoire \par}

\vspace{1cm}

% --- INTERNSHIP TITLE (Inside the bars) ---
\rule{\linewidth}{0.4 mm}
\vspace{0.2cm}

{\huge\bfseries \@titre \par}
\vspace{0.5cm}

\rule{\linewidth}{0.4 mm}
\vspace{1.0cm}

% --- STUDENT INFORMATION ---
{\scshape\LARGE \@eleve \par} 
\vspace{0.8cm}

% Program, Track, and Master
{\large \textbf{\@mention} \par}
\vspace{0.2cm}
\ifdefempty{\@filiere}{}{{\large \@filiere \par}\vspace{0.2cm}}
{\normalsize \@master \par}

\vspace{1.5cm}

% --- DATES ---
{\large Internship Period: \@dates \par} 

% --- MAGIC: vfill pushes the rest to the bottom ---
\vfill 

% --- REPRESENTATIVES ---
\noindent
\begin{minipage}[t]{0.45\textwidth}
    \begin{flushleft} 
    \emph{\textbf{Academic Year:}}\\ 
    \@annee 
    \end{flushleft}
\end{minipage}
\hfill
\begin{minipage}[t]{0.45\textwidth}
   \begin{flushright} 
   \emph{\textbf{Supervisors:}}\\ 
   \@tuteurentreprise
   \end{flushright}
\end{minipage}

\end{titlepage}
\newpage
}

\newcommand{\tabledematieres}{
\tableofcontents
\newpage
}

\newcommand{\insererfigure}[4]{
\begin{figure}[ht]
\centering
\includegraphics[height=#2]{#1}
\caption{#3}
\label{fig: #4}
\end{figure}
}