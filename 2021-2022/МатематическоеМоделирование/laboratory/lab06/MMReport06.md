---
# Front matter
title: "Отчёт по лабораторной работе №6"
subtitle: "Вариант 5"
author: "Бронникова де Менезеш Эвелина"

# Generic options
lang: ru-RU
toc-title: "Содержание"

# Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

# Pdf output format
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n
polyglossia-lang:
  name: russian
  options:
    - spelling=modern
    - babelshorthands=true
polyglossia-otherlangs:
  name: english
### Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Misc options
indent: true
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Рассмотреть простейшую модель эпидемии и построить соответствующие модели, используя программу OpenModelica. В частности, необходимо построить графики изменения числа особей в трех группах людей - заболевших, здоровых с иммунитетом к болезни и восприимчивых к болезни, но пока здоровых.

# Задание

На одном острове вспыхнула эпидемия. Известно, что из всех проживающих на острове $(N=11 000)$ в момент начала эпидемии $(t=0)$ число заболевших людей (являющихся распространителями инфекции) $I(0)=111$, А число здоровых людей с иммунитетом к болезни $R(0)=11$. Таким образом, число людей восприимчивых к болезни, но пока здоровых, в начальный момент времени $S(0)=N-I(0)-R(0)$.

Постройте графики изменения числа особей в каждой из трех групп. Рассмотрите, как будет протекать эпидемия в случае: 

1) если $I(0)\le I^*$

2) если $I(0)\gt I^*$[^1]

[^1]:[Кулябов Д.С. Задания к лабораторной работе № 6 (по вариантам). - 28 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831123)

# Теоретическое введение

**Задача об эпидемии**

Рассмотрим простейшую модель эпидемии. Предположим, что некая популяция, состоящая из $N$ особей, (считаем, что популяция изолирована) подразделяется на три группы. Первая группа - это восприимчивые к болезни, но пока здоровые особи, обозначим их через $S(t)$. Вторая группа – это число инфицированных особей, которые также при этом являются распространителями инфекции, обозначим их $I(t)$. А третья группа, обозначающаяся через $R(t)$ – это здоровые особи с иммунитетом к болезни. 

До того, как число заболевших не превышает критического значения $I^*$, считаем, что все больные изолированы и не заражают здоровых. Когда $I(t)\gt I^*$, тогда инфицирование способны заражать восприимчивых к болезни особей. 

Таким образом, скорость изменения числа $S(t)$ меняется по следующему закону:

$$
\begin{equation}
\frac{dS}{dt}=
\begin{cases} 
-\alpha S, если I(t)\gt I^*
\\
0, если I(t)\le I^*
\end{cases}
\end{equation}
$$

Поскольку каждая восприимчивая к болезни особь, которая, в конце концов, заболевает, сама становится инфекционной, то скорость изменения числа инфекционных особей представляет разность за единицу времени между заразившимися и теми, кто уже болеет и лечится, т.е.:

$$
\begin{equation}
\frac{dI}{dt}=
\begin{cases} 
\alpha S-\beta I, если I(t)\gt I^*
\\
-\beta I, если I(t)\le I^*
\end{cases}
\end{equation}
$$

А скорость изменения выздоравливающих особей (при этом приобретающие иммунитет к болезни)

$$
\begin{equation}
\frac{dR}{dt}=\beta I
\end{equation}
$$

Постоянные пропорциональности $\alpha, \beta$ - это коэффициенты заболеваемости и выздоровления соответственно.

Для того, чтобы решения соответствующих уравнений определялось однозначно, необходимо задать начальные условия. Считаем, что на начало эпидемии в момент времени $t=0$ нет особей с иммунитетом к болезни $R(0)=0$, а число инфицированных и восприимчивых к болезни особей $I(0)$ и $S(0)$ соответственно. Для анализа картины протекания эпидемии необходимо рассмотреть два случая: $I(0)\le I^*$ и $I(0)\gt I^*$.[^2]

[^2]:[Кулябов Д.С. Лабораторная работа № 6. - 4 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831124)

# Выполнение лабораторной работы

1. Случай если $I(0)\le I^*$ (случай 1)

- 1. Написание программы с необходимыми условиями в OpenModelica.

![Рис.1.1 Программа в OpenModelica для случая 1](MMPictures06/1.1v1.png){#fig:001 width=70%}

- 2. Построение графика изменения числа особей в каждой из трех групп для случая, если $I(0)\le I^*$.

$S(0)=N-I(0)-R(0)=10 878$

![Рис.1.2 График изменения числа особей в группе с иммунитетом к болезни и группе инфицированных и восприимчивых к болезни в случае 1](MMPictures06/1.2_1v1.png){#fig:002 width=70%}

![Рис.1.3 График изменения числа особей в трех группах в случае 1](MMPictures06/1.2_2v1.png){#fig:003 width=70%}

По графикам можно увидеть, что со временем число инфицированных особей, которые при этом являются распространителями инфекции ($I$) уменьшается. А здоровых особей с иммунитетом к болезни ($R$) увеличивается. В то время как число восприимчивых к болезни, но пока здоровые особей ($S$) не меняется. Таким образом наблюдается, что все больные изолированы и не заражают здоровых, а выздоравливающие особи при этом приобретают иммунитет к болезни.

2. Случай если $I(0)\gt I^*$ (случай 2)

- 1. Написание программы с необходимыми условиями в OpenModelica.

![Рис.2.1 Программа в OpenModelica для случая 2](MMPictures06/1.3v1.png){#fig:004 width=70%}

- 2. Построение графика изменения числа особей в каждой из трех групп для случая если $I(0)\gt I^*$ 

![Рис.1.3 График изменения числа особей в трех группах в случае 2](MMPictures06/1.4v1.png){#fig:005 width=70%}

В данном случае число здоровых особей с иммунитетом к болезни ($R$) увеличивается. А число восприимчивых к болезни, но пока здоровые особей ($S$) стремительно уменьшается. Что и свидетельствует тому, что инфицированные способны заражать восприимчивых к болезни особей.

# Выводы

В ходе выполнения данной лабораторной работы была рассмотрена простейшая модель эпидемии и построены соответствующие модели, используя программу OpenModelica. В частности, построились графики изменения числа особей в трех группах людей - заболевших, здоровых с иммунитетом к болезни и здоровых, но восприимчивых к болезни. В случае если $I(0)\le I^*$ и если $I(0)\gt I^*$.

# Библиография

1. [Кулябов Д.С. Задания к лабораторной работе № 6 (по вариантам). - 28 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831123)
2. [Кулябов Д.С. Лабораторная работа № 6. - 4 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831124)
