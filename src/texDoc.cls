% This document class provides a simple doc for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
%
% Customized for IST Courses by Francisco Maria Calisto.
%
% Original Author: Rob Oakes, Copyright 2010.  
% Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texDoc}[2017/02/22 - Simple Document, Including Logo, 2017/02/22 adaptation by Francisco Maria Calisto]
\RequirePackage{palatino}
\usepackage{graphicx}
% Load the Base Class
\LoadClassWithOptions{article}
% Begin Requirements
\RequirePackage{ifthen}
% Specialized doc Commands (To, From, Subject, Logo, Letterhead Address)
\def\@doccourse{\relax}
\newcommand{\doccourse}[1]{\gdef\@doccourse{#1}}
\def\@docid{\relax}
\newcommand{\docid}[1]{\gdef\@docid{#1}}
\def\@docfrom{\relax}
\newcommand{\docfrom}[1]{\gdef\@docfrom{#1}}
\def\@docsubject{\relax}
\newcommand{\docsubject}[1]{\gdef\@docsubject{#1}}
\def\@docdate{\relax}
\newcommand{\docdate}[1]{\gdef\@docdate{#1}}
\def\@doclogo{\relax}
\newcommand{\logo}[1]{\gdef\@doclogo{\protect #1}}
\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block
\renewcommand{\maketitle}{\makedoctitle}
\newcommand\makedoctitle{
	\ifthenelse{\equal{\@doclogo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@doclogo
			\vspace{0.5in}
		\par\end{flushright}%
	\end{minipage}
	}
	{\begin{center}
	\LARGE\bf
	H\textsc{omework}
	\end{center}}
	% To, From, Subject Block
	\begin{description}
		\ifthenelse{\equal{\@docfrom}{\relax}}{}{\item [\IfLanguageName{english}{From:}{De:}] \@docfrom}
		\ifthenelse{\equal{\@docid}{\relax}}{}{\item [\IfLanguageName{english}{Student ID:}{Aluno n.:}] \@docid} 
\ifthenelse{\equal{\@doccourse}{\relax}}{}{\item [\IfLanguageName{english}{Course:}{Disciplina:}] \@doccourse}
		\ifthenelse{\equal{\@docsubject}{\relax}}{}{\item [\IfLanguageName{english}{Subject:}{Assunto:}] \@docsubject}
		\ifthenelse{\equal{\@docdate}{\relax}}{}{\item [\IfLanguageName{english}{Date:}{Data:}] \@docdate}
	\end{description}
	\decorativeline\bigskip{}
}