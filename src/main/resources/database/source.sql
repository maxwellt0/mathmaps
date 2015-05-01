-- MySQL dump 10.13  Distrib 5.6.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mathmaps
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `higher_note_id` int(11) NOT NULL,
  `lower_note_id` int(11) NOT NULL,
  PRIMARY KEY (`lower_note_id`,`higher_note_id`),
  KEY `FK_H_NOTE_TO_L_NOTE` (`lower_note_id`),
  KEY `FK_L_NOTE_TO_H_NOTE` (`higher_note_id`),
  CONSTRAINT `FK_H_NOTE_TO_L_NOTE` FOREIGN KEY (`lower_note_id`) REFERENCES `note` (`note_id`),
  CONSTRAINT `FK_L_NOTE_TO_H_NOTE` FOREIGN KEY (`higher_note_id`) REFERENCES `note` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (75,43),(52,75),(58,75),(59,75),(63,75);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `publishing_status` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `text` varchar(10000) NOT NULL,
  `note_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_105lhx05vyp824xw6jbfsccuf` (`note_type_id`),
  CONSTRAINT `FK_105lhx05vyp824xw6jbfsccuf` FOREIGN KEY (`note_type_id`) REFERENCES `note_type` (`note_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (4,'Означення метрики',0,NULL,'dfasdsadasd',1),(6,'terorem2sadf',0,NULL,'sadfasdfasdfasdf',1),(7,'adfasdasd',3,NULL,'{\\largeІндуктивна топологія.}\\\\\r\nНехай $(X,\\tau_{x})$---топологічни просторі, $Y$--деяка множина, $\\{F_{\\alpha}\\}$ сім\'я відображень $F_{\\alpha}:X\\rightarrow X$. Визначимо топологію на $X$, так щоб всі  $F_{\\alpha}$ були неперервними.',1),(11,'saegtdg',2,NULL,'sdfgstrhsdfgaf',1),(15,'Топологія',2,NULL,'впкіукпукпвкпівкп',1),(19,'фівафівафі',0,NULL,'вафівафіва',1),(20,'фівафівафі',0,NULL,'вафівафіваіва',1),(32,'Топологія',0,NULL,'\\newcommand{definitio}{Означення}[section]\r\n\\begin{definitio}\r\nНехай $X$ --- непорожня. Сім\'я підмножин \\tau в $X$ називається топологією, якщо:\r\n$	1. \\oslash \\in \\tau;\r\n	2. x \\in \\tau;\r\n	3. \\forall U,V \\in \\tau, U\\cap V \\in \\tau;\r\n	4. Якщо сім\'я U_\\alpha\\in\\tau;\r\n$\r\n\\end{definitio}',1),(35,'Топологія',0,0,'Нехай $X - $ непорожня. Сім\'я підмножин $\\tau$ в $X$ називається топологією, якщо:<br>\r\n1. $\\oslash \\in \\tau;$ <br>\r\n2. $ x \\in \\tau;$ <br>\r\n3. $\\forall U, V \\in \\tau, U \\cap V \\in \\tau $; <br>\r\n4. Якщо сім\'я $U_\\alpha\\in\\tau$; <br>\r\n\r\n',1),(37,'Топологія',0,NULL,'Нехай $X --- $ непорожня. Сім\'я підмножин $\\tau$ в $X$ називається топологією, якщо:\r\n$\r\n\\begin{enumerate}\r\n\\item \\oslash \\in \\tau;\r\n\\item x \\in \\tau;\r\n\\item \\forall U,V \\in \\tau, U\\cap V \\in \\tau;\r\n\\item Якщо сім\'я U_\\alpha\\in\\tau;\r\n$\r\n',1),(38,'Неперервне відображення',0,0,'Нехай $(X,\\tau_{x})$, $(X,\\tau_{y}) -$ топологічні простори.\r\n$F:X\\rightarrow X$--- відображення. <br>\r\n$F$ називається неперервним в точці $x_0\\in X$, якщо для будь-якого околу $\\;V\\;$ точки $f(x_0)\\in X$ існує окіл $U$ точки $x_0\\in X$ такий, що: $F(U)\\subset V$ тобто $\\forall x\\in U, F(X)\\in V$.',1),(39,'Гомеоморфізм',0,NULL,'Відображення $F$ між топологічними просторами $X$ та $Y$ називається ${\\it гомеоморфізмом} $, якщо:<br>\r\n1. $F - $ бієктивне;<br>\r\n2. $F - $ неперевне;<br>\r\n3. $F^{-1} - $ неперервне.',1),(40,'Про неперервність відображення',0,NULL,'Відображення $F:X\\rightarrow X$ буде неперевне в кожній точці $x_0\\in X$ тоді і тільки тоді, коли прообраз кожної відкритої множини з $Y$ буде відкритою множиною в $X$.<br>\r\nТобто $\\forall\\;V\\in\\tau_x, F_{-1}(V)=\\{x\\in~X|F(x)\\in~V\\}~\\in~\\tau_x$',4),(41,'Індуктивна топологія',0,NULL,'Нехай $(X,\\tau_{x})$---топологічни просторі, $Y$--деяка множина, $\\{F_{\\alpha}\\}$ сім\'я відображень $F_{\\alpha}:X\\rightarrow X$. Визначимо топологію на $X$, так щоб всі  $F_{\\alpha}$ були неперервними.\r\nНайсильніша топологія на $X$ така, що всі $F_{\\alpha}$  будуть неперервними називається ${\\itіндуктивною} $ топологією, породженою сім\'єю $\\{F_{\\alpha}\\}$. Ця топологія породжена передбазою $F_{\\alpha}(U),U\\in\\tau_x$.',1),(42,'Проективна топологія',0,NULL,'Нехай $X$---множина,$(X,\\tau_{y})$---топологічний простір.\r\n$F_{\\alpha}:X\\rightarrow X$---сім\'я відображень. Визначимо топологію на $X$, так що всі $F_{\\alpha}$ були неперервними.\r\nНайслабша топологія на $X$ для якої всі $F_{\\alpha}$ будуть неперервними називається  {\\itпроективною} топологією породженою $\\{F_{\\alpha}\\}$. Ця топологія задається передбазою $F_{\\alpha}^{-1}(V), V\\in\\tau_y$',1),(43,'Метрика',0,NULL,'Нехай $X - $ непорожня множина. Функція $d:X\\times X\\rightarrow R$ називається метрикою на $X$, якщо:<br>\r\n1. $d(x,y)\\geq0\\quad\\quad\\quad\\quad\\quad\\quad\\forall x,y\\in X$;<br>\r\n2. $d(x,y)=0\\quad\\quad\\quad<=>\\quad\\quad x=y$;<br>\r\n3. $d(x,y)=d(y,x)\\quad\\quad\\quad\\quad\\quad\\forall x,y\\in X$;<br>\r\n4. $d(x,y)\\leq d(x,z)+d(z,y)\\quad\\forall x,y,z\\in~X$.<br>',1),(44,'Відкрита куля',0,NULL,'Відкритою кулею в метричному просторі $(X,d)$ з центром в точці $x_0$ радіуса $r$ називається множина\r\n$$B_r(x_0)=\\{x\\in X|d(x,x_0)<r\\}$$',1),(45,'Замкнена куля',0,NULL,'Замкненою кулею в метричному просторі $(X,d)$ з центром в точці $x_0$ радіуса $r$ називається множина\r\n$$B_r(x_0)=\\{x\\in X|d(x,x_0)\\leq r\\}$$',1),(46,'Асоціативна топологія',0,NULL,'Топологія породжена передбазою відкритих куль називається {\\itасоціативною} з метрикою $d$',1),(47,'Гаусдорфовий простір',0,NULL,'Кожен метричний простір є гаусдорфовим.',4),(48,'Простір з дискретною метрикою',0,NULL,'Дискретна метрика. $X$---простір, $\\forall x,y\\in X$\r\n\\[\r\n\\begin{equation*}\r\nd(x,y)=\\begin{cases}\r\n-1,   & x\\neq y,\\\\\r\n 0,	& x=y\\\\\r\n\\end{cases}\r\n\\end{equation*}\r\n\\]',5),(49,'Приклад метр простору',0,NULL,'$R^n\\ni x,\\quad x=(x_1,x_2,\\ldots,x_n),\\quad x_k\\in R\\\\$\r\n$$d_2(x,y)=\\sqrt{\\sum_{k=1}^n{(x_k-y_k)^2}}$$\r\n$(R^n,d_2)$',5),(50,'Приклад метр простору №2',0,NULL,'$(R^n,d_p)$,$1\\leq p< \\infty$\r\n$$d_p(x,y)=\\left({\\sum_{k=1}^n{|x_k-y_k|^p}}\\right)^{\\frac{1}{p}}$$',1),(51,'Приклад метр простору №3',0,NULL,'$(R^n,d_{\\infty})$\r\n$$d_{\\infty}(x,y)=\\max|x_k-y_k|$$',5),(52,'Приклад метр простору №4',0,NULL,'$l_p, 1\\leq p<\\infty$ простір послідовностей(або векторів з нескінченою кількістю координати)\\\\\r\n$x(x_1,x_2,\\ldots,x_n,\\ldots)$, таких що ряд\r\n$\\sum\\limits_{k=1}^{\\infty}{|x|^p}<\\infty({\\text ряд збіжний})$\\\\\r\n$$d_p(x,y)=\\left({\\sum_{k=1}^n{|x_k-y_k|^p}}\\right)^{\\frac{1}{p}}$$',1),(53,'Приклад метр простору №5',0,NULL,'$l_{\\infty}$, $x\\in l_{\\infty}$, $x=(x_1,x_2,\\dots,x_n,\\ldots)$\\\\\r\n$\\sup|x_k|<\\infty$\\\\\r\n$$d_{\\infty}(x,y)=\\sup_{k}|x_k-y_k|$$',5),(54,'Приклад метр простору №6',0,NULL,'$C_0$---простір всіх збіжних до нуля послідовностей з метрикою\\;$d_{\\infty}$',5),(55,'Приклад метр простору №8',0,NULL,'$C$---простір всіх збіжних послідовностей з метрикою\\;~$d_{\\infty}$',1),(56,'Приклад метр простору №9',0,NULL,'$C[a,b]$---простір неперервних функцій на $[a,b]$\\\\\r\n$x(t)\\in C[a,b], t\\in[a,b]$\r\n$$d(x(t),y(t))=\\sup_{t\\in[a,b]}|x(t)-y(t)|\\makebox[6cm]{---метрика рівномірної збіжності}$$',1),(57,'Приклад метр простору №7',0,NULL,'$P[a,b]$---простір всіх многочленів від $t\\in[a,b]$ з метрикою рівномірної збіжності.',1),(58,'Приклад метр простору №10',0,NULL,'$L_p[a,b]$--- множина класів еквівалентності інтегрованих в степені $p$ функцій за Лебегом на [a,b], де $1\\leq p<\\infty$\\\\\r\nТобто $f\\sim g$ якщо $f$ і $g$ відрізняються на множині міри $0$.\\\\\r\n$x(t)\\in L_p[a,b]$ якщо $\\int\\limits_{[a,b]}|f(t)|^pd\\mu$ існує\r\n$$d_p(x,y)=\\left(\\int\\limits_{[a,b]}|x(t)-y(t)|^p\\right)^{\\frac{1}{p}}$$',1),(59,'Приклад метр простору №11',0,NULL,'$L_p[a,b]$\\\\\r\nСуттєвий супремум інтегрованої за Лебегом функції $x(t)$ називається\\\\\r\n$$\\inf_{zez}\\sup_{t\\in[a,b]}|z(t)|=ess\\sup_{t\\in[a,b]}|x(t)-y(t)|$$\r\n$L_p[a,b]$---простір інтегрованих обмежених функцій(класів еквівалентності)\r\n$$d_{\\infty}(x,y)=ess\\sup_{t\\in[a,b]}|x(t)-y(t)|$$',1),(60,'Підпростір метричного простору',0,NULL,'Нехай $(X,d)$---метричний простір. Тоді метричний простір~$(X_0,d_0)$ називається підпростором $(X,d)$, якщо:\\\\\r\n1. $X_0\\subset X$\\\\\r\n2. $\\forall x,y\\in X_0,\\quad d_0(x,y)=d(x,y)$',1),(61,'Ізометрична ізоморфність просторів',0,NULL,'Метричний простір $(X,d_x)$ називається {\\itізометрично ізоморфним простором} $(X,d_y)$, якщо існує  бієктивне відображення: $F:X\\rightarrow X$, що зберігає метрику\r\n$$d_x(x_1,x_2)=d_y(F(x_1),F(x_2))\\quad\\quad\\quad \\forall x_1,x_2\\in X$$\r\n$F$ називається {\\itізометричним ізоморфізмом}.',1),(62,'Фундаментальна послідовність',0,NULL,'Нехай $(X,d)$---метричний простір\\\\\r\nПослідовність $\\{x_n\\}\\subset X$ називається {\\itфундаментальною}, якщо\r\n$\\forall \\epsilon>0, \\exists n_0\\in N$ що $\\forall m,n>n_0$\\\\\r\n$d(x_n,x_m)<\\epsilon$ ',1),(63,'Повний метричний простір',0,NULL,'Метричний простір $X$ називається {\\itповним}, якщо кожна фундаментальна послідовність в $X$ має границю в $X$\\\\',1),(64,'Фундаментальна послідовність',0,NULL,'Кожна збіжна послідовність є, очевидно, фундаментальною. Навпаки невірно.\\\\',6),(65,'Приклад неповного простору № 1',0,NULL,'Нехай $X_0\\subset X$---підпростір, але $X_0$---незамкнена підмножина в $X$',1),(66,'Приклад неповного простору № 2',0,NULL,'$P[a,b]$---простір многочленів на $[a,b]$\\\\\r\nЗа теоремою Вейєрштрасса про те, що кожна неперервна функція наближена многочленами рівносильно на  $[a,b]$.',1),(67,'Приклад неповного простору № 3',0,NULL,'$C_{00}$---простір фінітних послідовностей. \\\\$x\\in C_{00}$\\\\\r\n$x=(\\p{x},0,0,\\ldots)$\\\\',1),(68,'Поповнення простору',0,NULL,'Нехай $(X,d_x)$---метричний простір. Метричний простір $(Y,d_y)$ називається {\\itпоповненням простору} $(X,d_x)$ якщо:\r\n1. $\\exists I:X\\rightarrow Y$ ізометричне вкладення;\r\n2. $X$ є всюди щільним в $Y$;\r\n3. $(Y,d_y)$---повний.',1),(69,'Всюди щільна підмножина',0,NULL,'Нагадаємо, що підмножина $A$ топологічного простору $X$ є {\\bfщільною} підмножині $B$, якщо замикання $A$ містить $B$\\\\\r\n$\\overline{A}\\supset B$\\\\\r\n$A$ називається {\\bfвсюди щільною} підмножиною, якщо $\\overline{A}= X$.\\\\\r\n$A$ всюди щільна підмножина, тоді і тільки тоді, коли:\\\\\r\n$\\forall U,\\quad U\\subset X,\\quad \\exists x_0\\in A, \\mbox{що}\\quad x_0\\in U$.',1),(70,'Нерухома точка',0,NULL,'Нехай $(X,d)$---метричний простір. $F:X\\rightarrow X$.\\\\\r\nСкажемо, що $x_0\\in X$ є {\\bfнерухомою точкою} відображення $F$, якщо $F(x_0)=~x_0$\r\n\\end{definition}\r\n\\begin{definition}\r\nВідображення $F:X\\rightarrow X$ називається {\\bfстикуючим(стисним)}, якщо $\\exists\\lambda, 0\\leq\\lambda<1,\\quad\\mbox{що}\\;\r\n\\forall x,y\\in X$\\\\\r\n$$d(F(x),F(y))\\leq\\lambda d(x,y)$$',1),(71,'Компактний простір',0,NULL,'Топологічний простір $X$ називаєтся {\\bfкомпактним}, якщо з будь--якого відкритого покриття $\\{U_{\\alpha}\\}$ цього простору можна вибрати скінчення підпокриття $U_{\\alpha1},\\ldots,U_{\\alpha1}$ ',1),(72,'Відкрите покриття простору',0,NULL,'Відкритим покриттям простору $X$ називається сім\'я відкритих множин $\\{U_{\\alpha}\\}$, що $\\cup_{\\alpha}U_{\\alpha}\\supset X$. Підпокриття це підмножина в $\\{U_{\\alpha}\\}$, яка також є покриттям.',1),(73,'Компактний метричний простір',0,NULL,'Компактний метричний простір $X$ є повним.',4),(74,'Приклад компактного простору',0,NULL,'$X=S(l_2)=\\{x\\in l_2|d_2(x,0)=1\\}$\\\\\r\n$0=(0,0,\\ldots,0,\\ldots)$\\\\\r\n$(\\p{x},\\ldots)$\\\\\r\n$d(x,0)=\\left(\\sum\\limits_{n=1}^{\\infty}x_n^2\\right)=1$ --- одинична сфера\\\\\r\n$(S,d_2)\\subset l_2$\\\\\r\n$(S,d_2)$---повний метричний простір як замкнена множина в повному просторі $l_2$\\\\\r\n$(S,d_2)$---обмежений, бо $d(x,y)\\leq2, x,y\\in S$\\\\\r\nРозглянемо таку послідовність $e_n=(0,0,\\ldots,\\parbox[t]{4pt}{1 \\uparrow n},0,\\ldots)$\\\\\r\n$n\\neq m$\\\\\r\n$d(e_n,e_m)=\\sqrt{1^2+1^2}=\\sqrt{2}$\\\\\r\nРозглянемо таке покриття $S$, яке складається з двох куль радіуса $\\frac{\\sqrt{2}}{4}$ з центром в кожній точці. В одну з цих куль може попасти тільки один елемент нашої послідовності. Тому, якщо існує скінчення покриття, то воно накриває тільки скінченну кількість $\\{e_n\\}$, а тому такого покриття не існує.',1),(75,'Метричний простір',0,NULL,'укфпуікпукпуп',1);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_type`
--

DROP TABLE IF EXISTS `note_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_type` (
  `note_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  PRIMARY KEY (`note_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_type`
--

LOCK TABLES `note_type` WRITE;
/*!40000 ALTER TABLE `note_type` DISABLE KEYS */;
INSERT INTO `note_type` VALUES (1,'Означення'),(2,'Задача'),(3,'Теорема'),(4,'Твердження'),(5,'Приклад'),(6,'Зауваження');
/*!40000 ALTER TABLE `note_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `email` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('itsme','eladelmv@gmail.com',1,'letmein'),('Maxwellt','maksimvinnik@gmail.com',1,'111111');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_note`
--

DROP TABLE IF EXISTS `user_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_note` (
  `user_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`user_note_id`),
  KEY `FK_k9jhcyiij1mhd3p2l63fon34a` (`note_id`),
  KEY `FK_5pfoiqjauemr1g3kagl2xs66y` (`username`),
  CONSTRAINT `FK_5pfoiqjauemr1g3kagl2xs66y` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_k9jhcyiij1mhd3p2l63fon34a` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_note`
--

LOCK TABLES `user_note` WRITE;
/*!40000 ALTER TABLE `user_note` DISABLE KEYS */;
INSERT INTO `user_note` VALUES (3,1,6,'itsme'),(28,1,35,'Maxwellt'),(30,1,38,'Maxwellt'),(31,1,39,'Maxwellt'),(32,1,40,'Maxwellt'),(33,1,41,'Maxwellt'),(34,1,42,'Maxwellt'),(35,1,43,'Maxwellt'),(36,1,44,'Maxwellt'),(37,1,45,'Maxwellt'),(38,1,46,'Maxwellt'),(39,1,47,'Maxwellt'),(40,1,48,'Maxwellt'),(41,1,49,'Maxwellt'),(42,1,50,'Maxwellt'),(43,1,51,'Maxwellt'),(44,1,52,'Maxwellt'),(45,1,53,'Maxwellt'),(46,1,54,'Maxwellt'),(47,1,55,'Maxwellt'),(48,1,56,'Maxwellt'),(49,1,57,'Maxwellt'),(50,1,58,'Maxwellt'),(51,1,59,'Maxwellt'),(52,1,60,'Maxwellt'),(53,1,61,'Maxwellt'),(54,1,62,'Maxwellt'),(55,1,63,'Maxwellt'),(56,1,64,'Maxwellt'),(57,1,65,'Maxwellt'),(58,1,66,'Maxwellt'),(59,1,67,'Maxwellt'),(60,1,68,'Maxwellt'),(61,1,69,'Maxwellt'),(62,1,70,'Maxwellt'),(63,1,71,'Maxwellt'),(64,1,72,'Maxwellt'),(65,1,73,'Maxwellt'),(66,1,74,'Maxwellt'),(67,1,75,'Maxwellt');
/*!40000 ALTER TABLE `user_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK_9ry105icat2dux14oyixybw9l` (`username`),
  CONSTRAINT `FK_9ry105icat2dux14oyixybw9l` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'ROLE_USER','Maxwellt'),(2,'ROLE_USER','itsme'),(3,'ROLE_ADMIN','itsme');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-01 18:03:27
