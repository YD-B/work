---
# Front matter
title: "Отчёта по лабораторной работе №4"
subtitle: "Вариант 5"
author: "Бронникова де Менезеш Эвелина"

# Generic otions
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

Построить фазовый портрет гармонического осциллятора и решить уравнения 
гармонического осциллятора, используя программу OpenModelica.

# Задание

Построить фазовый портрет гармонического осциллятора и решить уравнения гармонического осциллятора  для следующих случаев:
1. Колебания гармонического осциллятора без затуханий и без действий внешней силы $\ddot x+2,5x=0$ 
2. Колебания гармонического осциллятора c затуханием и без действий внешней 
силы $\ddot x+10\dot x+11x=0$
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы $\ddot x+\dot x+x=3sin(t)$ 

На интервале $t\in [0; 65]$ (шаг 0.05) с начальными условиями $x_0=-1, y_0=2$[^1]

[^1]:[Кулябов Д.С. Задания к лабораторной работе № 4 (по вариантам). - 23 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831116)

# Теоретическое введение

**Модель гармонических колебаний**
Движение грузика на пружинке, маятника, заряда в электрическом контуре, а 
также эволюция во времени многих систем в физике, химии, биологии и других 
науках при определенных предположениях можно описать одним и тем же 
дифференциальным уравнением, которое в теории колебаний выступает в качестве 
основной модели. Эта модель называется линейным гармоническим осциллятором.
Уравнение свободных колебаний гармонического осциллятора имеет 
следующий вид:

$$\begin{equation}\ddot x+2\gamma\dot x +\omega^2_0=0 \end{equation}$$

где 

x – переменная, описывающая состояние системы (смещение грузика, заряд 
конденсатора и т.д.), 

$\gamma$ – параметр, характеризующий потери энергии (трение в 
механической системе, сопротивление в контуре) 

$\omega_0$ – собственная частота колебаний, 

t – время. 

(Обозначения $$\ddot x=\frac{\partial^2 x}{\partial t^2}, \dot x = \frac{\partial x}{\partial t}$$)

Уравнение (1) есть линейное однородное дифференциальное уравнение 
второго порядка и оно является примером линейной динамической системы.

При отсутствии потерь в системе ($\gamma$= 0) вместо уравнения (1.1) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется 
во времени.

$$
\begin{equation}
\ddot x+\omega^2_0x=0 
\end{equation}
$$

Для однозначной разрешимости уравнения второго порядка (2) необходимо задать два начальных условия вида

$$
\begin{equation}
\begin{cases}
x(t_0)=x_0 
\\
\dot x(t_0)=y_0
\end{cases}
\end{equation}
$$

Уравнение второго порядка (2) можно представить в виде системы двух уравнений первого порядка:

$$
\begin{equation}
\begin{cases}
\dot x=y 
\\
\dot y=-\omega ^2_0x
\end{cases}
\end{equation}
$$

Начальные условия (3) для системы (4) примут вид:

$$
\begin{equation}
\begin{cases}
x(t_0)=x_0 
\\
y(t_0)=y_0
\end{cases}
\end{equation}
$$

Независимые переменные x, y определяют пространство, в котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.
Значение фазовых координат x, y в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом. [^2]

[^2]:[Кулябов Д.С. Лабораторная работа № 4. - 4 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831115)

# Выполнение лабораторной работы

Построение фазового портрета гармонического осциллятора и решение уравнения гармонического осциллятора на интервале $t\in [0; 65]$ (шаг 0.05) с начальными условиями $x_0=-1, y_0=2$ для следующих случаев: 

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы $\ddot x+2,5x=0$ 

- 1. Написание программы для решения уравнения гармонического осциллятора.

![Рис.1.1 Уравнения гармонического осциллятора без затуханий и без действий внешней силы](MMPictures04/1.1.png){ #fig:001 width=70% }

- 2. Построение фазового портрета гармонического осциллятора, путем запуска симуляции с установленными условиями.

![Рис. 1.2 Фазовый портрет гармонического осциллятора без затуханий и без действий внешней силы](MMPictures04/1.2.png){ #fig:002 width=70% }

Так как значение затуханий и действий внешней силы равны 0, наблюдается, что отсутствует диссипация энергии и начало координат фазовой плоскости, x=y=0, соответствует точке равновесия движения. Таким образом, подтверждается, что энергия колебания осциллятора сохраняется во времени.[^3]

[^3]:[Ловецкий К.П., Севастьянов Л.А. Учебно-Методическое Пособие По Курсу
«Математическое Моделирование» Часть 1 - Осциллятор. - Москва: РУДН, 2007. - 63 с.](http://window.edu.ru/resource/250/63250/files/LinearVibrations.pdf)

&nbsp;

2. Колебания гармонического осциллятора c затуханием и без действий внешней 
силы $\ddot x+10\dot x+11x=0$

- 1. Написание программы для решения уравнения гармонического осциллятора.

![Рис.2.1 Уравнения гармонического осциллятора c затуханий и без действий внешней силы](MMPictures04/2.1.png){ #fig:003 width=70% }

- 2. Построение фазового портрета гармонического осциллятора, путем запуска симуляции с установленными условиями.

![Рис. 2.2 Фазовый портрет гармонического осциллятора c затуханием и без действий внешней силы](MMPictures04/2.2.png){ #fig:004 width=70% }

В данном случае наблюдается, что с затуханием, но отсутствием внешней силы осциллятор постепенно теряет скорость ($\dot x=y$).

&nbsp;

3. Колебания гармонического осциллятора c затуханием и под действием внешней силы $\ddot x+\dot x+x=3sin(t)$

- 1. Написание программы для решения уравнения гармонического осциллятора.

![Рис.3.1 Уравнения гармонического осциллятора c затуханий и под действием внешней силы](MMPictures04/3.1.png){ #fig:005 width=70% }

- 2. Построение фазового портрета гармонического осциллятора, путем запуска симуляции с установленными условиями.

![Рис. 3.2 Фазовый портрет гармонического осциллятора c затуханий и под действием внешней силы](MMPictures04/3.2.png){ #fig:006 width=70% }
 
Решение данного случая представляют собой спираль, которая постепенно принимает форму эллипса, поведение которого аналогичен изображённому в первом случае. 

# Выводы

Были построены фазовые портреты гармонического осциллятора для случаев: колебания гармонического осциллятора без затуханий и без действий внешней, колебания гармонического осциллятора c затуханием и без действий внешней силы, колебания гармонического осциллятора c затуханием и под действием внешней силы, используя программу OpenModelica. А также решены соответствующие уравнения гармонического осциллятора. Кроме того, был проведен анализ результатов для каждого случая.

# Библиография
1. [Кулябов Д.С. Задания к лабораторной работе № 4 (по вариантам). - 23 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831116)
2. [Кулябов Д.С. Лабораторная работа № 4. - 4 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831115)
3. [Ловецкий К.П., Севастьянов Л.А. Учебно-Методическое Пособие По Курсу
«Математическое Моделирование» Часть 1 - Осциллятор. - Москва: РУДН, 2007. - 63 с.](http://window.edu.ru/resource/250/63250/files/LinearVibrations.pdf)
