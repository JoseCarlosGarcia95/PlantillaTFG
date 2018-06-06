% Información sobre la versión.
\ProvidesClass{PlantillaTFG}[05/06/2015 v1 PlantillaTFG]

% Modo book
\ifx\pdfoutput\undefined
	\LoadClass[dvips, a4paper]{book}
\else
	\LoadClass[pdftex, a4paper]{book}
\fi

% Normativa
\usepackage{ifpdf} 
\ifpdf
\pdfpageheight=297mm
\pdfpagewidth=210mm
\else
\setlength{\paperheight}{297mm}
\setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\oddsidemargin}{1.5cm}
\setlength{\evensidemargin}{0.5cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{13.9cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}
\setlength{\parindent}{0cm}

% Pruebas
\usepackage{lipsum}

% Idioma
\usepackage[utf8]{inputenc}
\usepackage[british,spanish]{babel}

% Para editar los margenes
\usepackage{fancyhdr}
\usepackage{emptypage}

% Gráficos
\usepackage{graphicx}
\graphicspath{{graphics/}}

% Título
\newenvironment{alwayssingle}{%
	\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
	\else\newpage\fi}
{\if@restonecol\twocolumn\else\newpage\fi}

\renewenvironment{maketitle}{
	\pagestyle{empty}
	
	\begin{alwayssingle}
		\begin{center}
			{\includegraphics[width=3.5cm]{university_logo}}
			{\vspace*{0.5ex}}
			{\huge \vspace*{15mm}{\par} \@title\vspace*{15mm}\par} 
		\end{center}
	\end{alwayssingle}
	% Incluimos el logo
	%
	
}{
	\newpage
}
% Resumen
\newenvironment{abstract}%
{
	\cleardoublepage\null\vfill\begin{center}%
\bfseries \abstractname \end{center}}%
{\vfill\null\newpage}

% Dedicatoria
\newenvironment{dedicatoria}
{
	\begin{flushright}\null\vspace{\stretch{1}}
	\itshape
}
{
	\vspace{\stretch{2}}\null\end{flushright}
}

% Fuentes
\usepackage[math]{kurier}
\usepackage[sfdefault]{roboto}
\usepackage[T1]{fontenc}

% Capitulos
\usepackage[Glenn]{fncychap}
\ChTitleVar{\bfseries\Large\sf}

% Teoremas, Definiciones, Lemas, Corolarios...
\usepackage[framemethod=TikZ]{mdframed}

\newenvironment{cajabonita}[5]{
	\refstepcounter{#1}
	
	\ifstrempty{#5}%
	% if condition (without title)
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=#3]
				{\strut \textcolor{#4}{#2~\arabic{#1}}};}
		}%
		% else condition (with title)
	}{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=#3]
				{\strut\textcolor{#4}{#2~\arabic{#1}:~#5}};}%
		}%
	}%
	% Both conditions
	\mdfsetup{%
		innertopmargin=10pt,linecolor=#3,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
	}
	\begin{mdframed}[]\relax
}{
	\end{mdframed}
}