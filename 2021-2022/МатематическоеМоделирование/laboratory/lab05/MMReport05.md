---
# Front matter
title: "Отчёт по лабораторной работе №5"
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

Построить модели «хищник-жертва». В частности, построить график зависимости численности хищников от численности жертв, графики изменения численности хищников и численности, и найти стационарное состояние системы, используя программу OpenModelica.

# Задание

Для модели «хищник-жертва»:
$$
\begin{cases}
\frac{dx}{dt}=-0.16x(t)+0.045x(t)y(t)
\\
\frac{dy}{dt}=0.36y(t)-0.033x(t)y(t)
\end{cases}
$$

Постройте график зависимости численности хищников от численности жертв, а также графики изменения численности хищников и численности жертв при следующих начальных условиях: $x_0$=10, $y_0$=15. Найдите стационарное состояние системы.[^1]

[^1]:[Кулябов Д.С. Задания к лабораторной работе № 5 (по вариантам). - 27 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831120)

# Теоретическое введение

**Модель хищник-жертва**
Простейшая модель взаимодействия двух видов типа «хищник — жертва» -модель Лотки-Вольтерры. Данная двувидовая модель основывается на следующих предположениях:

1. Численность популяции жертв x и хищников y зависят только от времени (модель не учитывает пространственное распределение популяции на 
занимаемой территории)
2. В отсутствии взаимодействия численность видов изменяется по модели Мальтуса, при этом число жертв увеличивается, а число хищников падает
3. Естественная смертность жертвы и естественная рождаемость хищника считаются несущественными
4. Эффект насыщения численности обеих популяций не учитывается
5. Скорость роста численности жертв уменьшается пропорционально численности хищников 

$\frac{dx}{dt}=ax(t)+bx(t)y(t)$
$\frac{dy}{dt}=-cy(t)+dx(t)y(t)$ 
(1)

В этой модели x – число жертв, y - число хищников. Коэффициент a описывает скорость естественного прироста числа жертв в отсутствие хищников, с - естественное вымирание хищников, лишенных пищи в виде жертв. Вероятность взаимодействия жертвы и хищника считается пропорциональной как количеству жертв, так и числу самих хищников (xy). Каждый акт взаимодействия уменьшает популяцию жертв, но способствует увеличению популяции хищников (члены -bxy и dxy в правой части уравнения). 

Стационарное состояние системы (1) (положение равновесия, не зависящее от времени решение) будет в точке: $x_0=\frac{c}{d}$, $y_0=\frac{a}{b}$. Если начальные значения задать в стационарном состоянии x(0)=$x_0$, y(0)=$y_0$, то в любой момент времени численность популяций изменяться не будет. При малом отклонении от положения равновесия численности как хищника, так и жертвы с течением времени не возвращаются к равновесным значениям, а совершают периодические колебания вокруг стационарной точки. Амплитуда колебаний и их период определяется начальными значениями численностей x(0), y(0). Колебания совершаются в противофазе.[^2]

[^2]:[Кулябов Д.С. Лабораторная работа № 5. - 5 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831119)

# Выполнение лабораторной работы

1. Написание программы с необходимыми условиями в OpenModelica.

![Рис.1.1 Программа в OpenModelica](MMPictures05/1.1vd.png){#fig:001 width=70%}

2. Построение графика зависимости численности хищников от численности жертв.

Открывается параметрический график.

![Рис.1.2 График зависимости численности хищников от численности жертв](MMPictures05/400s1.2.png){#fig:002 width=70%}

3. Построение графика изменения численности хищников и численности жертв.

![Рис.1.3 График изменения численности хищников и численности жертв](MMPictures05/400s1.3.png){#fig:003 width=70%}

4. Нахождение стационарного состояния системы.

Изменяется значение точки $x_0$ и $y_0$.

![Рис.1.4 Точка стационарного состояние системы в программе](MMPictures05/1.4.png){#fig:004 width=70%}

![Рис.1.5 Стационарное состояние системы](MMPictures05/1.5.png){#fig:005 width=70%}

Можно увидеть, что действительно в данной точке численность популяций не изменяется.

# Выводы

Были построены модели «хищник-жертва». В частности, график зависимости численности хищников от численности жертв, графики изменения численности хищников и численности, и найдено стационарное состояние системы, используя программу OpenModelica.

# Библиография

1. [Кулябов Д.С. Задания к лабораторной работе № 5 (по вариантам). - 27 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831120)
2. [Кулябов Д.С. Лабораторная работа № 5. - 5 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831119)


