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

Ознакомиться с математической моделью распространения рекламы, используя программу OpenModelica. 

# Задание

Постройте график распространения рекламы, математическая модель которой описывается следующим уравнением:

1. $\frac{dn}{dt}=(0.77+0.00017n(t))(N-n(t))$
2. $\frac{dn}{dt}=(0.000055+0.29n(t))(N-n(t))$
3. $\frac{dn}{dt}=(0.5*t+0.3*t*n(t))(N-n(t))$

При этом объем аудитории $N=610$, в начальный момент о товаре знает 10 человек. Для случая 2 определите в какой момент времени скорость распространения рекламы будет иметь максимальное значение.[^1]

[^1]:[Кулябов Д.С. Задания к лабораторной работе № 7 (по вариантам). - 26 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831128)

# Теоретическое введение

**Эффективность рекламы**

Организуется рекламная кампания нового товара или услуги. Необходимо, чтобы прибыль будущих продаж с избытком покрывала издержки на рекламу. Вначале расходы могут превышать прибыль, поскольку лишь малая часть потенциальных покупателей будет информирована о новинке. Затем, при увеличении числа продаж, возрастает и прибыль, и, наконец, наступит момент, когда рынок насытиться, и рекламировать товар станет бесполезным.

Предположим, что торговыми учреждениями реализуется некоторая продукция, о которой в момент времени $t$ из числа потенциальных покупателей $N$ знает лишь $n$ покупателей. Для ускорения сбыта продукции запускается реклама по радио, телевидению и других средств массовой информации. После запуска рекламной кампании информация о продукции начнет распространяться среди потенциальных покупателей путем общения друг с другом. Таким образом, после запуска рекламных объявлений скорость изменения числа знающих о продукции людей пропорциональна как числу знающих о товаре покупателей, так и числу покупателей о нем не знающих.

Модель рекламной кампании описывается следующими величинами. Считаем, что $\frac{dn}{dt}$ - скорость изменения со временем числа потребителей, узнавших о товаре и готовых его купить, $t$ - время, прошедшее с начала рекламной кампании, $n(t)$ - число уже информированных клиентов. Эта величина пропорциональна числу покупателей, еще не знающих о нем, это описывается следующим образом: $\alpha _1(t)(N-n(t))$, где $N$ - общее число потенциальных платежеспособных покупателей, $\alpha _1 (t)>0$ - характеризует интенсивность рекламной кампании (зависит от затрат на рекламу в данный момент времени). Помимо этого, узнавшие о товаре потребители также распространяют полученную информацию среди потенциальных покупателей, не знающих о нем (в этом случае работает т.н. сарафанное радио). Этот вклад в рекламу описывается величиной $\alpha _2(t)n(t)(N-n(t))$, эта величина увеличивается с увеличением потребителей узнавших о товаре. Математическая модель распространения рекламы описывается уравнением:

$$
\begin{equation}
\frac{dn}{dt}=(\alpha _1(t)+\alpha _2(t)n(t))(N-n(t))
\end{equation}
$$

При $\alpha _1(t)>>\alpha _2(t)$ получается модель типа модели Мальтуса.

В обратном случае, при $\alpha _1(t)<<\alpha _2(t)$ получаем уравнение логистической кривой.[^2]

[^2]:[Кулябов Д.С. Лабораторная работа № 7. - 5 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831127)

# Выполнение лабораторной работы

1. Случай 1: $\frac{dn}{dt}=(0.77+0.00017n(t))(N-n(t))$

- 1. Написание программы с необходимыми условиями в OpenModelica.

![Программа в OpenModelica для случая 1](MMPictures07/1.1.png){#fig:001 width=70%}

- 2. Построение графика распространения рекламы.

![График распространения рекламы для случая 1](MMPictures07/1.2_20x700.png){#fig:002 width=70%}

2. Случай 2: $\frac{dn}{dt}=(0.000055+0.29n(t))(N-n(t))$

- 1. Написание программы с необходимыми условиями в OpenModelica.

![Программа в OpenModelica для случая 2](MMPictures07/2.1.png){#fig:003 width=70%}

- 2. Построение графика распространения рекламы. 

![График распространения рекламы для случая 2](MMPictures07/2.2_20x700.png){#fig:004 width=70%}

![Приближение к кривой числа уже информированных клиентов графика распространения рекламы для случая 2](MMPictures07/2.2v1.png){#fig:005 width=70%}

Сравнив данный график с предыдущем, можно заметить, что скорость распространения рекламы для 2 случая превышает 1.

- 3. Определение момента времени, в котором скорость распространения рекламы имеет максимальное значение.

![График скорости изменения со временем числа потребителей для случая 2](MMPictures07/2.3.1v2.png){#fig:006 width=70%}

![Момент времени, в котором скорость распространения рекламы имеет максимальное значение для случая 2](MMPictures07/2.3.2v3.png){#fig:007 width=70%}

Момент времени, в котором скорость распространения рекламы имеет максимальное значение - 0.02s.

3. Случай 3: $\frac{dn}{dt}=(0.5*t+0.3*t*n(t))(N-n(t))$

- 1. Написание программы с необходимыми условиями в OpenModelica.

![Программа в OpenModelica для случая 3](MMPictures07/3.1.png){#fig:008 width=70%}

- 2. Построение графика распространения рекламы.

![График распространения рекламы для случая 3](MMPictures07/3.2_20x700.png){#fig:009 width=70%}

Сравнив все 3 графика можно заметить, что если сортировать модели по скорости распространения рекламы то на первом месте будет случай 2, затем 3 и на последнем случай 1. 

# Выводы

В ходе выполнения данной лабораторной работы была построена модель распространения рекламы, используя программу OpenModelica. 
В частности, построились графики распространения рекламы для 3 случаев, а также определилось в какой момент времени скорость распространения рекламы будет иметь максимальное значение для 2 случая.

# Библиография

1. [Кулябов Д.С. Задания к лабораторной работе № 7 (по вариантам). - 26 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831128)
2. [Кулябов Д.С. Лабораторная работа № 7. - 5 c.](https://esystem.rudn.ru/mod/resource/view.php?id=831127)

