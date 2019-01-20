CREATE DATABASE  IF NOT EXISTS `exselldb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `exselldb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: exselldb
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `interesttable`
--

DROP TABLE IF EXISTS `interesttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interesttable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OwnerID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `BuyerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interesttable`
--

LOCK TABLES `interesttable` WRITE;
/*!40000 ALTER TABLE `interesttable` DISABLE KEYS */;
INSERT INTO `interesttable` VALUES (5,6,69,1),(6,6,67,1),(7,2,5,1),(8,5,56,1),(9,4,47,1),(10,4,49,1),(11,4,41,1),(12,2,10,4),(13,2,11,4),(14,1,1,4),(15,2,5,4),(16,1,4,4),(17,6,63,4),(18,7,28,4),(19,1,36,4),(20,6,69,2),(21,6,66,2),(22,6,65,2),(23,4,45,2),(24,1,34,2),(25,5,56,2),(26,4,49,2),(27,4,84,2),(28,4,85,2),(29,7,24,3),(30,7,25,3),(31,6,65,3),(32,4,51,3),(33,5,58,3),(34,7,26,3),(35,1,39,3),(36,1,3,3),(37,2,6,3),(38,2,7,3),(39,2,7,3),(40,1,40,5),(41,7,24,5),(42,3,92,5),(43,3,91,5),(44,3,90,5),(45,2,87,5),(46,2,88,5),(47,2,86,5),(48,2,86,5),(49,3,16,5),(50,2,6,5),(51,2,5,5),(52,1,40,6),(53,7,24,6),(54,2,30,6),(55,2,31,6),(56,2,7,6),(57,2,5,6),(58,3,14,6),(59,4,48,6),(60,3,90,6),(61,2,88,6),(62,1,70,6),(63,5,62,7),(64,6,66,7),(65,4,51,7),(66,4,45,7),(67,5,57,7),(68,1,35,7),(69,1,1,7),(70,3,14,7),(71,4,49,7),(72,4,47,7),(73,4,83,7),(74,2,88,7),(75,2,87,7),(76,4,42,7);
/*!40000 ALTER TABLE `interesttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttable`
--

DROP TABLE IF EXISTS `producttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttable` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(1000) DEFAULT NULL,
  `ProductQuantity` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `ProductDetails` varchar(1000) DEFAULT NULL,
  `Category` varchar(10000) DEFAULT NULL,
  `ImageID` varchar(1000) DEFAULT NULL,
  `TimeStamp` varchar(45) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `Product_User_FK_idx` (`UserID`),
  CONSTRAINT `UserID_FK` FOREIGN KEY (`UserID`) REFERENCES `usertable` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttable`
--

