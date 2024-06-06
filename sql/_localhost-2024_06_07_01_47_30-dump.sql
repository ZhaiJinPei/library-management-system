-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pp0alm
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin`
(
    `email`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `passwrd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`email`) USING BTREE,
    CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin`
    DISABLE KEYS */;
INSERT INTO `admin`
VALUES ('515444544@qq.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('admin02@libman.com', '2afd1f5fb6be7e4a839475fcdfae90cc'),
       ('azelaya@yahoo.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('dvbkkkk3232@gmail.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('fblorg@outlook.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('gbf552@gmail.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('jamesborg@gmail.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('jande8654@outlook.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('jasonliu88@libman.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('jbs123@gmail.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('jen2687@gmail.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('jwallace2598@outlook.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('kojitadokoro@gmail.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('linsmith@gmail.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('mlas028@libman.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('spacestarfish@outlook.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('wf2887@outlook.com', 'd4e01a749610b02ce7d27366a4008bfa'),
       ('yoshida124@yahoo.com', 'd4e01a749610b02ce7d27366a4008bfa');
/*!40000 ALTER TABLE `admin`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book`
(
    `isbn`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `name`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `category`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `description`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `publish_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `author`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `publisher`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `cDate`        datetime                                                      DEFAULT CURRENT_TIMESTAMP,
    `uDate`        datetime                                                      DEFAULT NULL,
    `cover`        varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `credit`       int                                                           DEFAULT NULL,
    `number`       int                                                           DEFAULT '0',
    PRIMARY KEY (`isbn`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book`
    DISABLE KEYS */;
INSERT INTO `book`
VALUES ('0128203315', 'Computer Organization and Design RISC-V Edition: The Hardware Software Interface',
        'Science > Computer Science',
        'Computer Organization and Design RISC-V Edition: The Hardware Software Interface, Second Edition, the award-winning textbook from Patterson and Hennessy that is used by more than 40,000 students per year, continues to present the most comprehensive and readable introduction to this core computer science topic. ',
        '2020-12-31', 'David A. Patterson', 'Morgan Kaufmann', '2023-01-03 23:54:53', '2023-01-05 21:41:25',
        'http://127.0.0.1:9000/pp0alm-img/COAADRE.png', 10, 20),
       ('0131103628', 'C Programming Langeage', 'Science > Computer Science',
        'Written by the developers of C, this new version helps readers keep up with the finalized ANSI standard for C while showing how to take advantage of C\'s rich set of operators, economy of expression, improved control flow, and data structures.',
        '1988-03-22', 'Brian W. Kernighan', 'Pearson', '2023-01-03 16:18:14', '2023-01-05 21:41:22',
        'https://m.media-amazon.com/images/I/411ejyE8obL._SX377_BO1,204,203,200_.jpg', 10, 20),
       ('0133970779', 'Fundamentals of Database Systems', 'Science > Computer Science',
        'This book introduces the fundamental concepts necessary for designing, using, and implementing database systems and database applications. Our presentation stresses the fundamentals of database modeling and design, the languages and models provided by the database management systems, and database system implementation techniques.',
        '2015-06-08', 'Ramez Elmasri', 'Pearson', '2023-01-03 16:06:46', '2023-01-04 18:02:18',
        'https://m.media-amazon.com/images/I/51IBmkQUFuL._SX400_BO1,204,203,200_.jpg', 15, 20),
       ('1721801286',
        'Roman History: A Captivating Guide to Ancient Rome, Including the Roman Republic, the Roman Empire and the Byzantium',
        'History > European History',
        'A Captivating Guide to Ancient Rome, Including the Roman Republic, the Roman Empire and the Byzantium',
        '2018-06-22', 'Captivating History', 'CreateSpace Independent Publishing Platform', '2023-01-06 15:57:45',
        '2023-01-06 15:59:16', 'https://m.media-amazon.com/images/I/51f2iRPAUKL._SX398_BO1,204,203,200_.jpg', 20, 20),
       ('1791929729',
        'Ottoman Empire: A Captivating Guide to the Rise and Fall of the Ottoman Empire, The Fall of Constantinople, and the Life of Suleiman the Magnificent',
        'History > European History',
        'A Captivating Guide to the Rise and Fall of the Ottoman Empire, The Fall of Constantinople, and the Life of Suleiman the Magnificent',
        '2018-12-18', 'Captivating History', 'Independently published', '2023-01-06 16:03:26', '2024-06-05 23:45:06',
        'https://m.media-amazon.com/images/I/514CSKI-PKL._SX398_BO1,204,203,200_.jpg', 15, 20),
       ('7020002207', '红楼梦', 'Litearture > Chinese Literature',
        '《红楼梦》是一部百科全书式的长篇小说。以宝黛爱情悲剧为主线，以四大家族的荣辱兴衰为背景，描绘出18世纪中国封建社会的方方面面，以及封建专制下新兴资本主义民主思想的萌动。结构宏大、情节委婉、细节精致，人物形象栩栩如生，声口毕现，堪称中国古代小说中的经典.由红楼梦研究所校注、人民文学出版社出版的《红楼梦》以庚辰（1760）本《脂砚斋重评石头记》为底本，以甲戌（1754）本、已卯（1759）本、蒙古王府本、戚蓼生序本、舒元炜序本、郑振铎藏本、红楼梦稿本、列宁格勒藏本（俄藏本）、程甲本、程乙本等众多版本为参校本，是一个博采众长、非常适合大众阅读的本子；同时，对底本的重要修改，皆出校记，读者可因以了解《红楼梦》的不同版本状况。\n\n',
        '1996-12', '[清] 曹雪芹 著 / 高鹗', '人民文学出版社', '2024-06-05 23:08:20', '2024-06-05 23:08:20',
        'http://127.0.0.1:9000/pp0alm-img/hlm.png', 25, 20),
       ('7020008728', '三国演义（全二册）', 'Litearture > Chinese Literature',
        '《三国演义》又名《三国志演义》、《三国志通俗演义》，是我国小说史上最著名最杰出的长篇章回体历史小说。 《三国演义》的作者是元末明初人罗贯中，由毛纶，毛宗岗父子批改。在其成书前，“三国故事”已经历了数百年的历史发展过程。在唐代，三国故事已广为流传，连儿童都很熟悉。随着市民文艺的发展，宋代的“说话”艺人，已有专门说三国故事的，当时称为“说三分”。元代出现的《三国志平话》，实际上是从说书人使用的本子，虽较简略粗糙，但已初肯《三国演义》的规模。罗贯中在群众传说和民间艺人创作的基础上，又依据陈寿《三国志》及裴松之注中所征引的资料（还包括《世说新语》及注中的资料），经过巨大的创作劳动，写在了规模宏伟的巨著——《三国志通俗演义》全书24卷，240回。后来经过毛纶，毛宗岗父子批改，形成我们现在所见的《三国演义》120回版',
        '1998-05', '[明] 罗贯中', '人民文学出版社', '2024-06-06 02:44:21', '2024-06-06 02:44:23',
        'http://127.0.0.1:9000/pp0alm-img/sgyy.jpg', 50, 500),
       ('7108006721', '天龙八部', 'Litearture > Chinese Literature',
        '天龙八部乃金笔下的一部长篇小说，与《射雕》，《神雕》等 几部长篇小说一起被称为可读性最高的金庸小说。《天龙》的故事情节曲折，内容丰富，也曾多次被改编为电视作品。是金庸作品中集大成的一部。故事以北宋末年动荡的社会环境为背景，展开波澜壮阔的历史画卷，塑造了乔峰、段誉、 虚竹、慕容复等形象鲜明的人物，成为武侠史上的经典之作。故事精彩纷呈，人物命运悲壮多变，是可读性很强的作品，具有震撼人心的力量',
        '2024-06-06', '金庸', ' 生活·读书·新知三联书店', '2024-06-05 20:03:40', NULL,
        'http://127.0.0.1:9000/pp0alm-img/tlbb.jpg', 66, 65),
       ('7108041531', '邓小平时代', 'Biography',
        '邓小平深刻影响了中国历史和世界历史的走向，也改变了每一个当代中国人的命运。解读邓小平的政治生涯及其行为逻辑，就是解读当代中国，解读个人命运背后的历史变局。\n\n哈佛大学傅高义教授倾十年心力完成的巨著《邓小平时代》，是对邓小平跌宕起伏的一生以及中国惊险崎岖的改革开放之路的全景式描述。作者以丰富的史料、国内外重要的研究成果、档案资料和为数众多的独家访谈为基础，对邓小平个人性格及执政风格进行了深层分析，并对中国改革开放史进行了完整而独到的阐释。全书人物、事件众多，既有对毛泽东、周恩来、邓小平、陈云等人相互关系的细致解读，又有对三中全会、权力过渡、中美建交、政改试水、经济特区、一国两制、九二南巡等重大事件和决策的深入分析。全书持论严谨、脉络清晰、观点鲜明、叙述生动，力图使人物言行符合历史情境，对改革开放的历史进程亦时有独特看法，引人深思，被誉为邓小平研究“纪念碑...',
        '2024-06-06', '【美】傅高义 (Ezra.F.Vogel)', '生活·读书·新知三联书店', '2024-06-05 22:52:55', NULL,
        'http://127.0.0.1:9000/pp0alm-img/dxpsd.jpg', 20, 20),
       ('7229042066', '三体全集', 'Litearture > Chinese Literature',
        '《地球往事·三体》\n\n文化大革命如火如荼进行的同时，军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。\n\n地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\n\n四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时，他们接收到了地球发来的信息。\n\n在运用超技术锁死地球人的基础科学之后，三体人庞大的宇宙舰队开始向地球进发……人类的末日悄然来临。\n\n《地球往事·黑暗森林》\n\n三体人在利用魔法般的科技锁死了地球人的科学之后，庞大的宇宙舰队杀气腾腾地直扑太阳系，意欲清除地球文明。\n\n面对前所未有的危局，经历过无数磨难的地球人组建起同样庞大的太空舰队，同时，利用三体人思维透明的致命缺陷，制订了神秘莫测的“面壁计划”，精选出四位“面壁者”。秘密展开对三体人的反击。\n\n三体人自身虽然无法识破人类的诡谲计谋，却依靠由地球人中的背叛者挑选出的“破壁人”，与“面壁者”展开智慧博弈……\n',
        '2012-01', '刘慈欣', '重庆出版社', '2024-06-06 02:34:56', '2024-06-06 02:35:12',
        'http://127.0.0.1:9000/pp0alm-img/stqj.jpg', 90, 600),
       ('7506365437', '活着', 'Litearture > Chinese Literature',
        '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。',
        '2012-08', '余华', '作家出版社', '2024-06-06 02:24:34', '2024-06-06 02:24:21',
        'http://127.0.0.1:9000/pp0alm-img/hz.jpg', 100, 100),
       ('7530210291', '1984', 'Litearture > Foreign Literature',
        '★村上春树以《1Q84》向本书致敬\n\n★著名学者刘绍铭经典译本内地首次出版\n\n★62种文字风靡110个国家，全球销量超过5000万册\n\n★《时代周刊》“最好的100本英语小说”\n\n★兰登书屋“100本20世纪最佳英语小说”\n\n★入选英美中学生必读书书目\n\n1936年以来，我所写的每 一部严肃作品，都是直接或间接地反对极权主义，支持我所理解的民主社会主义。 ——乔治•奥威尔（《我为何写作》）\n\n《1984》是一部杰出的政治寓言小说，也是一部幻想小说。作品刻画了人类在极权主义社会的生存状态，有若一个永不褪色的警示标签，警醒世人提防这种预想中的黑暗成为现实。历经几十年，其生命力益显强大，被誉为20世纪影响最为深远的文学经典之一。',
        '2010-04-01', '[英] 乔治·奥威尔', '北京十月文艺出版社', '2024-06-06 02:30:45', '2024-06-06 02:30:47',
        'http://127.0.0.1:9000/pp0alm-img/1984.jpg', 10, 21),
       ('7544253994', '百年孤独', 'Litearture > Foreign Literature',
        '《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。作品融入神话传说、民间故事、宗教典故等神秘因素，巧妙地糅合了现实与虚幻，展现出一个瑰丽的想象世界，成为20世纪最重要的经典文学巨著之一。1982年加西亚•马尔克斯获得诺贝尔文学奖，奠定世界级文学大师的地位，很大程度上乃是凭借《百年孤独》的巨大影响。',
        '2011-06', '[哥伦比亚] 加西亚·马尔克斯', '南海出版公司', '2024-06-06 02:39:39', '2024-06-06 02:39:41',
        'http://127.0.0.1:9000/pp0alm-img/bngd.jpg', 21, 33),
       ('7544258609', '白夜行', 'Litearture > Foreign Literature',
        '东野圭吾万千书迷心中的无冕之王\n\n周刊文春推理小说年度BEST10第1名\n\n本格推理小说年度BEST10第2名\n\n《白夜行》是东野圭吾迄今口碑最好的长篇杰作，具备经典名著的一切要素：\n\n一宗离奇命案牵出跨度近20年步步惊心的故事：悲凉的爱情、吊诡的命运、令人发指的犯罪、复杂人性的对决与救赎……',
        '2013-01-01', '[日] 东野圭吾', '南海出版公司', '2024-06-06 03:14:21', '2024-06-06 03:14:23',
        'http://127.0.0.1:9000/pp0alm-img/byx.jpg', 30, 29),
       ('7572254758', '芯片简史', 'Science > Computer Science',
        '一本聚焦热门话题、热门行业的实力之作，完整呈现芯片发明和发展的60多年历程。\n\n全书完整呈现了芯片发明与发展的历程，从支撑芯片产业发展的量子力学讲起，逐渐发展到半导体物理学，进而催生了半导体器件，这些器件又由简到繁，像一颗发芽的种子，演化出了双ji型晶体管、MOS场效晶体管、光电二ji管等，并由此集成构造出了模拟芯片（通信和传感器芯片等）、数字芯片（CPU、存储器、FPGA等）和光电芯片等。蕞后，本书还展示了芯片设计方法和制造方法由手工到自动的发展过程，并指出了芯片未来面对的挑战和可能的解决路径。可以说，了解芯片，有这一本书就够了。\n\n芯片的发展史，就是一部创新史与叛逆史——详细讲述一群叛逆者突破传统、不断创新的故事。\n\n作者以芯片诞生和发展为主线，将散落在世界各地的实验室、杂志、书籍或新闻报道的庞杂信息重新组织、编排，在力求准确、科学的前提下，写作了这样...',
        '2024-06-07', '汪波', '浙江教育出版社', '2024-06-06 11:03:35', '2024-06-06 11:03:56',
        'http://127.0.0.1:9000/jpg/1717670134883xpjs.jpg', 11, 10);
/*!40000 ALTER TABLE `book`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow`
(
    `isbn`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `email`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `id`           int                                                           NOT NULL DEFAULT '1',
    `cDate`        datetime                                                               DEFAULT CURRENT_TIMESTAMP,
    `bstatus`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL,
    `duration`     int                                                                    DEFAULT '1',
    `rDate`        datetime                                                               DEFAULT NULL,
    `notification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL,
    PRIMARY KEY (`isbn`, `email`, `id`) USING BTREE,
    KEY `borrow_ibfk_2` (`email`) USING BTREE,
    CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow`
    DISABLE KEYS */;
INSERT INTO `borrow`
VALUES ('0128203315', 'azelaya@yahoo.com', 1, '2023-01-05 23:12:22', 'Returned', 1, '2023-01-06 23:12:22',
        'before due'),
       ('0128203315', 'azelaya@yahoo.com', 2, '2023-01-06 00:02:04', 'Returned', 5, '2023-01-11 00:02:04',
        'before due'),
       ('0128203315', 'azelaya@yahoo.com', 3, '2023-01-06 00:03:20', 'Returned', 5, '2023-01-11 00:03:20',
        'before due'),
       ('0128203315', 'fblorg@outlook.com', 1, '2023-01-05 23:07:41', 'Returned', 1, '2023-01-06 23:07:41',
        'before due'),
       ('0128203315', 'jbs123@gmail.com', 1, '2023-01-06 00:09:35', 'Borrowed', 1, '2023-01-07 00:09:35', 'past due'),
       ('0128203315', 'spacestarfish@outlook.com', 1, '2023-01-06 00:45:22', 'Returned', 5, '2023-01-11 00:45:22',
        'before due'),
       ('0128203315', 'yoshida124@yahoo.com', 1, '2023-01-07 11:02:17', 'Returned', 5, '2023-01-12 11:02:17',
        'past due'),
       ('0131103628', 'fblorg@outlook.com', 1, '2023-01-05 23:56:17', 'Returned', 3, '2023-01-08 23:56:17',
        'before due'),
       ('0131103628', 'jande8654@outlook.com', 1, '2023-01-06 00:39:41', 'Returned', 1, '2023-01-07 00:39:41',
        'before due'),
       ('0131103628', 'jen2687@gmail.com', 1, '2023-01-05 23:56:28', 'Returned', 5, '2023-01-10 23:56:28',
        'before due'),
       ('0131103628', 'jen2687@gmail.com', 2, '2023-01-06 00:09:03', 'Borrowed', 5, '2023-01-11 00:09:03', 'past due'),
       ('0131103628', 'jen2687@gmail.com', 3, '2023-01-06 15:33:17', 'Borrowed', 1, '2023-01-07 15:33:17', 'past due'),
       ('0131103628', 'jen2687@gmail.com', 4, '2024-05-28 12:58:46', 'Borrowed', 2, '2024-05-30 12:58:46', 'past due'),
       ('0131103628', 'linsmith@gmail.com', 1, '2023-01-05 23:57:22', 'Returned', 1, '2023-01-06 23:57:22',
        'unexpired'),
       ('0131103628', 'linsmith@gmail.com', 2, '2023-01-07 11:01:54', 'Borrowed', 5, '2023-01-12 11:01:54', 'past due'),
       ('0131103628', 'spacestarfish@outlook.com', 1, '2023-01-06 00:43:53', 'Returned', 1, '2023-01-07 00:43:53',
        'before due'),
       ('0131103628', 'wf2887@outlook.com', 1, '2023-01-06 00:49:21', 'Borrowed', 6, '2023-01-12 00:49:21', 'past due'),
       ('0133970779', 'azelaya@yahoo.com', 1, '2023-01-06 11:26:30', 'Returned', 1, '2023-01-07 11:26:30',
        'before due'),
       ('0133970779', 'fblorg@outlook.com', 1, '2023-01-06 00:49:35', 'Returned', 3, '2023-01-09 00:49:35',
        'almost due'),
       ('0133970779', 'fblorg@outlook.com', 2, '2024-05-07 10:57:23', 'Borrowed', 5, '2024-05-12 10:57:23', 'past due'),
       ('0133970779', 'jamesborg@gmail.com', 1, '2023-01-06 00:09:13', 'Borrowed', 3, '2023-01-09 00:09:13',
        'past due'),
       ('0133970779', 'jbs123@gmail.com', 1, '2023-01-05 23:56:38', 'Returned', 1, '2023-01-06 23:56:38', 'before due'),
       ('0133970779', 'jwallace2598@outlook.com', 1, '2023-01-06 00:40:00', 'Borrowed', 1, '2023-01-07 00:40:00',
        'past due'),
       ('1721801286', 'jbs123@gmail.com', 1, '2024-05-07 14:20:23', 'Borrowed', 2, '2024-05-09 14:20:23', 'past due'),
       ('7020002207', 'spacestarfish@outlook.com', 1, '2024-06-06 02:20:13', 'Returned', 1, '2024-06-07 02:20:13',
        'almost due'),
       ('7544258609', 'linsmith@gmail.com', 1, '2024-06-06 09:07:49', 'Borrowed', 2, '2024-06-08 09:07:49',
        'almost due');
/*!40000 ALTER TABLE `borrow`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy`
(
    `bid`      int          NOT NULL AUTO_INCREMENT,
    `isbn`     varchar(255) NOT NULL,
    `email`    varchar(255) NOT NULL,
    `cDate`    datetime     DEFAULT NULL,
    `count`    int          DEFAULT NULL,
    `price`    int          DEFAULT NULL,
    `total`    int          DEFAULT NULL,
    `username` varchar(255) DEFAULT NULL,
    `uid`      varchar(255) DEFAULT NULL,
    `name`     varchar(255) DEFAULT NULL,
    PRIMARY KEY (`bid`, `isbn`, `email`),
    KEY `isbn` (`isbn`),
    KEY `email` (`email`),
    CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE,
    CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy`
    DISABLE KEYS */;
INSERT INTO `buy`
VALUES (4, '0131103628', 'fblorg@outlook.com', '2024-05-07 14:19:09', 4, 2, 8, 'blorggg', '20221224346174758',
        'C Programming Langeage'),
       (5, '0131103628', 'jbs123@gmail.com', '2024-05-07 15:22:05', 2, 1, 2, 'jbs123', '202212241946340529',
        'C Programming Langeage'),
       (6, '7229042066', 'admin02@libman.com', '2024-06-06 02:50:49', 1, 5, 5, 'admin02', '202418881075002951',
        '三体全集');
/*!40000 ALTER TABLE `buy`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category`
(
    `id`     int NOT NULL AUTO_INCREMENT,
    `name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `cDate`  datetime                                                      DEFAULT CURRENT_TIMESTAMP,
    `uDate`  datetime                                                      DEFAULT NULL,
    `pid`    int                                                           DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 34
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category`
    DISABLE KEYS */;
INSERT INTO `category`
VALUES (1, 'History', 'history', '2023-01-02 16:12:23', NULL, NULL),
       (2, 'Science', 'science', '2023-01-02 16:12:45', NULL, NULL),
       (3, 'Book Arts', 'book arts', '2023-01-02 16:12:57', '2024-01-02 18:35:33', NULL),
       (4, 'European History', 'european history', '2023-01-02 16:19:44', NULL, 1),
       (5, 'Asian History', 'asian history', '2023-01-02 16:20:09', NULL, 1),
       (7, 'Education', 'education', '2023-01-02 17:47:34', NULL, NULL),
       (8, 'Technology', 'technology', '2023-01-02 17:54:07', NULL, NULL),
       (9, 'Social Science', 'social science', '2023-01-02 18:13:36', NULL, 2),
       (10, 'Natural Science', 'natural science', '2023-01-02 18:14:41', NULL, 2),
       (11, 'Information Technology', 'information Technology', '2023-01-02 18:42:46', NULL, 8),
       (12, 'Computer Science', 'computer science', '2023-01-03 18:11:35', NULL, 2),
       (15, 'Biotechnology', 'biotechnology', '2023-01-04 17:28:22', NULL, 8),
       (16, 'Chinese Literature', 'chinese literature', '2024-06-05 23:12:11', '2024-06-05 23:12:13', 17),
       (17, 'Litearture', 'literature', '2024-06-05 23:12:52', NULL, NULL),
       (18, 'Foreign Literature', 'foreign literature', '2024-06-05 23:14:03', NULL, 17),
       (19, 'MatheMatics', 'mathematics', '2024-06-05 23:33:42', NULL, 2),
       (20, 'Physics', 'physics', '2024-06-05 23:33:46', NULL, 2),
       (21, 'Chemistry', 'chemistry', '2024-06-05 23:33:47', NULL, 2),
       (22, 'Economics', 'economics', '2024-06-05 23:37:01', NULL, NULL),
       (23, 'Politics', 'politics', '2024-06-05 23:37:28', NULL, NULL),
       (24, 'Philosophy', 'philosophy', '2024-06-05 23:38:05', NULL, NULL),
       (25, 'Law', 'law', '2024-06-05 23:38:55', NULL, NULL),
       (26, 'Psychology', 'psychology', '2024-06-05 23:39:34', NULL, NULL),
       (27, 'Military', 'military', '2024-06-05 23:40:02', NULL, NULL),
       (28, 'Reference Book', 'reference book', '2024-06-05 23:41:33', NULL, NULL),
       (29, 'Arts', 'arts', '2024-06-05 23:42:19', NULL, NULL),
       (30, 'Civil Engineering', 'civil engineering', '2024-06-05 23:43:01', NULL, 31),
       (31, 'Engineering', 'engineering', '2024-06-05 23:43:29', NULL, NULL),
       (32, 'Biography', 'biography', '2024-06-05 23:46:25', NULL, NULL),
       (33, 'Magazine', 'magazine', '2024-06-05 23:47:22', NULL, NULL);
/*!40000 ALTER TABLE `category`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person`
(
    `email`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `fname`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `minit`    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL,
    `lname`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `city`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `street`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `phone`    varchar(11)                                                   NOT NULL,
    `status`   tinyint                                                       DEFAULT '1',
    PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person`
    DISABLE KEYS */;
INSERT INTO `person`
VALUES ('515444544@qq.com', 'Kjvdjsb', 'F', 'Sgsd', 'dvsdb', '江苏', '盐城', '100 Huijin', '13515515150', 1),
       ('admin02@libman.com', 'Jennifer', 'L', 'Smith', 'admin02', 'QC', 'Quebec', '987 Sheild', '4269571397', 1),
       ('azelaya@yahoo.com', 'Alicia', 'J', 'Zelaya', 'azelaya', 'TX', 'Spring', '3221 Castle', '4623587412', 1),
       ('dvbkkkk3232@gmail.com', 'Kaiju', 'L.', 'Nukazoo', 'kaidoo', 'Al', 'Maplesville', '11338 County', '1665656555',
        1),
       ('fblorg@outlook.com', 'Friend', 'C', 'Blorg', 'blorggg', 'ON', 'North York', '867 Skywood', '4236587412', 1),
       ('gbf552@gmail.com', 'ofAmerica', 'vd', 'GodDaddy', 'vdsarr', '江苏省', 'bbbr', 'mrb8', '13511524552', 1),
       ('godj47552@gmail.com', 'ofAmerica', 'Super', 'GodDaddy', 'adsffda', '江苏省', 'mcu', 'm78', '13511704552', 1),
       ('jamesborg@gmail.com', 'James', 'E', 'Borg', 'jamborg', 'TX', 'Houston', '450 Stone', '4325874156', 1),
       ('jande8654@outlook.com', 'Jane', 'C', 'Doe', 'jande865', 'ON', 'North York', '187 Sayview', '4358974156', 1),
       ('jasonliu88@libman.com', 'Jason', 'M', 'Liu', 'jsonliu088', 'ON', 'Toronto', '166 Kings', '4563218974', 1),
       ('jbs123@gmail.com', 'John', 'B', 'Smith', 'jbs123', 'TX', 'Houston', '731 Fondren', '4395210124', 1),
       ('jen2687@gmail.com', 'Joyce', 'A', 'English', 'jen26687', 'TX', 'Houston', '5631 Dallas', '4598741256', 1),
       ('jwallace2598@outlook.com', 'Jennifer', 'S', 'Wallace', 'jwallace85', 'TX', 'Ballaire', '291 Berry',
        '4632157894', 1),
       ('kojitadokoro@gmail.com', 'Koji', 'M', 'Tadokoro', 'kojitada114514', 'ON', 'Mississauga', '123 Upwood',
        '4563281597', 1),
       ('linsmith@gmail.com', 'Linda', 'Z', 'Smith', 'linsmith028', 'ON', 'Toronto', '876 Prince', '4856321598', 1),
       ('mlas028@libman.com', 'Mike', 'J', 'Laski', 'mlas028', 'NS', 'Halifax', '195 Centrewood', '4125637852', 0),
       ('mumu233@qq.com', 'mumuo', 'VV', 'vadvvdv', 'mvmmvm', '江苏', '扬州', '122 taishan', '17820000021', 1),
       ('spacestarfish@outlook.com', 'Evil', 'S', 'Starfish', 'spacestarfish', 'NS', 'Halifax', '2333 Void',
        '4856321475', 1),
       ('wf2887@outlook.com', 'Franklin', 'T', 'Wong', 'wf288c', 'TX', 'Houston', '638 Voss', '4381254789', 1),
       ('yoshida124@yahoo.com', 'Hiroshi', 'V', 'Yoshida', 'hyoshida', 'ON', 'North York', '3001 Dinch', '6321478569',
        0);
/*!40000 ALTER TABLE `person`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reterns`
--

DROP TABLE IF EXISTS `reterns`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reterns`
(
    `isbn`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `email`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `id`       int                                                           NOT NULL,
    `cDate`    datetime                                                      DEFAULT CURRENT_TIMESTAMP,
    `bstatus`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `duration` int                                                           DEFAULT '1',
    `rDate`    datetime                                                      DEFAULT NULL,
    `aDate`    datetime                                                      DEFAULT NULL COMMENT 'actual return date',
    PRIMARY KEY (`isbn`, `email`, `id`) USING BTREE,
    KEY `email` (`email`) USING BTREE,
    CONSTRAINT `reterns_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `reterns_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reterns`
--

LOCK TABLES `reterns` WRITE;
/*!40000 ALTER TABLE `reterns`
    DISABLE KEYS */;
INSERT INTO `reterns`
VALUES ('0128203315', 'azelaya@yahoo.com', 1, '2023-01-05 23:12:22', 'Returned', 1, '2023-01-06 23:12:22',
        '2023-01-05 23:35:53'),
       ('0128203315', 'azelaya@yahoo.com', 2, '2023-01-06 00:02:04', 'Returned', 5, '2023-01-11 00:02:04',
        '2023-01-06 00:02:13'),
       ('0128203315', 'azelaya@yahoo.com', 3, '2023-01-06 00:03:20', 'Returned', 5, '2023-01-11 00:03:20',
        '2023-01-06 00:03:24'),
       ('0128203315', 'fblorg@outlook.com', 1, '2023-01-05 23:07:41', 'Returned', 1, '2023-01-06 23:07:41',
        '2023-01-05 23:33:48'),
       ('0128203315', 'spacestarfish@outlook.com', 1, '2023-01-06 00:45:22', 'Returned', 5, '2023-01-11 00:45:22',
        '2023-01-06 00:46:42'),
       ('0128203315', 'yoshida124@yahoo.com', 1, '2023-01-07 11:02:17', 'Returned', 5, '2023-01-12 11:02:17',
        '2024-05-07 10:56:42'),
       ('0131103628', 'fblorg@outlook.com', 1, '2023-01-05 23:56:17', 'Returned', 3, '2023-01-08 23:56:17',
        '2023-01-06 00:00:50'),
       ('0131103628', 'jande8654@outlook.com', 1, '2023-01-06 00:39:41', 'Returned', 1, '2023-01-07 00:39:41',
        '2023-01-06 00:40:06'),
       ('0131103628', 'jen2687@gmail.com', 1, '2023-01-05 23:56:28', 'Returned', 5, '2023-01-10 23:56:28',
        '2023-01-06 00:00:48'),
       ('0131103628', 'linsmith@gmail.com', 1, '2023-01-05 23:57:22', 'Returned', 1, '2023-01-06 23:57:22',
        '2023-01-05 23:57:29'),
       ('0131103628', 'spacestarfish@outlook.com', 1, '2023-01-06 00:43:53', 'Returned', 1, '2023-01-07 00:43:53',
        '2023-01-06 00:44:05'),
       ('0133970779', 'azelaya@yahoo.com', 1, '2023-01-06 11:26:30', 'Returned', 1, '2023-01-07 11:26:30',
        '2023-01-06 11:26:39'),
       ('0133970779', 'fblorg@outlook.com', 1, '2023-01-06 00:49:35', 'Returned', 3, '2023-01-09 00:49:35',
        '2023-01-07 10:59:55'),
       ('0133970779', 'jbs123@gmail.com', 1, '2023-01-05 23:56:38', 'Returned', 1, '2023-01-06 23:56:38',
        '2023-01-06 00:00:47'),
       ('7020002207', 'spacestarfish@outlook.com', 1, '2024-06-06 02:20:13', 'Returned', 1, '2024-06-07 02:20:13',
        '2024-06-06 09:06:25');
/*!40000 ALTER TABLE `reterns`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user`
(
    `email`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `gender`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `age`     int                                                           NOT NULL,
    `uid`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `cTime`   datetime DEFAULT CURRENT_TIMESTAMP,
    `uTime`   datetime DEFAULT NULL,
    `aCredit` int      DEFAULT '0',
    PRIMARY KEY (`email`) USING BTREE,
    CONSTRAINT `user_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES ('515444544@qq.com', 'Male', 50, '202418881075002950', '2024-06-05 23:29:58', '2024-06-05 23:29:59', 500),
       ('admin02@libman.com', 'Unknown', 20, '202418881075002951', '2024-06-05 23:31:14', '2024-06-05 23:31:17', 1000),
       ('azelaya@yahoo.com', 'Female', 27, '20221224597193486', '2022-12-24 17:33:04', '2023-01-06 00:06:50', 500),
       ('dvbkkkk3232@gmail.com', 'Female', 60, '202418881075002952', '2024-06-05 23:31:15', '2024-06-05 23:31:17', 200),
       ('fblorg@outlook.com', 'Other', 4, '20221224346174758', '2022-12-24 17:38:39', '2023-01-06 00:06:48', 375),
       ('godj47552@gmail.com', 'Male', 20, '202406061586792620', '2024-06-05 19:57:13', NULL, 200),
       ('jamesborg@gmail.com', 'Male', 45, '202212242055571912', '2022-12-24 17:36:58', '2023-01-06 00:06:48', 455),
       ('jande8654@outlook.com', 'Female', 23, '20221224564425856', '2022-12-24 17:39:53', '2023-01-06 00:06:48', 500),
       ('jasonliu88@libman.com', 'Female', 70, '202418881075002953', '2024-06-05 23:31:16', '2024-06-05 23:31:18', 200),
       ('jbs123@gmail.com', 'Male', 33, '202212241946340529', '2022-12-24 17:30:11', '2023-01-06 00:06:53', 435),
       ('jen2687@gmail.com', 'Female', 25, '20221224723207108', '2022-12-24 17:36:14', '2023-01-06 00:06:49', 410),
       ('jwallace2598@outlook.com', 'Female', 36, '20221224679361579', '2022-12-24 17:34:57', '2023-01-06 00:06:50',
        485),
       ('kojitadokoro@gmail.com', 'Male', 18, '20221224828600467', '2022-12-24 17:43:47', '2023-01-06 00:06:47', 485),
       ('linsmith@gmail.com', 'Unknown', 37, '202301041937374814', '2023-01-04 17:08:08', '2023-01-06 00:06:46', 390),
       ('mlas028@libman.com', 'Male', 40, '202312241065005931', '2024-06-05 23:32:58', '2024-06-05 13:48:21', 191),
       ('mumu233@qq.com', 'Female', 22, '202412281065002931', '2024-06-06 03:11:58', '2024-06-06 03:12:01', 260),
       ('spacestarfish@outlook.com', 'Other', 17, '20221225752851968', '2022-12-25 16:35:37', '2023-01-06 00:06:46',
        500),
       ('wf2887@outlook.com', 'Male', 25, '202212241314368891', '2022-12-24 17:31:42', '2023-01-06 00:06:52', 440),
       ('yoshida124@yahoo.com', 'Male', 33, '202212241065002931', '2022-12-24 17:41:54', '2023-01-06 00:06:47', 400);
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pp0alm'
--
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07  1:47:31
