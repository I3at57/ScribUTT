\ProvidesClass{rUTT}

\LoadClass[a4paper,12pt]{article}

\usepackage[french]{babel} % Package babel pour le français
\frenchbsetup{StandardLists=true} %Pour redéfinir les itemize malgré babel
\usepackage[T1]{fontenc}    % Package pour les accentuations
\usepackage[utf8]{inputenc}  % Français
\usepackage{subfiles}
\usepackage{titling}
\usepackage{textcomp}
\usepackage{lmodern}        % Pour avoir de bonnes polices en pdf
\usepackage{graphicx}       % Indispensable pour les figures
\usepackage{amsmath}        % Environnement pour les maths, permet du mettre du texte dans les équations
\usepackage[headheight=61pt]{geometry}       % Utilisé pour les marges
\usepackage{multicol}		% Pour les colonnes
\usepackage{multirow}       % Pour des tableaux fun
\usepackage{mathtools}  % Typographie pour les ensembles communs
\usepackage{amssymb}    % Typographie pour les ensembles communs
\usepackage{float}          % Pour bien placer les figures, scripts et tableaux
\usepackage{xspace}         % for including spaces at the end of latex macros
\usepackage{todonotes}
\usepackage{xcolor}
\usepackage{enumitem} %For custom itemize
\usepackage{tikz}			%Pour les figures et graphes
\usetikzlibrary{calc}		%Pour les figures et graphes
\usepackage[cache=false]{minted}        % Utilisé pour les scripts
\geometry{vmargin=3cm, textwidth=16cm} % Réglages des marges
\usepackage{fancyhdr}		% Pour l'entête et les pieds de page
\pagestyle{fancy}			% Pour l'entête et les pieds de page
\PassOptionsToPackage{hyphens}{url}\usepackage[pagebackref]{hyperref}		% Pour les liens hypertext, sommaire et références
\usepackage[final]{pdfpages} % Pour inclure des .pdf
\usepackage[linesnumbered,ruled,vlined]{algorithm2e} % for cool loonking algorithm
\usepackage{ulem} % Pour souligner en couleur
\usepackage{Ressources-graphiques/couleurs_UTT} %Couleurs définies dans la charte graphique de l'UTT
\usepackage{minted} % Pour le code

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO EXPLICATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@noUTTcolors\@noUTTcolorsfalse
\DeclareOption{noUTTcolors}{
  \@noUTTcolorstrue
}
\ProcessOptions\relax

\renewcommand{\listoflistingscaption}{Liste des programmes} %Pour changer le titre de la liste des codes
\renewcommand{\listingscaption}{Programme} %Pour changer la légende des codes


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Nouvelles variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\UE}[1]{\def\theUE{#1}} %Passage de l'UE en variable


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Redéfinition des niveaux de titre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@noUTTcolors
  \definecolor{bleuRoiUTT}{RGB}{0,0,0} % On enlève toute trace d'une autre couleur
\else
  \renewcommand{\labelitemi}{\color{bleuRoiUTT}$\bullet$} %Changement des puces itemize de niveau 1
  \renewcommand{\labelitemii}{\color{bleuRoiUTT}$\bullet$} %Changement des puces itemize de niveau 2

  \makeatletter

  \newcommand\sectionuline{% Commande pour souligner les sections en bleuRoiUTT
    \bgroup\markoverwith{\textcolor{bleuRoiUTT}{\rule[-0.5ex]{0.1mm}{0.5mm}}}%
    \ULon%
  }
  \renewcommand\section{\@startsection {section}{1}{\z@}% Redéfinition de la commande section (plus gros, souligné)
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus .2ex}%
    {\normalfont\LARGE\bfseries\sectionuline}%
  }
  \renewcommand\subsection{\@startsection {subsection}{2}{1em}% Redéfinition de la commande subsection (plus gros, en gris UTT)
    {-3ex \@plus -0.8ex \@minus -.2ex}%
    {1.8ex \@plus .2ex}%
    {\normalfont\Large\bfseries\color{bleuRoiUTT}}%
  }

  \renewcommand\subsubsection{\@startsection {subsubsection}{3}{2em}% Redéfinition de la commande subsubsection (plus gros, en gris UTT)
    {-2.5ex \@plus -0.6ex \@minus -.2ex}%
    {1.8ex \@plus .2ex}%
    {\normalfont\large\bfseries\color{bleuRoiUTT}}%
  }

  \renewcommand\paragraph{\@startsection {paragraph}{4}{3em}% Redéfinition de la commande paragraph (plus gros en gris clair UTT)
    {-2ex \@plus -0.4ex \@minus -.2ex}%
    {1.3ex \@plus .2ex}%
    {\normalfont\large\bfseries\color{bleuRoiUTT}}%
  }

  \renewcommand\subparagraph{\@startsection {subparagraph}{5}{4em}% Redéfinition de la commande subparagraph (en gris clair UTT)
    {-1.5ex \@plus -0.2ex \@minus -.2ex}%
    {.8ex \@plus .2ex}%
    {\normalfont\bfseries\color{bleuRoiUTT}}%
  }

  \makeatother
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%En-tête et pied de page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\headrulewidth}{0.5pt} %Épaisseur de la ligne d'en-tête
\renewcommand{\footrulewidth}{1.5pt} %Épaisseur de la ligne de pied de page
\renewcommand{\footrule}{%
  {\color{bleuRoiUTT} \hrule width\headwidth height\footrulewidth \vskip+2mm}
} %Changement de la couleur de la ligne de pied de page
%Contenu de l'en-tête :
\lhead{\textsc{\leftmark }} %Section actuelle à gauche de l'en-tête
\chead{\includegraphics[height=1.5cm]{Ressources-graphiques/logos/sigle_UTT.pdf}} %Sigle de l'UTT au centre de l'en-tête
\rhead{\theUE} %Code de l'UE à droite de l'en-tête
%Contenu du pied de page :
\cfoot{\thepage} %Numéro de page au centre
\lfoot{\theauthor} %auteur(s) à gauche

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Environements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{myabstract}{%
  \begin{quote} \begin{center}
    \bf}
  {\end{center} \end{quote}}