LOCK TABLES `producttable` WRITE;
/*!40000 ALTER TABLE `producttable` DISABLE KEYS */;
INSERT INTO `producttable` VALUES (1,'Benedictine DOM',1,35,'Airport selling $48.30 for 1 litre. Sealed not open.\r\n','Foods & Services','Benedictine DOM.jpg','15/3/2018 12:31:54 PM',1),(2,'Chang beer 490ml premium draft beer',12,35,'Chang beer premium draft beer 490ml\r\nTotal of 12 cans\r\n$35 for 12 cans\r\n','Foods & Services','Chang beer 490ml premium draft beer.jpg','15/3/2018 12:32:53 PM',1),(3,'Tiger beer black/white',5,1,'Cheaper than outside, not opened.','Foods & Services','Tiger beer black and white.jpg','15/3/2018 12:33:31 PM',1),(4,'Set of 2bottles BN Camus Bordeaux french red wine',2,18,'12% alcohol level\r\nYear in 2001\r\n','Foods & Services','set_of_2bottles_bn_camus_bordeaux_french_red_wine_1520716122_d9215903.jpg','15/3/2018 12:34:32 PM',1),(5,'Susu Kurma \"DATES ME\"',24,5,'400ml per bottle, product just came in','Foods & Services','Susu Kurma DATES ME.jpg','15/3/2018 12:35:50 PM',2),(6,'OREO White Choc 246g',1,10,'1 box consists of 6 packets of Oreo cookies coated with white chocolate fudge\r\n3 boxes left!\r\n','Foods & Services','oreo_white_choc_246g_1520469817_e88c6e40.jpg','15/3/2018 12:36:29 PM',2),(7,'NEW Ltd Easter Ed Japan Kit ',12,1,'Simply oishi!\r\n','Foods & Services','NEW Ltd Easter Ed Japan Kit.jpg','15/3/2018 12:37:02 PM',2),(8,'White Marble Sticky Notes (big)',3,4,'80 sheets per deck. Measures: 7.1cm x 7.1cm. \r\n','Stationery','White Marble Sticky Notes (big).jpg','15/3/2018 12:38:08 PM',2),(9,'Scenic Round Post Its / Sticky Notes',3,6,'80 sheets per deck. \r\n','Stationery','scene round post it notes.jpg','15/3/2018 12:38:28 PM',2),(10,'Floral Washi Tape',3,5,'All 15mm x 7m\r\n','Stationery','Floral Washi Tape.jpg','15/3/2018 12:41:05 PM',2),(11,'File cabinet',5,1,'Description • In good condition , bought from popular book store.\r\n4 Drawers set for filing, organising and storing documents. \r\nDimensions: W277 x L344 x H259 mm\r\n','Stationery','file cabinet.jpg','15/3/2018 12:42:31 PM',2),(12,'Large Serving Plate 33cm',5,2,'I have two pieces. $5 each \r\n','Kitchen Appliances','large serving plate.jpg','15/3/2018 12:44:41 PM',3),(13,'Zara Home Set Of 7 White Espresso Cups With Saucers',29,1,'Bought from overseas Only used one of the cups a few times Almost brand new condition\r\n','Kitchen Appliances','zara_home_set_of_7_white_espresso_cups_with_saucers_1430801415_fb9616dc.jpg','15/3/2018 12:45:00 PM',3),(14,'Tefal FreeMove FV9920 Cordless Steam Iron',140,1,'Item used less than 5 times Free courier Price nego\r\n','Household Appliances','tefal_freemove_fv9920_cordless_steam_iron_1517574585_4c8485e50.jpg','15/3/2018 12:52:46 PM',3),(15,'Electrolux Vacuum Cleaner',30,1,'Still in working condition\r\n','Household Appliances','electrolux vaccuum cleaner.jpg','15/3/2018 12:54:31 PM',3),(16,'Nutella Tarts ',10,1,'50pcs @ $10 \r\n','Foods & Services','nutella_tarts__1520268441_a416c95f (1).jpg','15/3/2018 12:47:26 PM',3),(17,'tombow dual brush pens - greyscale',3,6,'each for $3 buy all x6 for $15.90\r\n','Stationery','tombow dual brush pens - greyscale.jpg','15/3/2018 12:48:02 PM',3),(18,'Steamer zebra',20,1,'Zebra 42cm high 28cm diameter \r\n','Kitchen Appliances','steamer zebra.jpg','15/3/2018 12:56:35 PM',3),(19,'Communication Strategies',1,10,'Used for only 1 sem, didnt write anything inside, good for TS3001','TextBooks/Resources','book1.PNG','15/3/2018 2:05:27 PM',7),(20,'Exploring Arduino',1,25,'Beginners guide to arduino programming and system design analytics','TextBooks/Resources','book2.PNG','15/3/2018 2:06:08 PM',7),(21,'Chemical Engineering',1,50,'What do you call a fish with 2 Sodium ions?\r\n2Na\r\n\r\nPlease buy my book, i need to eat','TextBooks/Resources','book3.PNG','15/3/2018 2:06:55 PM',7),(22,'Social Psychology',1,31,'How to make friends while simultaneously manipulating them in the background. Recommended only for psychos.','BooksTextBooks/Resources','book4.PNG','15/3/2018 2:08:13 PM',7),(23,'Clinical Medicine',1,40,'Panadol is the answer to everything.\r\nCold? Panadol.\r\nFlu? Panadol.\r\nTuberColosis? Panadol.','TextBooks/Resources','book5.PNG','15/3/2018 2:09:09 PM',7),(24,'The Subtle Art of Not Giving a F',1,2,'Buy it or not i dont care.','TextBooks/Resources','the_subtle_art_of_not_giving_a_f_1516067215_198ff8da.jpg','15/3/2018 2:09:30 PM',7),(25,'Maze Runner Series',1,20,'Breaks me to sell them but I need money\r\n','TextBooks/Resources','Maze Runner Series.jpg','15/3/2018 2:10:11 PM',7),(26,'Laptop',1,110,'Besides the loud grazing sound of the fan and the constant shutting down randomly. This works pretty well, i can use 9GAG on it.','Electronics','laptop1.jpg','15/3/2018 2:12:15 PM',7),(27,'Laser and light pointer',1,2,'No Battery, but still works. ','Electronics','laser and light pointer.jpg','15/3/2018 2:12:38 PM',7),(28,'AMC bowl shredder ring set',100,1,'Includes 28cm bowl, food shredder and spacer ring.\r\n','Kitchen Appliances','amc_bowl_shredder_ring_set_1510298205_a5d9a97b.jpg','15/3/2018 2:13:34 PM',7),(29,'Standing Fan',1,15,'Model: MS18SFT\r\n','Household Appliances','standing fan.jpg','15/3/2018 2:14:18 PM',7),(30,'GB Station Light boy Handheld Game Player with Bulit-in 142 Games',1,42,'Everything in the picture and 142 in 1 game cartridge included! \r\n','Electronics','GB Station Light boy Handheld Game Player with Bulit-in 142 Games.jpg','17/3/2018 2:40:59 AM',2),(31,'Samsung printer',1,20,'No ink .But can used\r\n','Electronics','Samsung printer.jpg','15/3/2018 2:21:40 PM',2),(32,'IKEA side table lamp',5,2,'Barely used.\r\n','Household Appliances','IKEA side table lamp.jpg','15/3/2018 2:22:23 PM',2),(33,'salted egg potato chips',8,4,'Once you start you can\'t stop. \r\n','Foods & Services','salted egg potato chips.jpg','15/3/2018 2:23:06 PM',2),(34,'Gudetama drawing/writing notebook with stickers',6,1,'Around 23cm w * 18 cm h First page with stickers\r\n','Stationery','gudetama_drawingwriting_notebook_with_stickers_1512099197_1be13d9d.jpg','15/3/2018 2:24:06 PM',1),(35,'A3 Size White paper foam board (Adhesive Type)',1,4,'Leftovers after an event\r\n','Stationery','A3 Size White paper foam board (Adhesive Type).jpg','15/3/2018 2:24:52 PM',1),(36,'Electric Kettle Russell Hobbs',30,1,'1.7L Stainless Steel Electric Kettle Metallic Silver Glass Accent\r\n','Kitchen Appliances','Electric Kettle Russell Hobbs.jpg','15/3/2018 2:25:25 PM',1),(37,'Groceries Cart',50,1,'Highly sought groceries cart in Europe.Hassle-free and super convenient for groceries\r\n','Kitchen Appliances','groceries_cart_1509260586_4d0321c9.jpg','15/3/2018 2:25:49 PM',1),(38,'Tablet Samsung Xperia Note 4',1,33,'Used it once but didn\'t like it','Electronics','tablet1.jpg','15/3/2018 2:28:18 PM',1),(39,'Usb Cable',20,1,'Its really good i swear, charged 100% within 30 minutes!','Electronics','usbcable1.jpg','15/3/2018 2:29:01 PM',1),(40,'how to talk to anyone',2,1,'Good book on how to make friends, actually i can just give it to you for free, just be my friend. Please.\r\n\r\n\r\n\r\nIm lonely :(','TextBooks/Resources','how to talk to anyone.jpg','15/3/2018 2:30:07 PM',1),(41,'Fridge (48cm x 54cm x 85cm)',1,100,'Self collection from hall 8. Used only for 1 year\r\n','Kitchen Appliances','Fridge.jpg','15/3/2018 2:31:46 PM',4),(42,'KeloMat Pressure Cooker ',29,1,'Just tested by boiling water with turning knob set to no.1, it is working fine, the red button will pop up when water boiled.\r\n','Kitchen Appliances','KeloMat Pressure Cooker.jpg','15/3/2018 2:32:17 PM',4),(43,'Philips Juicer',10,1,'Cleaned it already, works like a charm\r\n\r\nMy best attempt at being healthy. The only thing i lost was motivation.','Kitchen Appliances','phillips juicer.jpg','15/3/2018 2:33:03 PM',4),(44,'Alphabet Stamp (Lower Case)',12,1,'Retro Wooden Lower Case Alphabet Letters Rubber Stamps Set\r\n','Stationery','Alphabet Stamp (Lower Case).jpg','15/3/2018 2:33:35 PM',4),(45,'Muji Notebook - Plain Cover Lined',15,1,'Brand new. -Nice and simple design. -Lined; A5 sized.\r\n','Stationery','Muji Notebook - Plain Cover Lined.jpg','15/3/2018 2:34:00 PM',4),(46,'Cosmetic Acrylic Organizer Case',15,1,'Size: 18cm x 7cm x 8cm\r\n','Household Appliances','Cosmetic Acrylic Organizer Case.jpg','15/3/2018 2:34:29 PM',4),(47,'Toilet Roll Holder',2,1,'It has served it\'s purpose\r\n','Household Appliances','toilet_roll_holder__bathroom_organizer__toilet_accessories__bathroom_accessories_1520230501_c3c3ae960.jpg','15/3/2018 2:35:01 PM',4),(48,'Wooden Trolley',20,1,'Able to fold into a smaller pile of wood. Architecture is amazing\r\n','Household Appliances','wooden_trolley_1517552236_fd78437d.jpg','15/3/2018 2:35:35 PM',4),(49,'Stand fan',20,1,'MOVING OUT SALE!!! Must go before 20 March 2018\r\n','Household Appliances','standfan 2.jpg','15/3/2018 2:36:01 PM',4),(50,'Laptop *Brand New!*',1,10,'I dont really know what model it is but i found it at the bus stop at North spine. Selling for $10!','Electronics','laptop2.jpg','15/3/2018 2:36:57 PM',4),(51,'Graphic Calculator',1,34,'The only graphics i needed was a B on my paper, but this didnt help. Selling away this useless item.','Electronics','gc.jpg','15/3/2018 2:37:45 PM',4),(52,'Bose speaker',1,150,'The speaker fitting of a boss.','Electronics','bose speaker.jpg','15/3/2018 2:38:58 PM',5),(53,'Wireless mouse',2,2,'It still works. Selling cheap cheap. Maximum range 1 metre from adapter.','Electronics','wireless mouse.jpg','15/3/2018 2:39:33 PM',5),(54,'Milk and Honey + The Sun and Her Flower by Rupi Kaur',1,32,'Brand new and slightly read. Immediately available. PM me to deal.(: Thanks!\r\nI really thought this was about something else.\r\n','TextBooks/Resources','milk and honey.jpg','15/3/2018 2:41:08 PM',5),(55,'Ideas and Books: The Means of Education (Charlotte Mason Topics) (Volume 3)',1,15,'A selection of Charlotte Mason\'s writings on the topic of the place of ideas and books in the education of children. Mason\'s teachings on the topic of education required six large volumes to cover. This book makes it simple for homeschooling parents to find exactly what they need to learn about Charlotte Mason\'s thoughts on ideas and books. \r\n','TextBooks/Resources','Ideas and Books The Means of Education.jpg','15/3/2018 2:41:37 PM',5),(56,'Corner Shelf Unit Great For ',1,10,'W x h: 33 cm x 65 cm\r\n','Household Appliances','corner_shelf_unit_great_for_soaps_and_toiletries_1494394945_b579868b.jpg','15/3/2018 2:42:21 PM',5),(57,'IKEA document tray',1,4,'Used but in good condition\r\n','Stationery','IKEA document tray.jpg','15/3/2018 2:43:15 PM',5),(58,'LG 47 HD ready tv',1,180,'LG 46” UHD tv, model 47 LH 35. 3 HDMI. LG remote and stand. Good working condition. Full test before buying. \r\n','Electronics','LG 47 HD ready tv.png','15/3/2018 3:24:11 PM',5),(59,'Toshiba TV 55 inch',1,100,'Toshiba regza bought 7 years ago. With wall bracket and original remote. \r\n','Electronics','Toshiba TV 55 inch.png','15/3/2018 3:24:56 PM',5),(60,'Infocus IN72 DLP Home Theatre Projector',1,120,'Only 900 hours used of a 3000 hour lamp - that’s a lot of movies..!\r\n','Electronics','Infocus IN72 DLP Home Theatre Projector.png','15/3/2018 3:25:18 PM',5),(61,'Akai',1,20,'31 inch LCD TV\r\n','Electronics','akai.png','15/3/2018 3:25:36 PM',5),(62,'TV For Sale',1,100,'Tv Philips 21\" with remote control. Bought One year. Warranty ended.\r\n','Electronics','TV For Sale.png','15/3/2018 3:25:59 PM',5),(63,'Hello Kitty Rice Cooker',60,1,'Hey guys I got this as a farewell gift. I don\'t fancy this type of modern cooker preferring the old cover type.\r\n','Kitchen Appliances','hello kitty.jpg','15/3/2018 3:29:12 PM',6),(64,'Hello kitty bedsheets',1,20,'very cute n comfortable king size bed sheet \r\n','Household Appliances','hello_kitty_bedsheets_1516338184_d0e6ccdb.jpg','15/3/2018 3:29:54 PM',6),(65,'Bluetooth Earphones',1,57,'1 year warranty from JBL Singapore\r\n','Electronics','bluetooth_earphones_1519615924_f036d8aa.jpg','15/3/2018 3:30:53 PM',6),(66,'Bluetooth Speaker',1,100,'Awesome bass, no more warranty\r\n','Electronics','Bluetooth Speaker.png','15/3/2018 3:31:44 PM',6),(67,'Headphone Mic Audio Y Splitter Cable',1,4,'The Cables Unlimited 3.5mm stereo y-splitter cable allows you to easily connect your stereo headset & Mic to a PC audio port and mic port at the same time\r\n','Electronics','Headphone Mic Audio Y Splitter Cable.png','15/3/2018 3:32:07 PM',6),(68,'Jami Subwoofer',1,80,'Jami subwoofer for all the party people!\r\n','Electronics','Jami Subwoofer.png','15/3/2018 3:32:32 PM',6),(69,'JBL Flip 3',1,150,'Bought it at Popular for $179 \r\n','Electronics','JBL Flip 3.png','15/3/2018 3:33:05 PM',6),(70,'2 rooms and a boom',1,20,'2 rooms and a boom, pretty fun.\r\n\r\n7/10 Would play again ','Board Games','2 rooms and a boom.jpg','17/3/2018 1:41:21 AM',1),(71,'Marcha Ballerina Straw Bag',1,19,'Nice summer / weekend bag. Straps long enough to carry on shoulders. When measured flat: Width: 13.5\" across opening of bag Full length: 17\" down (from handle to base) Length of body of the bag: 9.5\" down \r\n','Women\'s Fashion','bnwt_marcha_ballerina_straw_bag_1504414298_da409597.jpg','17/3/2018 1:42:46 AM',6),(72,'Puma Basket Heart',1,150,'Puma Basket Heart. Size 8, wore only once','Women\'s Fashion','puma_basket_heart_1520007757_826810ef0.jpg','17/3/2018 1:43:23 AM',6),(73,'Herschel backpack',30,1,'IDK why is there a weird pattern thing going on but it\'s not as obvious irl.\r\n','Women\'s Fashion','herschel_backpack_1514036730_1b65c7e8.jpg','17/3/2018 1:43:46 AM',6),(74,'Grey Tote Drawstring Shoulder Bag',1,28,'Drawstring bags have become a trendy item for their versatility. Its easy to grab and go, and its smaller size makes it more portable.\r\n','Women\'s Fashion','grey_tote_drawstring_shoulder_bag_1520995408_67700c920.jpg','17/3/2018 1:44:02 AM',6),(75,'AFA Culottes in Brick Red',1,20,'Brick red, 20\"\r\n','Women\'s Fashion','AFA Culottes in Brick Red.png','17/3/2018 1:45:18 AM',6),(76,'Pom Pom Fluff Ball Keychain',8,1,'Brand new Soft and fluffy with tassels \r\n','Women\'s Fashion','pom_pom_fluff_ball_keychain_lobster_clasp_tassel_brand_new_fur_ball_1517632214_566a30cd.jpg','17/3/2018 1:45:40 AM',6),(77,'Uniqlo Flare Zip Skirts',2,12,'Size M. New, unworn without tags. \r\nPerfect for a smart casual and feminine look.\r\nPm for color','Women\'s Fashion','uniqlo_flare_zip_skirts_bundle_1519012054_11393802.jpg','17/3/2018 1:46:16 AM',6),(78,'High Waist Levis Jeans size 28',1,10,'Growing too big for this!\r\n','Women\'s Fashion','original_high_waist_levis_jeans_size_28_l_31_1520247260_b77be85f0.jpg','17/3/2018 1:47:09 AM',4),(79,'Pup socks',1,6,'Bought the wrong design\r\n','Women\'s Fashion','socks_1520360112_7cade98b.jpg','17/3/2018 1:47:34 AM',4),(80,'PO: Crop Top/ Bralette',3,12,'Passing the legecy on!\r\n','Women\'s Fashion','crop top.png','17/3/2018 1:48:43 AM',4),(82,'Cards against humanity',2,10,'Cards against humanity, just the original set, no add ons included','Board Games','cards against humanity.jpg','17/3/2018 1:54:09 AM',4),(83,'Dice',1,6,'Selling pack of 50 dice, no individual sales','Board Games','dice.jpg','17/3/2018 1:54:58 AM',4),(84,'Exploding kittens',1,20,'Only the orignal set, no expansion, unopened.','Board Games','exploding kittens.jpg','17/3/2018 2:12:25 AM',4),(85,'Imploding kittens',1,19,'Really fun when u play with friends, 9\'/10 would play again','Board Games','imploding kittens.jpg','17/3/2018 2:12:53 AM',4),(86,'Jenga',1,2,'The real cost of this game is Friendship.','Board Games','jenga.jpg','17/3/2018 2:13:53 AM',2),(87,'Monopoly : Walking dead',1,15,'I used to like board games, not i liked bored games.','Board Games','monopoly walking dead.jpg','17/3/2018 2:14:26 AM',2),(88,'Monopoly : My little Pony',1,10,'Just buy it, dont ask any questions!','Board Games','monopoly_my_little_pony_1520020996_c6f6f335.jpg','17/3/2018 2:14:54 AM',2),(89,'Oracle cards',1,5,'Selling everything for $5, this can entertain you for at least a week.','Board Games','oracle_cards_1517297408_584d3683.jpg','17/3/2018 2:25:08 AM',3),(90,'Couple question game cards',1,10,'Design for couples. Tested and proven. Cards might be slightly dirty.','Board Games','question game cards.jpg','17/3/2018 2:25:42 AM',3),(91,'Ripndip pink shirt Medium',1,40,'Intl M / EU 50 / UK 40 / US 40\r\n','Men\'s Fashion','Ripndip pink shirt Medium.png','17/3/2018 2:31:03 AM',3),(92,'Winter Jacket',5,1,'Used only once. Bought to go Northern India.\r\n','Men\'s Fashion','Winter jacket.png','17/3/2018 2:31:21 AM',3),(93,'Nike Golf T shirt S size',1,23,'Nike Golf T shirt S size. Pit to pit S 20\". Nice design and colour. Intl S / EU 48 / UK 38 / US 38\r\n','Men\'s Fashion','Nike Golf T shirt S size.png','17/3/2018 2:34:19 AM',5),(94,'Nike Men\'s Elite Cushion Sock (Size 24-27cm)',1,13,'Size 24-27cm Brand New w Tag\r\n','Men\'s Fashion','nike_mens_elite_cushion_sock_size_2427cm_1515296180_9e485788.jpg','17/3/2018 2:34:35 AM',5),(95,'Brand New With Tag Unique Jim Beam Silky Boxer Shorts',1,14,'Fits M, L best. Very elastic waist \r\n','Men\'s Fashion','brand_new_with_tag_unique_jim_beam_silky_boxer_shorts_1514807598_32cc7895.jpg','17/3/2018 2:34:51 AM',5);
/*!40000 ALTER TABLE `producttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertable`
--

DROP TABLE IF EXISTS `usertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(1000) DEFAULT NULL,
  `Email` varchar(1000) DEFAULT NULL,
  `Password` varchar(1000) DEFAULT NULL,
  `PhoneNo` varchar(20) DEFAULT NULL,
  `Verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertable`
--

LOCK TABLES `usertable` WRITE;
/*!40000 ALTER TABLE `usertable` DISABLE KEYS */;
INSERT INTO `usertable` VALUES (1,'Yiu Hong Sum','yiuh0001@e.ntu.edu.sg','D0ADCF987B4238A0BB2917936C82B9845B00C726457FD0B071481E51A40E046BF92A0B9280C57650298F28C4E8411E57B030137D30184D29ACB61A9BAA9F2B58','96399127',0),(2,'Chang Keat Lueng Aaron','achang007@e.ntu.edu.sg','C9555D96A6EC4BB89205BB1198A22B973E445EF8EEEB3EB69E9290AA64C0D6585D06F4A8CDF2F99F60907CDFE5AA648C041906A19D35F98D0EC46C3A8DA36E6E','98551266',0),(3,'Lim Yan Jun','ylim085@e.ntu.edu.sg','66FF6F0A91F68A0A7DD813097766A864F83304E16691ED427A3E2646BF93C528004BF3F062B2252EE87D620CB9C2001A31D3A4DCD5B89B2D9818216B04C56C15','81683800',0),(4,'Chen Zhenni','zchen035@e.ntu.edu.sg','EA72164B1ADF6E1EDDAA12347A9FE7609E7A250F843119613E2850DC001E56CDFCD000076048A48973E9DEC1BA1E16EC68E35CAE057D0E7BB4F41152ABB22733','97365716',0),(5,'Lim Kian Hock Bryan','klim050@e.ntu.edu.sg','CFCA8861B8089FC6029370D2953648AA7C3B8146F2677FFDFCEA7EB38581E6FADEEFCA10F1CB1A17FA182284B9D38EB29BEE1AE787CD5CF8BE291C069C32AF64','91371197',0),(6,'Cheng Yang Zhen','ycheng021@e.ntu.edu.sg','C63A18B0EA46EC1BC66F6CEE47AB42E7A0F217F170E7BBADBD7BBC7D2F25C986AD716940DF1C87295C19A89186EFED8835864F34023EC476435C704A14B9F249','81288836',0),(7,'Soong Jie Ming','jsoong004@e.ntu.edu.sg','B5E611E0165598ED723A2F82999DC76FE85CB029CCBDD83FACCB5690C50272359AC408D253E3CF2C9BFB28EB91A329E2CDA216EAC80095AEB1D188D81FEFEA4C','90289372',0);
/*!40000 ALTER TABLE `usertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'exselldb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-17  2:41:55
