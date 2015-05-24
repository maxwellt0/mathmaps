-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Трв 22 2015 р., 08:39
-- Версія сервера: 5.7.5-m15
-- Версія PHP: 5.4.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `mathmaps`
--

-- --------------------------------------------------------

--
-- Структура таблиці `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `higher_note_id` int(11) NOT NULL,
  `lower_note_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `link`
--

INSERT INTO `link` (`higher_note_id`, `lower_note_id`) VALUES
(101, 38),
(38, 39),
(101, 39),
(35, 41),
(38, 41),
(101, 41),
(35, 42),
(101, 42),
(100, 44),
(100, 45),
(35, 46),
(43, 46),
(44, 46),
(100, 60),
(43, 61),
(100, 61),
(100, 62),
(62, 63),
(100, 63),
(61, 68),
(63, 68),
(69, 68),
(101, 69),
(100, 70),
(72, 71),
(101, 71),
(92, 78),
(63, 80),
(79, 80),
(79, 81),
(81, 82),
(45, 84),
(81, 84),
(80, 85),
(80, 87),
(80, 88),
(90, 91),
(89, 92),
(82, 94),
(60, 96),
(100, 96),
(96, 97),
(43, 100),
(35, 101);

-- --------------------------------------------------------

--
-- Структура таблиці `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `note_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `publishing_status` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `text` varchar(10000) NOT NULL,
  `note_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `note`
--

INSERT INTO `note` (`note_id`, `name`, `publishing_status`, `rank`, `text`, `note_type_id`) VALUES
(4, 'Означення метрики', 0, NULL, 'dfasdsadasd', 1),
(19, 'фівафівафі', 0, NULL, 'вафівафіва', 1),
(20, 'фівафівафі', 0, NULL, 'вафівафіваіва', 1),
(32, 'Топологія', 0, NULL, '\\newcommand{definitio}{Означення}[section]\r\n\\begin{definitio}\r\nНехай $X$ --- непорожня. Сім''я підмножин \\tau в $X$ називається топологією, якщо:\r\n$	1. \\oslash \\in \\tau;\r\n	2. x \\in \\tau;\r\n	3. \\forall U,V \\in \\tau, U\\cap V \\in \\tau;\r\n	4. Якщо сім''я U_\\alpha\\in\\tau;\r\n$\r\n\\end{definitio}', 1),
(35, 'Топологія', 2, NULL, 'Нехай $X - $ непорожня. Сім''я підмножин $\\tau$ в $X$ називається топологією, якщо:<br>\r\n1. $\\oslash \\in \\tau;$ <br>\r\n2. $ x \\in \\tau;$ <br>\r\n3. $\\forall U, V \\in \\tau, U \\cap V \\in \\tau $; <br>\r\n4. Cім''я $U_\\alpha\\in\\tau$; <br>\r\n\r\n', 1),
(37, 'Топологія', 0, NULL, 'Нехай $X --- $ непорожня. Сім''я підмножин $\\tau$ в $X$ називається топологією, якщо:\r\n$\r\n\\begin{enumerate}\r\n\\item \\oslash \\in \\tau;\r\n\\item x \\in \\tau;\r\n\\item \\forall U,V \\in \\tau, U\\cap V \\in \\tau;\r\n\\item Якщо сім''я U_\\alpha\\in\\tau;\r\n$\r\n', 1),
(38, 'Неперервне відображення', 2, NULL, 'Нехай $(X,\\tau_{x})$, $(X,\\tau_{y}) -$ топологічні простори.\r\n$F:X\\rightarrow X -$ відображення. <br>\r\n$F$ називається неперервним в точці $x_0\\in X$, якщо для будь-якого околу $\\;V\\;$ точки $f(x_0)\\in X$ існує окіл $U$ точки $x_0\\in X$ такий, що: $F(U)\\subset V$ тобто $\\forall x\\in U, F(X)\\in V$.', 1),
(39, 'Гомеоморфізм', 2, NULL, 'Відображення $F$ між топологічними просторами $X$ та $Y$ називається ${\\it гомеоморфізмом} $, якщо:<br>\r\n1. $F - $ бієктивне;<br>\r\n2. $F - $ неперевне;<br>\r\n3. $F^{-1} - $ неперервне.', 1),
(41, 'Індуктивна топологія', 2, NULL, 'Нехай $(X,\\tau_{x}) - $ топологічни простір, $Y-$ деяка множина, $\\{F_{\\alpha}\\}$ сім''я відображень $F_{\\alpha}:X\\rightarrow X$.<br>\r\nВизначимо топологію на $X$, так щоб всі  $F_{\\alpha}$ були неперервними.\r\nНайсильніша топологія на $X$ така, що всі $F_{\\alpha}$  будуть неперервними називається ${\\it індуктивною}$ топологією, породженою сім''єю\r\n$\\{F_{\\alpha}\\}$. Ця топологія породжена передбазою $F_{\\alpha}(U),U\\in\\tau_x$.', 1),
(42, 'Проективна топологія', 2, NULL, 'Нехай $X - $ множина,$(X,\\tau_{y}) - $ топологічний простір.\r\n$F_{\\alpha}:X\\rightarrow X - $ сім''я відображень. Визначимо топологію на $X$, так що всі $F_{\\alpha}$ були неперервними.\r\nНайслабша топологія на $X$ для якої всі $F_{\\alpha}$ будуть неперервними називається  ${\\itпроективною}$ топологією породженою $\\{F_{\\alpha}\\}$. Ця топологія задається передбазою $F_{\\alpha}^{-1}(V), V\\in\\tau_y$', 1),
(43, 'Метрика', 2, NULL, 'Нехай $X - $ непорожня множина. Функція $d:X\\times X\\rightarrow R$ називається метрикою на $X$, якщо:<br>\r\n1. $d(x,y)\\geq0\\quad\\quad\\quad\\quad\\quad\\quad\\forall x,y\\in X$;<br>\r\n2. $d(x,y)=0\\quad\\quad\\quad<=>\\quad\\quad x=y$;<br>\r\n3. $d(x,y)=d(y,x)\\quad\\quad\\quad\\quad\\quad\\forall x,y\\in X$;<br>\r\n4. $d(x,y)\\leq d(x,z)+d(z,y)\\quad\\forall x,y,z\\in~X$.<br>', 1),
(44, 'Відкрита куля', 2, NULL, 'Відкритою кулею в метричному просторі $ (X,d) $ з центром в точці $ x_0 $ радіуса $r$ називається множина $ B_r (x_0)= \\{  x\\in X | d(x,x_0)  &lt; r \\}$', 1),
(45, 'Замкнена куля', 2, NULL, 'Замкненою кулею в метричному просторі $(X,d)$ з центром в точці $x_0$ радіуса $r$ називається множина\r\n$$B_r(x_0)=\\{x\\in X|d(x,x_0)\\leq r\\}$$', 1),
(46, 'Асоціативна топологія', 2, NULL, 'Топологія породжена передбазою відкритих куль називається ${\\itасоціативною}$ з метрикою $d$', 1),
(60, 'Підпростір метричного простору', 2, NULL, 'Нехай $(X,d) - $ метричний простір. Тоді метричний простір$ ~(X_0,d_0)$ називається підпростором $(X,d)$, якщо: <br>\r\n1. $X_0\\subset X$<br>\r\n2. $\\forall x,y\\in X_0,\\quad d_0(x,y)=d(x,y)$', 1),
(61, 'Ізометрична ізоморфність просторів', 2, NULL, 'Метричний простір $(X,d_x)$ називається ${\\itізометрично\\,ізоморфним\\,простором}\\,(X,d_y)$, якщо існує  бієктивне відображення: $F:X\\rightarrow X$, що зберігає метрику\r\n$$d_x(x_1,x_2)=d_y(F(x_1),F(x_2))\\quad\\quad\\quad \\forall x_1,x_2\\in X$$\r\n$F$ називається ${\\itізометричним\\,ізоморфізмом}$.', 1),
(62, 'Фундаментальна послідовність', 2, NULL, 'Нехай $(X,d) - $метричний простір<br>\r\nПослідовність $\\{x_n\\}\\subset X$ називається ${\\itфундаментальною}$, якщо\r\n$\\forall \\epsilon>0, \\exists n_0\\in N$ що $\\forall m,n>n_0$<br>\r\n$d(x_n,x_m)<\\epsilon$ ', 1),
(63, 'Повний метричний простір', 2, NULL, 'Метричний простір $X$ називається ${\\itповним}$, якщо кожна фундаментальна послідовність в $X$ має границю в $X$', 1),
(68, 'Поповнення простору', 2, NULL, 'Нехай $(X,d_x) - $ метричний простір. Метричний простір $(Y,d_y)$ називається $\\textit{поповненням  простору}\\quad(X,d_x)$ якщо:<br>\r\n1. $\\exists I:X\\rightarrow Y$ ізометричне вкладення;<br>\r\n2. $X$ є всюди щільним в $Y$;<br>\r\n3. $(Y,d_y) - $ повний.<br>', 1),
(69, 'Всюди щільна підмножина', 2, NULL, 'Підмножина $A$ топологічного простору $X$ є ${\\bf щільною}$ у підмножині $B$, якщо замикання $A$ містить $B$<br>\r\n$\\overline{A}\\supset B$<br>\r\n$A$ називається ${\\bf всюди щільною}$ підмножиною, якщо $\\overline{A}= X$.<br>\r\n$A$ всюди щільна підмножина, тоді і тільки тоді, коли:<br>\r\n$\\forall U,\\quad U\\subset X,\\quad \\exists x_0\\in A, \\mbox{що}\\quad x_0\\in U$.', 1),
(70, 'Нерухома точка', 2, NULL, 'Нехай $(X,d) - $ метричний простір. $F:X\\rightarrow X$.<br>\r\nСкажемо, що $x_0\\in X$ є ${\\bfнерухомою\\,точкою}$ відображення $F$, якщо $F(x_0)=~x_0$<br>', 1),
(71, 'Компактний простір', 2, NULL, 'Топологічний простір $X$ називаєтся ${\\bfкомпактним}$, якщо з будь-якого відкритого покриття $\\{U_{\\alpha}\\}$ цього простору можна вибрати скінчення підпокриття $U_{\\alpha_1},\\ldots,U_{\\alpha_n}$ ', 1),
(72, 'Відкрите покриття простору', 2, NULL, 'Відкритим покриттям простору $X$ називається сім''я відкритих множин $\\{U_{\\alpha}\\}$, що $\\bigcup_{\\alpha}U_{\\alpha}\\supset X$. Підпокриття це підмножина в $\\{U_{\\alpha}\\}$, яка також є покриттям.', 1),
(77, 'Стисне відображення', 2, NULL, 'Відображення $F:X\\rightarrow X$ називається ${\\bfстикуючим(стисним)}$, якщо $\\exists\\lambda, 0\\leq\\lambda<1,\\quad\\mbox{що}\\;\\forall x,y\\in X$\r\n$$d(F(x),F(y))\\leq\\lambda d(x,y)$$', 1),
(78, 'Скінченновимірний базис', 2, NULL, '$\\newcommand{\\p}[2][n]{#2_{1},#2_{2},\\ldots, #2_{#1}}$\r\nЯкщо в лінійному просторі $X$ існує скінченний базис Гамеля $\\{\\p{e}\\}$, то $X$ називається ${\\bfскінченновимірним}$ ($n$-вимірним) <br>\r\n$$\\dim X=n$$\r\nВ іншому випадку $X$ називається ${\\bfнескінченновимірним}$ $\\dim X=\\infty$', 1),
(79, 'Норма на просторі', 2, NULL, '$\\newcommand{\\BBR}{\\mathbb{R}}$\r\nНехай $X$$-$лінійний простір над полем дійсних чисел $\\BBR$.<br>\r\nФункція $||x||$ визначена на $X$ зі значенням в $\\BBR$ називається ${\\bfнормою}$, якщо:<br>\r\n1. $||x||\\geq 0, \\forall x\\in X$.<br>\r\n2. $||x||=0 \\Leftrightarrow x=0$.<br>\r\n3. $||\\lambda x||=\\lambda||x||, \\quad \\forall \\lambda\\in\\BBR, x\\in X$.<br>\r\n4. Нерівність трикутника<br>\r\n$||x+y||\\leq||x||+||y||$', 1),
(80, 'Банаховий простір', 2, NULL, 'Повний нормований простір називається ${\\bfбанаховим}$ простором', 1),
(81, 'Лінійний оператор', 2, NULL, '$\\newcommand{\\BBR}{\\mathbb{R}}$\r\nНехай $X,Y$$-$ нормовані простори. Відображення $A:X\\rightarrow Y$ називаться ${\\bfлінійним\\,оператором}$, якщо:<br> \r\n1. $A(x_1+x_2)=A(x_1)+A(x_2),\\quad \\forall x_1,x_2\\in X$.<br>\r\n2. $A(\\lambda x)=\\lambda A(x), \\quad \\forall\\lambda\\in\\BBR, x\\in X$. ', 1),
(82, 'Лінійний функціонал', 2, NULL, 'Лінійний оператор з $X$ в $X$ називається ${\\bfлінійним\\,функціоналом}.$', 1),
(83, 'Ізоморфізм', 2, NULL, 'Лінійний оператор $A$ з нормованого простору $X$ в нормований простір $Y$ називається ${\\bfізоморфізмом}$, якщо: <br>\r\n$A$$-$бієктивний, $A$$-$неперервний і $A^{-1}$$-$неперервний.', 1),
(84, 'Обмежений лінійний оператор', 2, NULL, 'Лінійний оператор $A:X\\rightarrow Y(X,Y-\\text{нормовані})$ називається ${\\bfобмеженим}$, <br> якщо $A - $обмежений на $\\overline{B_1(0)}$$-$кулі в $X$ радіуса 1 з центром в нулі. Тобто $$\\sup_{||x||\\leq1}{||A(x)||<\\infty}$$', 1),
(85, 'Пряма сума просторів', 2, NULL, 'Нехай $X,Y$$-$банахові простори. ${\\bfПрямою\\;сумою}$ просторів $X\\oplus Y$ називають банахів простір, елементи якого мають вигляд $x+y$, де $x\\in X, y\\in Y$ і це зображення єдине.<br>\r\n$||x+y||=\\max(||x||,||y||)$. Пряма сума ізоморфна до декартового добутку <br>\r\n$$X\\times Y=\\{(x,y)|x\\in X,y\\in Y\\}$$\r\n$$||(x,y)||=\\max(||x||,||y||)$$\r\nОчевидно, що $X$ є замкненим підпротором в $X\\oplus Y$', 1),
(87, 'Доповнювальний і доповнюваний простори', 2, NULL, 'Нехай $Z$$-$банахів простір. $X$$-$замкнений підпростір. $X$$-$називається ${\\bfдоповнювальним}$ в $Z$, якщо існує замкнений підпростір $Y\\subset Z$, що $Z=X\\oplus Y$. $Y$$-$називається ${\\bfдоповнюваним}$ до $X$.', 1),
(88, 'Оператор-проектор', 2, NULL, 'Нехай $Z-$банахів простір. $X$$-$замкнений підпростір. Оператор $P:Z\\rightarrow X$ називається ${\\bfпроектором}$, якщо<br>\r\n1. $P$ є сюр''єктивним.<br>\r\n2. $P(P(Z))=P(Z), \\forall z\\in Z$.', 1),
(89, 'Лінійно незалежна і лінійно залежна сім`ї', 2, NULL, '$\\newcommand{\\p}[2][n]{#2_{1},#2_{2},\\ldots, #2_{#1}}$\r\nНехай $X$$-$деякий лінійний простір. Сім''я ненульових векторів $\\{z_{\\alpha}\\}$$-$називається ${\\bfлінійно\\; незалежною}$ ($\\alpha$ пробігає деяку множину індексів) якщо з того, що <br>\r\n$$\\lambda_1\\alpha_1+\\lambda_2\\alpha_2+\\ldots+\\lambda_n\\alpha_n=0$$	для деяких числел $\\p{\\lambda}$ випливає, що $\\lambda_1=\\ldots=\\lambda_n=0$. <br>\r\nВ іншому випадку $\\{z_{\\alpha}\\}$ називаєтсья ${\\bf лінійно\\,залежною}$.', 1),
(90, 'Відношення порядку', 2, NULL, 'Нехай $\\{z_{\\alpha}\\}$ і $\\{y_{\\beta}\\}$ дві лінійно незалежні сім''ї. Введомо порядок $\\{z_{\\alpha}\\}\\leq\\{y_{\\beta}\\}$, якщо\r\n$\\{z_{\\alpha}\\}\\subseteq\\{y_{\\beta}\\}$<br>\r\nЗауважимо, що введення $\\leq$ відношення є відношенням часткового порядку.', 1),
(91, 'Ланцюг', 2, NULL, 'Підмножина частково впорядкованої множини називається ${\\bfланцюгом}$, якщо вона є лінійно впорядкована (тобто будь-які два елемента з цієї підмножини можна порівняти)', 1),
(92, 'Лінійний базис або базис Гамеля', 2, NULL, '${\\bfЛінійним\\,базисом}$ (базисом Гамеля) в лінійному просторі називається максимальна сім''я лінійно незалежних векторів.', 1),
(93, 'Базис Шаудера', 2, NULL, '$\\newcommand{\\BBR}{\\mathbb{R}}$\r\nЛінійно незалежна послідовність $\\{e_{\\infty}\\}$  банахового простору $X$ називається ${\\bf базисом Шаудера}$(топологічним базисом), якщо для будь-~якого $x\\in X$ існує послідовність чисел $\\{\\lambda_n\\}\\subset \\BBR $ така, що <br>\r\n$x=\\sum_{n=1}^{\\infty}{\\lambda_ne_n}=\\lim_{m\\rightarrow\\infty}\\sum_{n=1}^{\\infty}{\\lambda_ne_n}$, тобто<br> $||x-\\sum_{n=1}^{m}{\\lambda_ne_n}||\\rightarrow0$, при $m\\rightarrow\\infty$', 1),
(94, 'Продовження функціоналу', 2, NULL, 'Нехай $X$$-$нормований простір, $X_0$$-$підпростір в $X$. Нехай $f_0$$-$лінійний неперервний функціонал на $X_0$, тобто $f\\in X_0$. Тоді функціонал $f\\in X$ називаєтся ${\\bfпродовженням}$ функціоналу $f_0$, якщо $f(x)=f_0(x), \\forall x\\in X_0$', 1),
(96, 'Епсилон-сітка', 2, NULL, 'Нехай $X-$ метричний простір, $X_0\\subset X-$ підпростір.<br>\r\nПідмножина $M\\subset X$ називається  $\\epsilon$-${\\bfсіткою}$ підпростору $X_0$, якщо:<br>\r\n$\\forall x_0\\in X_0, \\exists a\\in M,\\, \\text{що}\\, d(x_0,a) $', 1),
(97, 'Цілком обмежений простір', 2, NULL, 'Підпростір $X$ називається ${\\bfцілком \\;обмежений}$, якщо:<br>\r\n$\\forall\\epsilon>0\\quad\\exists$ скінченнa ${\\bf \\epsilon}$-${\\bfсітка}$ підпростору $X_0$', 1),
(98, 'Одностайно неперервна сім`я функцій', 2, NULL, 'Сім''я функцій $\\{\\Phi_{\\alpha}|\\Phi_{\\alpha}(t)\\in[a,b]\\}$ називається ${\\bf одностайно\\,неперервною}$, якщо:<br>\r\n$\\forall\\epsilon>0,\\exists\\delta>0, \\text{що}\\;\\forall\\,t_1,t_2\\in[a,b],<br> \\text{що} |t_1-t_2|<\\delta \\Rightarrow |\\Phi_{\\alpha}(t_1)-\\Phi_{\\alpha}(t_2)|<\\epsilon, \\forall\\alpha$', 1),
(99, 'Обмежена сім`я функцій', 2, NULL, 'Сім''я функцій $\\{\\Phi_{\\alpha}\\}$ називається ${\\bf обмеженою}$, якщо:<br>\r\n$\\forall C>0,$ що $|\\Phi_{\\alpha}(t)|$<C, <br>\r\n$\\forall\\alpha, \\forall t \\in [a,b]$ ', 1),
(100, 'Метричний простір', 2, NULL, '$\\textbf{Метричний простір}$ — це пара $(X,d)$, яка складається з деякої множини $X$ елементів і метрики $d$, визначеної для будь-якої пари елементів цієї множини.', 1),
(101, 'Топологічний простір', 2, NULL, '$\\textbf{Топологічний простір}$ — це впорядкована пара $(X, \\tau)$, де $X$ — множина, а $\\tau$ — топологія.', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `note_type`
--

CREATE TABLE IF NOT EXISTS `note_type` (
  `note_type_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `note_type`
--

INSERT INTO `note_type` (`note_type_id`, `type`) VALUES
(1, 'Означення'),
(2, 'Задача'),
(3, 'Теорема'),
(4, 'Твердження'),
(5, 'Приклад'),
(6, 'Зауваження');

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(16) NOT NULL,
  `email` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`username`, `email`, `enabled`, `password`) VALUES
('itsme', 'eladelmv@gmail.com', 1, 'letmein'),
('Maxwellt', 'maksimvinnik@gmail.com', 1, '111111'),
('Rufus', 'cortesius@mail.ua', 1, '258258258qw');

-- --------------------------------------------------------

--
-- Структура таблиці `user_note`
--

CREATE TABLE IF NOT EXISTS `user_note` (
  `user_note_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `user_note`
--

INSERT INTO `user_note` (`user_note_id`, `status`, `note_id`, `username`) VALUES
(28, 1, 35, 'Maxwellt'),
(30, 1, 38, 'Maxwellt'),
(31, 1, 39, 'Maxwellt'),
(33, 1, 41, 'Maxwellt'),
(34, 1, 42, 'Maxwellt'),
(35, 1, 43, 'Maxwellt'),
(36, 1, 44, 'Maxwellt'),
(37, 1, 45, 'Maxwellt'),
(38, 1, 46, 'Maxwellt'),
(52, 1, 60, 'Maxwellt'),
(53, 1, 61, 'Maxwellt'),
(54, 1, 62, 'Maxwellt'),
(55, 1, 63, 'Maxwellt'),
(60, 1, 68, 'Maxwellt'),
(61, 1, 69, 'Maxwellt'),
(62, 1, 70, 'Maxwellt'),
(63, 1, 71, 'Maxwellt'),
(64, 1, 72, 'Maxwellt'),
(69, 1, 77, 'Maxwellt'),
(70, 1, 78, 'Rufus'),
(71, 1, 79, 'Rufus'),
(72, 1, 80, 'Rufus'),
(73, 1, 81, 'Rufus'),
(74, 1, 82, 'Rufus'),
(75, 1, 83, 'Rufus'),
(76, 1, 84, 'Rufus'),
(77, 1, 85, 'Rufus'),
(79, 1, 87, 'Rufus'),
(80, 1, 88, 'Rufus'),
(81, 1, 89, 'Rufus'),
(82, 1, 90, 'Rufus'),
(83, 1, 91, 'Rufus'),
(84, 1, 92, 'Rufus'),
(85, 1, 93, 'Rufus'),
(86, 1, 94, 'Rufus'),
(88, 1, 96, 'Rufus'),
(89, 1, 97, 'Rufus'),
(90, 1, 98, 'Rufus'),
(91, 1, 99, 'Rufus'),
(92, 1, 46, 'itsme'),
(93, 1, 69, 'itsme'),
(94, 1, 44, 'itsme'),
(95, 1, 72, 'itsme'),
(97, 1, 39, 'itsme'),
(98, 1, 45, 'itsme'),
(100, 1, 71, 'itsme'),
(101, 1, 38, 'itsme'),
(102, 1, 70, 'itsme'),
(103, 1, 63, 'itsme'),
(104, 1, 68, 'itsme'),
(107, 1, 93, 'itsme'),
(108, 1, 80, 'itsme'),
(109, 1, 90, 'itsme'),
(110, 1, 87, 'itsme'),
(111, 1, 96, 'itsme'),
(112, 1, 91, 'itsme'),
(113, 1, 92, 'itsme'),
(114, 1, 81, 'itsme'),
(115, 1, 82, 'itsme'),
(116, 1, 89, 'itsme'),
(117, 1, 43, 'itsme'),
(118, 1, 79, 'itsme'),
(119, 1, 99, 'itsme'),
(120, 1, 84, 'itsme'),
(121, 1, 98, 'itsme'),
(122, 1, 88, 'itsme'),
(131, 1, 94, 'itsme'),
(132, 1, 42, 'itsme'),
(133, 1, 85, 'itsme'),
(134, 1, 60, 'itsme'),
(135, 1, 78, 'itsme'),
(136, 1, 77, 'itsme'),
(137, 1, 35, 'itsme'),
(138, 1, 62, 'itsme'),
(139, 1, 97, 'itsme'),
(140, 1, 61, 'itsme'),
(141, 1, 83, 'itsme'),
(142, 1, 41, 'itsme'),
(143, 1, 100, 'itsme'),
(144, 1, 101, 'itsme');

-- --------------------------------------------------------

--
-- Структура таблиці `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  `username` varchar(16) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `role`, `username`) VALUES
(1, 'ROLE_USER', 'Maxwellt'),
(2, 'ROLE_USER', 'itsme'),
(3, 'ROLE_ADMIN', 'itsme'),
(4, 'ROLE_USER', 'Rufus');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`lower_note_id`,`higher_note_id`), ADD KEY `FK_H_NOTE_TO_L_NOTE` (`lower_note_id`), ADD KEY `FK_L_NOTE_TO_H_NOTE` (`higher_note_id`);

--
-- Індекси таблиці `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`note_id`), ADD KEY `FK_105lhx05vyp824xw6jbfsccuf` (`note_type_id`);

--
-- Індекси таблиці `note_type`
--
ALTER TABLE `note_type`
  ADD PRIMARY KEY (`note_type_id`);

--
-- Індекси таблиці `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`), ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Індекси таблиці `user_note`
--
ALTER TABLE `user_note`
  ADD PRIMARY KEY (`user_note_id`), ADD KEY `FK_k9jhcyiij1mhd3p2l63fon34a` (`note_id`), ADD KEY `FK_5pfoiqjauemr1g3kagl2xs66y` (`username`);

--
-- Індекси таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`), ADD KEY `FK_9ry105icat2dux14oyixybw9l` (`username`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `note`
--
ALTER TABLE `note`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT для таблиці `note_type`
--
ALTER TABLE `note_type`
  MODIFY `note_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблиці `user_note`
--
ALTER TABLE `user_note`
  MODIFY `user_note_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT для таблиці `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `link`
--
ALTER TABLE `link`
ADD CONSTRAINT `FK_H_NOTE_TO_L_NOTE` FOREIGN KEY (`lower_note_id`) REFERENCES `note` (`note_id`),
ADD CONSTRAINT `FK_L_NOTE_TO_H_NOTE` FOREIGN KEY (`higher_note_id`) REFERENCES `note` (`note_id`);

--
-- Обмеження зовнішнього ключа таблиці `note`
--
ALTER TABLE `note`
ADD CONSTRAINT `FK_105lhx05vyp824xw6jbfsccuf` FOREIGN KEY (`note_type_id`) REFERENCES `note_type` (`note_type_id`);

--
-- Обмеження зовнішнього ключа таблиці `user_note`
--
ALTER TABLE `user_note`
ADD CONSTRAINT `FK_5pfoiqjauemr1g3kagl2xs66y` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
ADD CONSTRAINT `FK_k9jhcyiij1mhd3p2l63fon34a` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`);

--
-- Обмеження зовнішнього ключа таблиці `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `FK_9ry105icat2dux14oyixybw9l` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
