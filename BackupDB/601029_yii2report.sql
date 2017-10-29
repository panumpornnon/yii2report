-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2017 at 02:18 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2report`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('theCreator', 1, 1451274599);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Administrator of this application', NULL, NULL, 1451273728, 1451273728),
('adminArticle', 2, 'Allows admin+ roles to manage articles', NULL, NULL, 1451273728, 1451273728),
('createArticle', 2, 'Allows editor+ roles to create articles', NULL, NULL, 1451273727, 1451273727),
('deleteArticle', 2, 'Allows admin+ roles to delete articles', NULL, NULL, 1451273728, 1451273728),
('editor', 1, 'Editor of this application', NULL, NULL, 1451273728, 1451273728),
('manageUsers', 2, 'Allows admin+ roles to manage users', NULL, NULL, 1451273727, 1451273727),
('member', 1, 'Registered users, members of this site', NULL, NULL, 1451273728, 1451273728),
('premium', 1, 'Premium members. They have more permissions than normal members', NULL, NULL, 1451273728, 1451273728),
('support', 1, 'Support staff', NULL, NULL, 1451273728, 1451273728),
('theCreator', 1, 'You!', NULL, NULL, 1451273729, 1451273729),
('updateArticle', 2, 'Allows editor+ roles to update articles', NULL, NULL, 1451273728, 1451273728),
('updateOwnArticle', 2, 'Update own article', 'isAuthor', NULL, 1451273728, 1451273728),
('usePremiumContent', 2, 'Allows premium+ roles to use premium content', NULL, NULL, 1451273727, 1451273727);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'deleteArticle'),
('admin', 'editor'),
('admin', 'manageUsers'),
('admin', 'updateArticle'),
('editor', 'adminArticle'),
('editor', 'createArticle'),
('editor', 'support'),
('editor', 'updateOwnArticle'),
('premium', 'usePremiumContent'),
('support', 'member'),
('support', 'premium'),
('theCreator', 'admin'),
('updateOwnArticle', 'updateArticle');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isAuthor', 'O:28:\"common\\rbac\\rules\\AuthorRule\":3:{s:4:\"name\";s:8:\"isAuthor\";s:9:\"createdAt\";i:1451273727;s:9:\"updatedAt\";i:1451273727;}', 1451273727, 1451273727);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` varchar(2) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
('02', 'ฝ่ายการเงินและพัสดุ2'),
('03', 'ฝ่ายโภชนาการ2'),
('04', 'กลุ่มงานจิตเวชชุมชน2'),
('05', 'กลุ่มงานฟื้นฟูสมรรถภาพผู้ป่วยจิตเวช2'),
('06', 'กลุ่มงานจิตเวชทางเลือกและแพทย์แผนไทย2'),
('07', 'กลุ่มงานการแพทย์2'),
('08', 'กลุ่มงานทันตกรรม'),
('09', 'กลุ่มงานสังคมสงเคราะห์'),
('10', 'กลุ่มงานจิตวิทยา'),
('11', 'กลุ่มงานสุขภาพจิตสารเสพติด'),
('12', 'กลุ่มงานเภสัชกรรม'),
('13', 'กลุ่มงานจิตเวชเด็กและวัยรุ่น'),
('14', 'กลุ่มงานเทคนิคบริการ'),
('15', 'ฝ่ายเวชระเบียน'),
('16', 'สำนักบริหารการพยาบาล'),
('17', 'หน่วยบริการผู้ป่วยนอก'),
('18', 'หอผู้ป่วยจิตเวชหญิง 1'),
('19', 'หอผู้ป่วยจิตเวชหญิง 2'),
('20', 'หอผู้ป่วยจิตเวชหญิง 3'),
('21', 'หอผู้ป่วยจิตเวชชาย 1'),
('22', 'หอผู้ป่วยจิตเวชชาย 3'),
('23', 'หอผู้ป่วยจิตเวชชาย 4'),
('24', 'หอผู้ป่วยจิตเวชชาย 6 '),
('25', 'หอผู้ป่วยพิเศษสุพล'),
('26', 'หอผู้ป่วยปรีดา'),
('27', 'หน่วยบริการรักษาด้วยไฟฟ้า'),
('28', 'หน่วยสนับสนุนบริการทางการพยาบาล'),
('29', 'ฝ่ายแผนงานและประเมินผล'),
('30', 'กลุ่มงานวิจัยและพัฒนาเทคโนโลยีสุขภาพจิต'),
('31', 'ฝ่ายทรัพยากรบุคคล'),
('32', 'ฝ่ายสารนิเทศและประชาสัมพันธ์'),
('33', 'หน่วยบริการห้องสมุด'),
('34', 'ศูนย์โรคซึมเศร้าไทย'),
('35', 'สำนักเลขานุการผู้อำนวยการ'),
('36', 'สำนักุณภาพ');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1451273250),
('m141022_115823_create_user_table', 1451273264),
('m141022_115912_create_rbac_tables', 1451273266),
('m141022_115922_create_session_table', 1451273266),
('m150104_153617_create_article_table', 1451273267),
('m151230_151052_create_department', 1451490471);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` varchar(5) NOT NULL DEFAULT '',
  `prefix_id` varchar(2) DEFAULT NULL,
  `person_firstname` varchar(100) DEFAULT NULL,
  `person_lastname` varchar(100) DEFAULT NULL,
  `person_date_work_start` date DEFAULT NULL,
  `position_id` varchar(3) DEFAULT NULL,
  `department_id` varchar(2) DEFAULT NULL,
  `person_address` varchar(255) DEFAULT NULL,
  `person_tel` varchar(150) DEFAULT NULL,
  `person_picture` varchar(255) DEFAULT 'nopic.jpg',
  `person_work_status` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `prefix_id`, `person_firstname`, `person_lastname`, `person_date_work_start`, `position_id`, `department_id`, `person_address`, `person_tel`, `person_picture`, `person_work_status`) VALUES
('004', '01', 'มานิต', 'เหล่าคงธรรม', NULL, '16', '03', '', '', '', '1'),
('005', '02', 'พิกุล', 'เจริญสกุลทรัพย์', NULL, '16', '03', NULL, NULL, NULL, '0'),
('006', '02', 'อัญชลี', 'ศิลาเกษ', NULL, '76', '03', NULL, NULL, NULL, '1'),
('007', '02', 'วิรีย์อร', 'จูมพระบุตร', NULL, '76', '03', NULL, NULL, NULL, '0'),
('008', '01', 'สุรเชษฐ์', 'เวียงบาล', NULL, '76', '04', NULL, NULL, NULL, '1'),
('009', '02', 'ลำใย', 'เงินหมื่น', NULL, '76', '04', NULL, NULL, NULL, '0'),
('010', '02', 'พิมพา', 'ฉัตรสุวรรณ', NULL, '16', '04', NULL, NULL, NULL, '0'),
('011', '01', 'ทันสมัย', 'ภูเม็ด', NULL, '76', '04', NULL, NULL, NULL, '0'),
('012', '02', 'กิจตรา', 'นาคจีน', NULL, '16', '04', NULL, NULL, NULL, '0'),
('013', '01', 'รพีพร', 'พูนเพิ่ม', NULL, '16', '04', NULL, NULL, NULL, '0'),
('014', '01', 'บัวพันธ์', 'จันทะโคตร', NULL, '76', '04', NULL, NULL, NULL, '0'),
('015', '01', 'ส่ง', 'ปราบวงษา', NULL, '23', '04', NULL, NULL, NULL, '0'),
('016', '01', 'เดชา', 'สิมมาเคน', NULL, '23', '04', NULL, NULL, NULL, '0'),
('017', '01', 'วนิช', 'โพธิ์มั่น', NULL, '23', '08', NULL, NULL, NULL, '0'),
('018', '01', 'จำนงค์', 'ฉัตรสุวรรณ', NULL, '23', '08', NULL, NULL, NULL, '0'),
('019', '01', 'อุบล', 'นพคุณ', NULL, '23', '08', NULL, NULL, NULL, '0'),
('020', '01', 'ชุมพล', 'ภูษา', NULL, '23', '08', NULL, NULL, NULL, '0'),
('021', '01', 'ปรีชา', 'มัดธนู', NULL, '90', '08', NULL, NULL, NULL, '0'),
('022', '01', 'สุดใจ', 'จารุเศรษฐ์', NULL, '23', '08', NULL, NULL, NULL, '0'),
('023', '01', 'ธวัชชัย', 'เครือทอง', NULL, '17', '08', NULL, NULL, NULL, '0'),
('024', '01', 'ภูมินทร์', 'การบรรจง', NULL, '17', '05', NULL, NULL, NULL, '0'),
('025', '01', 'อดิศักดิ์', 'ธวัชกุล', NULL, '90', '05', NULL, NULL, NULL, '0'),
('026', '01', 'อำนวย', 'กาญจนพิมาย', NULL, '17', '05', NULL, NULL, NULL, '0'),
('027', '01', 'ชาตรี', 'มณีเติม', NULL, '17', '05', NULL, NULL, NULL, '0'),
('028', '01', 'วิเชียร', 'สร้อยสิงห์', NULL, '17', '05', NULL, NULL, NULL, '0'),
('029', '01', 'สุเทพ', 'คุณสุทธิ์', NULL, '17', '05', NULL, NULL, NULL, '0'),
('030', '01', 'ประสิทธิ์', 'ธานี', NULL, '17', '11', NULL, NULL, NULL, '0'),
('031', '01', 'สมถิ่น', 'ผาสุข', NULL, '17', '11', NULL, NULL, NULL, '0'),
('032', '01', 'อำคา            ', 'พูลทวี', NULL, '17', '11', NULL, NULL, NULL, '0'),
('033', '01', 'ชาลี', 'แก้วมหา', NULL, '17', '11', NULL, NULL, NULL, '0'),
('034', '01', 'ตื่นใจ', 'ห้องแซง', NULL, '17', '11', NULL, NULL, NULL, '0'),
('035', '01', 'สายสิน', 'ดอนใหญ่', NULL, '17', '11', NULL, NULL, NULL, '0'),
('036', '03', 'กิตติมา', 'โพธิ์ไพร', NULL, '17', '11', NULL, NULL, NULL, '0'),
('037', '03', 'อนามิกา', 'โรหิตรัตนะ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('038', '02', 'สุพรรษา', 'มีศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('039', '01', 'เจตจำนง', 'พงษพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('040', '01', 'พยนต์', 'เงาเพ็ชร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('041', '01', 'ธวัชชัย', 'แถมศิริ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('042', '01', 'ไพรวัลย์', 'มั่งกูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('043', '01', 'ชัชพงษ์', 'พันธ์น้อย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('044', '01', 'สมาน', 'ชามาตย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('045', '01', 'ทองใบ', 'จุปะมานะ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('046', '01', 'ประสาทพร', 'ใจยาว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('047', '01', 'สุรสิทธิ์', 'บุญนำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('048', '01', 'วินัย', 'ไชยวรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('049', '01', 'วิชิต', 'ไชยวรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('050', '01', 'พนมลักษณ์', 'เจริญศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('051', '01', 'สุพจน์', 'แก้วมหา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('052', '01', 'มาโนช', 'บุญนิ่ม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('053', '01', 'เอกชัย', 'สมชัย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('054', '01', 'โกเมศ', 'พิลากุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('055', '01', 'จตุพล', 'มูลนินทา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('056', '02', 'อัมพร', 'ตุลสุข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('057', '02', 'วนิดา', 'มะคำแป้น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('058', '02', 'เกื้อกูล', 'พรหมจรรย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('059', '02', 'สุภาพร', 'เพชรดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('060', '03', 'สุภาภรณ์', 'วรรณพงษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('061', '03', 'อรวรรณ', 'สุธรรมวิจิตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('062', '01', 'จรัญชัย', 'พุทธรักษา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('063', '02', 'สุนันทา', 'สุขปาน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('064', '02', 'ปิลันธนา', 'สายทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('065', '02', 'อรทัย', 'จิระมณี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('066', '01', 'สัญชัย', 'แสนทวีสุข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('067', '02', 'ภัคชนาวรรณ์', 'เฉลียวธรรม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('068', '02', 'ชัญญา', 'ธานี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('069', '02', 'วีรัญญา', 'สะอาด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('070', '02', 'สุนันทา', 'เครือทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('071', '01', 'เชาวรัตน์', 'ศรไชย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('072', '03', 'สาวศิริมา', 'หอมหวล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('073', '01', 'อดุลย์', 'ทองแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('074', '03', 'สริตา', 'นิลแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('075', '03', 'ปิยภัทร', 'สายนรา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('076', '02', 'จิรพัฒน์', 'หมั่นพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('077', '01', 'บูชา', 'น้อยชิน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('078', '01', 'ปิยชัย', 'จันทะโคตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('079', '03', 'กุลนิษฐ์', 'วัลภา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('080', '03', 'ดรุณี', 'แซ่โง้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('081', '03', 'สุนิสา', 'ลาพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('082', '03', 'นิพาภรณ์', 'อุสหะพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('083', '03', 'บรรณพร', 'สะอาด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('084', '03', 'ประทุมพร', 'ตระกูลไทย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('085', '03', 'นิทรา', 'บุดดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('086', '02', 'ปิยธิดา', 'สมปรารถนา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('087', '03', 'สุมลณี', 'วงศ์หาญ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('088', '02', 'พจนีย์', 'ประทุมชาติ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('089', '02', 'ธิดารัตน์', 'ภูเม็ด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('090', '02', 'ไพบูลย์', 'บุญมาทน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('091', '03', 'สนิท ', 'แก้วบัวไข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('092', '01', 'ธนัทพร', 'ดวงภาค', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('093', '03', 'เจนจิรา', 'บุญจอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('094', '03', 'นงเยาว์', 'พงษ์คำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('095', '02', 'พันธ์ทิพย์', 'โกศัลวัฒน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('096', '02', 'ลัดดาวัณย์', 'คุณวุฒิ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('097', '03', 'ธีราภา', 'ธานี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('098', '02', 'ณัฐิยา   ', 'ชมภูบุตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('099', '02', 'พัสนี', 'สิทธิคุณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('100', '02', 'สุภัทรา', 'ก้อนคำดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('101', '03', 'สุปราณี', 'พิมพ์ตรา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('102', '03', 'แสงอรุณ', 'ประเสริฐศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('103', '03', 'พรรณิภา', 'โมลา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('104', '03', 'ดรุณี', 'คชพรหม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('105', '03', 'ชุติมา    ', 'สุพลไร่', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('106', '02', 'มารศรี       ', 'โพธิ์มั่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('107', '02', 'เมตตา', 'บัวสด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('108', '03', 'นิตยา   ', 'เชื้อโชติ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('109', '02', 'ปทุมวัน   ', 'บัวโรย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('110', '02', 'ชุติมา   ', 'ลือนาม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('111', '03', 'สุธิสา   ', 'ดีเพชร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('112', '01', 'วิทยา', 'จันทร์อร่าม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('113', '01', 'ประจวบ', 'ศรีวะวงศ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('114', '01', 'ทองจรร', 'พลอำนวย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('115', '01', 'คงเดช', 'พันธุระ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('116', '01', 'สมศักดิ์', 'คูณตาแสง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('117', '01', 'นิยม', 'กุศลครอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('118', '01', 'ธวัชชัย', 'สมบัติหลาย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('119', '02', 'ปารณีย์', 'บุญนำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('120', '01', 'ฉลวย', 'จารุเศรษฐ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('121', '01', 'มนูญ', 'ศรีคูณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('122', '02', 'ทีปกร', 'วงษ์อุ่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('123', '01', 'อนุราช', 'สอดแสน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('124', '01', 'ปิยนันท์', 'หลักรัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('125', '01', 'ศักดิ์ดา', 'สิมมาเคน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('126', '01', 'ราชันต์', 'เผ่าภูรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('127', '01', 'กิตติพงษ์', 'คำใส', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('128', '01', 'ทินกร', 'ห้วยทราย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('129', '02', 'ชินารัตน์', 'จิตรพริ้ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('130', '02', 'ศิรินุช', 'สมตัว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('131', '03', 'ดวงเนตร', 'ประทุมพันธุ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('132', '03', 'ฐานิดา', 'สุระยา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('133', '03', 'สุพัตรา', 'ปันลา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('134', '02', 'ศตพร', 'แก้วสุพรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('135', '03', 'พรภัชกุญ', 'รัตนบวร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('136', '03', 'บังอร', 'ผุดผาด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('137', '02', 'นันทิยา', 'จีระทรัพย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('138', '02', 'วิรีย์อร ', 'จูมพระบุตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('139', '02', 'กนกกาญจน์', 'วิโรจน์อุไรเรือง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('140', '01', 'ศุภชัย', 'จันทร์ทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('141', '01', 'เจษฎา', 'ทองเถาว์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('142', '01', 'วัฒนพงษ์', 'พันธ์สวัสดิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('143', '01', 'ชินวัฒน์', 'โชติเกียรติ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('144', '01', 'เจริญศักดิ์', 'อ่ำกลิ่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('145', '01', 'สุทธา', 'สุปัญญา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('146', '03', 'สุทิสา', 'พึ่งป่า', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('147', '03', 'ณิชกานต์', 'ทองกลึง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('148', '02', 'ษญาฎา', 'แก้วงามสอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('149', '01', 'ชัยพร', 'ยิ่งเจริญพาสุข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('150', '01', 'ประชุม', 'กำแมด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('151', '03', 'จิราพร', 'ศิรินัย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('152', '02', 'กัลยา', 'อันชื่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('153', '02', 'วัชราภรณ์', 'ลือไธสงค์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('154', '03', 'บงกช', 'ศาสตร์ภักดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('155', '03', 'วิไลพร', 'วงษ์จำปา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('156', '01', 'วินัย', 'รัตนมูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('157', '03', 'ปิยะวรรณ', 'พลศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('158', '03', 'วราภรณ์', 'ผาดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('159', '01', 'กฤษณ์', 'ลำพุทธา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('160', '03', 'วิทลัย', 'ภู่พวง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('161', '03', 'กาญจนรัตน์', 'คำเพชรดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('162', '03', 'ทิวาพร', 'ปานวุฒิ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('163', '03', 'สกุลรัตน์', 'จารุสันติกุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('164', '03', 'สุภาพร', 'ประดับสมุทร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('165', '01', 'มงคล', 'หลักคำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('166', '01', 'ทัศไนย', 'วงศ์สุวรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('167', '01', 'ณรงค์ฤทธิ์', 'สุริยะ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('168', '03', 'วิชญา', 'โมฬีชาติ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('169', '03', 'เสาวรสธ์', 'ประดา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('170', '03', 'อุ้งฟ้าวดี', 'อ่อนมิ่ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('171', '03', 'เยาวรินทร์', 'อ้วนเฝือ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('172', '03', 'วิกานดา', 'สาตรา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('173', '03', 'สุพรรณิการ์', 'ธรรมแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('174', '03', 'สุทิชญา', 'บุญเนตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('175', '02', 'อัมพร', 'สีลากุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('176', '03', 'วิไลรัตน์', 'สะสมผลสวัสดิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('177', '03', 'วิมาลา', 'เจริญชัย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('178', '02', 'ฉวีรักษ์', 'ลีลา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('179', '01', 'เจริญศักดิ์', 'บุบผา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('180', '03', 'รัตนากร', 'ฉัตรวิไล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('181', '01', 'วีระ', 'ดุลย์ชูประภา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('182', '02', 'ชมภูนุช', 'วีระวัธนชัย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('183', '01', 'พิสิษฐ์', 'แถวจันทึก', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('184', '02', 'อภิรดี', 'แสงงาม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('185', '03', 'กมลรัตน์', 'โสมรักษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('186', '03', 'ดวงสุดา', 'วัฒนาไชย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('187', '03', 'พิรุณรัตน์', 'มะลิดอกไม้', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('188', '03', 'พวงเพชร', 'จิววัฒนารักษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('189', '03', 'อรไท', 'บังศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('190', '02', 'พัชรี', 'กำแมด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('191', '01', 'วิจาร', 'บังศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('192', '01', 'ประกาศิต', 'เครือมั่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('193', '03', 'ภัสรา', 'สมีน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('194', '02', 'นพภา', 'สุทธิพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('195', '02', 'สมร', 'นามประสพ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('196', '02', 'หนูกร', 'จันทะโคตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('197', '01', 'พิชัยวุฒิ', 'สุทธิพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('198', '01', 'อุเทน', 'นามโสภา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('199', '01', 'มหาเทพ', 'ทิพยานนท์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('200', '02', 'พิศมัย', 'แก้วมหา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('201', '01', 'ยุทธนา', 'แก่นสาร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('202', '02', 'ศิริเพ็ญ', 'พันโบ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('203', '01', 'วรวิทย์', 'ประทีปทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('204', '01', 'ฉัตรชัย', 'วิวิตรณากุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('205', '03', 'จริยา', 'จงจรูญเกียรติ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('206', '03', 'สิทธิญา', 'จันทร์แจ้ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('207', '02', 'สุภาวดี', 'คำกุณา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('208', '02', 'สุภาพร', 'จันทรภูมี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('209', '02', 'วีนัสริน', 'ก้อนศิลา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('210', '03', 'ณัฐนันท์', 'บุตราช', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('211', '03', 'กิตติกาญจน์', 'บุญทรง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('212', '01', 'จิตติศักดิ์', 'อนุทุม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('213', '02', 'สง่า', 'พิมสุตตะ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('214', '01', 'สันฐาน', 'บานนิกูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('215', '02', 'สุรางค์', 'ประเสริฐศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('216', '01', 'นพภา', 'เห็มภูมิ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('217', '01', 'ภาณุพงศ์', 'ฟูแสง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('218', '03', 'วิลาสินี', 'จันทร์ชนะ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('219', '01', 'วิชัย', 'โลนะจิตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('220', '01', 'ถวิล', 'เจริญศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('221', '04', 'วิจิตร', 'บุญศักดิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('222', '02', 'วันนา', 'หัสดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('223', '03', 'สุณีย์', 'แก้วหมอ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('224', '02', 'มุกดา', 'เวียงบาล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('225', '01', 'นพดล', 'กาฬเนตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('226', '03', 'เตือนจิต', 'ขจรฟุ้ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('227', '03', 'จริยา', 'พุทธรัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('228', '03', 'อมรรัตน์', 'บุ้งทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('229', '03', 'อรอนงค์', 'ทาเคลือบ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('230', '03', 'ทิพวรรณ', 'ขันธวัฒน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('231', '03', 'สมรักษ์', 'โพธิ์กระจ่าง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('232', '02', 'จิราพร', 'อินทะเล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('233', '02', 'พิกุล   ', 'เจริญสกุลทรัพย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('234', '02', 'เทพินทร์    ', 'บุญกระจ่าง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('235', '02', 'วาสนา  ', 'เหล่าคงธรรม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('236', '03', 'นิตยา   ', 'เจริญยุทธ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('237', '02', 'อรอินทร์', 'ขำคม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('238', '02', 'สิขรินทร์    ', 'พิมพ์พัฒน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('239', '03', 'มารศรี', 'ปาณีวัตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('240', '03', 'กุณฑ์ชลี', 'เพียรทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('241', '02', 'อรวรรณ', 'อภิบาลศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('242', '02', 'นงคราญ', 'สืบทรัพย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('243', '03', 'ลลิดา', 'ประไพ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('244', '01', 'สนธยา', 'บุญแย้ม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('245', '03', 'กิติพร', 'เสริฐวิชา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('246', '02', 'ไพรัตน์   ', 'ชมภูบุตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('247', '02', 'เยาวลักษณ์    ', 'การกล้า', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('248', '02', 'ปราวิณีย์    ', 'สาระ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('249', '02', 'นิตยา', 'อุ่นแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('250', '02', 'สุทธยา    ', 'แสงรุ่ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('251', '01', 'สุรเชษฐ์    ', 'หัสดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('252', '03', 'สุดารัตน์    ', 'พุฒพิมพ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('253', '02', 'พรชนก    ', 'แก้วอมตวงศ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('254', '02', 'นุสรา', 'พูนเพิ่ม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('255', '02', 'สมฤทัย   ', 'จรสาย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('256', '02', 'พยุดา    ', 'ผ่องแผ้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('257', '02', 'ขนิษฐา', 'ศรีเรือนทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('258', '02', 'กนกวรรณ   ', 'ประชุมราศี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('259', '01', 'พิทยา    ', 'บังศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('260', '01', 'เฉลียว   ', 'อนุการ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('261', '03', 'รัชนี    ', 'อุทัยพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('262', '02', 'ณัฎฐรียา    ', 'ทองเกลียว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('263', '02', 'ทุลภา   ', 'จันทร์ทรง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('264', '02', 'น้ำผึ้ง', 'คุ้มครอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('265', '02', 'นงคราญ', 'พูลเพิ่ม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('266', '02', 'ใหม่', 'จิตพิมลวัฒน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('267', '01', 'ชำนาญ', 'ธิบูรณ์บุญ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('268', '01', 'จันทร์ทร', 'พูลเพิ่ม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('269', '02', 'บุญญาพร', 'เงาเพ็ชร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('270', '01', 'บริรักษ์', 'บุราไกร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('271', '02', 'นันทิยา', 'ดาราช', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('272', '01', 'พรรชร', 'พิลาแดง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('273', '01', 'รังสรรค์', 'อัปกาญจน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('274', '01', 'จตุภูมิ', 'เชื้อเมฆ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('275', '03', 'จิรนันท์', 'โสมชม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('276', '01', 'สมาน', 'วงษ์อุ่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('277', '01', 'วัชญา', 'โกศัลวิตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('278', '01', 'วุฒิชัย', 'เหมือนลา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('279', '01', 'ณัฐกฤต', 'บุญชิต', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('280', '03', 'สุธิดา', 'เพชรพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('281', '03', 'อังศุมา', 'บุญจอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('282', '01', 'ศักดิ์ดา', 'วงษาหล้า', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('283', '02', 'วารุณี', 'มีสง่า', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('284', '03', 'นภัสนันท์', 'เจริญรอย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('285', '02', 'ชมัยพร    ', 'พรรณาภพ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('286', '02', 'ไพรณา    ', 'เสมอภาค', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('287', '02', 'สุกัญญา    ', 'เห็มภูมิ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('288', '02', 'นิภาพร', 'ไชยรักษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('289', '02', 'วิภาดา   ', 'พุ่มโพธิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('290', '03', 'สาวิตรี      ', 'พละบุตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('291', '02', 'สุกัลยา   ', 'อรุณไพร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('292', '03', 'ชนกพร', 'ต้นศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('293', '03', 'สุพัตรา', 'คณาจันทร์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('294', '03', 'วิศรุตา', 'ขันรักษา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('295', '02', 'ธนัชญา', 'สุหงษา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('296', '02', 'อุบลศรี', 'พิมพ์วงศ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('297', '03', 'ศิรินภา', 'แก้วกนก', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('298', '02', 'ดวงกมล', 'สมบัติหลาย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('299', '02', 'อุบล', 'เยื่อใย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('300', '03', 'ปาณิสรา', 'ศรไชย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('301', '02', 'ศิริวิภา', 'พวงทวี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('302', '02', 'วิไลรัตน์', 'วงศ์พิมพ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('303', '02', 'ฉวี', 'ดำพะธิก', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('304', '02', 'นิพร', 'เชื้อประทุม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('305', '03', 'ทิชานนท์', 'จันทร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('306', '03', 'จินตนา', 'พูลทวี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('307', '03', 'ธีรวรรณ', 'ผ่องใส', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('308', '02', 'ลัดดา      ', 'เรืองสิทธิ์  ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('309', '02', 'ชุ่มจิต    ', 'กลิ่นพิบูลย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('310', '02', 'สมจิตร   ', 'รอดคำวงศ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('311', '02', 'จามจุรี   ', 'อุดรสาร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('312', '03', 'จิราภรณ์    ', 'สีดำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('313', '02', 'ฐิตาพร', 'บุญจรัส', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('314', '02', 'สุชาดา   ', 'จิตรเอื้อตระกูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('315', '02', 'จรัสศรี    ', 'ทองผาย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('316', '02', 'เพ็ญศรี   ', 'พิมพ์หล่อ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('317', '03', 'ฉวีวรรณ   ', 'บุญถูก', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('318', '02', 'บุษบา  ', 'นามกร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('319', '02', 'สายพิณ', 'โยธาสาร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('320', '02', 'หนูแพง', 'พันธุระ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('321', '02', 'ธีรวรณ์', 'เจริญรัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('322', '03', 'รัชนี', 'สุขเกษม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('323', '02', 'ลัดดา', 'สุขไชย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('324', '02', 'นิตย์', 'วานมนตรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('325', '02', 'วาสนา', 'มูลนาม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('326', '03', 'วรรณี', 'อัปกาญจน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('327', '02', 'วัฒนา', 'ไชยวรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('328', '02', 'ประภาพร', 'วันโท', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('329', '02', 'พิมพา', 'เครือวัลย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('330', '02', 'ศรีอุบล    ', 'บำรุง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('331', '02', 'ราตรี   ', 'พิมพานิช', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('332', '02', 'เบญจกาย   ', 'ศรีธรรมา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('333', '02', 'เทียนทอง   ', 'บังศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('334', '02', 'อรศรี  ', 'แก้วอ่อน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('335', '03', 'สุภัคกาญจน์ ', 'ประกอบแสง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('336', '02', 'ชนาทิพย์  ', 'ดำพะธิก', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('337', '02', 'หทัยรัตน์   ', 'ปฏิพัทธ์ภักดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('338', '02', 'ปิยะดา   ', 'สารราษฎร์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('339', '02', 'ธัญพิมล   ', 'จันทร์ศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('340', '03', 'น้อมเนตร  ', 'วิเศษสังข์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('341', '02', 'สมพร', 'แก้วใส', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('342', '02', 'รัชนี', 'กัณหารินทร์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('343', '02', 'สากล', 'ธานี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('344', '02', 'สุจิตรา', 'ศรีสง่า', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('345', '02', 'อาวัสรี', 'บุญมั่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('346', '02', 'อรวรรณ์', 'มุณีรัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('347', '02', 'วาสนา', 'กุลวงศ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('348', '02', 'ศุภกานต์', 'รักวงศ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('349', '02', 'อังคณา', 'อุ่นคำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('350', '02', 'ชะโลม', 'ขอบังกลาง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('351', '03', 'สมาพร', 'บรรเทิงกุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('352', '01', 'อุดม   ', 'สารีมูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('353', '02', 'กาญจนา     ', 'บุญมงคล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('354', '02', 'เมตตา    ', 'ขัมภรัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('355', '02', 'มะลิวัลย์    ', 'ศรีชัย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('356', '01', 'วิชิต    ', 'แก้วหมอ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('357', '01', 'ชนภัทร    ', 'คำทา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('358', '05', 'นิสสัย   ', 'ศรไชย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('359', '01', 'ประมอญ    ', 'พิมพ์หล่อ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('360', '02', 'เฉลิมพร   ', 'จิรนภาวิบูลย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('361', '02', 'นาฎลดา', 'นำภา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('362', '01', 'ปรีชา', 'แก้วพิลา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('363', '01', 'ทวีจิตร   ', 'สารราษฎร์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('364', '01', 'พยุงศักดิ์', 'ฝางแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('365', '01', 'สกุลกิตต์', 'แก้วกุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('366', '01', 'วรพงษ์', 'เคนนาดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('367', '01', 'ถาวร', 'ทองผาย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('368', '01', 'วิระชัย', 'ศิระพรหม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('369', '03', 'สรัญญา', 'ดีล้น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('370', '03', 'อทิตยา', 'คำทวี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('371', '01', 'สมศักดิ์', 'หอมหวล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('372', '01', 'คำใหม่', 'ตะนะโส', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('373', '01', 'จุมพล', 'สาลีวัน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('374', '01', 'หัสชัย', 'ขุนรักษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('375', '01', 'ธีระพร', 'ทาตระกูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('376', '01', 'สถิตย์', 'สมพันธ์เพ็ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('377', '01', 'ชาญชัย', 'ชาวทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('378', '01', 'อุทัย', 'โคตรมนตรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('379', '01', 'สุระศักดิ์', 'ขจรฟุ้ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('380', '01', 'พงษ์พันธ์', 'ลัทธิวรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('381', '01', 'อภินันท์', 'หอมสมบัติ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('382', '01', 'ไพโรจน์', 'ชารี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('383', '01', 'อลงกรณ์', 'คำสุนี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('384', '01', 'ณัฐพงษ์', 'จันทะโคตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('385', '02', 'ศิริพร      ', 'ทุมเสน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('386', '02', 'ปราณี  ', 'เอกชนนิยม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('387', '02', 'ทวี', 'วิสาระพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('388', '01', 'สังคม    ', 'ภิญโญ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('389', '02', 'จีราภรณ์   ', 'ลาภาอุตย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('390', '02', 'จุรีรัตน์    ', 'สุธีร์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('391', '03', 'ศิวะพร   ', 'ไชยชนะ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('392', '02', 'พิศวาท    ', 'ศรีสอน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('393', '03', 'อมราภรณ์', 'ฝางแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('394', '01', 'จิตภัณฑ์', 'กมลรัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('395', '01', 'ต่อศักดิ์', 'ขันรักษา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('396', '01', 'บรรจง', 'บุญสวัสดิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('397', '01', 'ณรงค์', 'สารพิชญ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('398', '01', 'ชิงชัย', 'บุญสิงห์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('399', '01', 'กิตติ', 'นนท์พละ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('400', '01', 'ทศพล', 'สมเนตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('401', '01', 'นิคม', 'โสภะถา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('402', '01', 'ฐิติพงษ์', 'สีละวัน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('403', '01', 'ไพบูลย์', 'หาสุข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('404', '01', 'ธงฉัตร', 'แก้วตา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('405', '01', 'พิชานน', 'บุราไกร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('406', '01', 'เชาวลิตร', 'ตะนุมาตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('407', '02', 'ไพศรี    ', 'ขำคม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('408', '02', 'สิรินาฎ   ', 'รัชฎามาศ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('409', '01', 'สมชาย     ', 'ชัยอิทธิพร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('410', '01', 'วัฒนา   ', 'จันทรภูมี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('411', '01', 'วิโรจน์   ', 'จิตรเอื้อตระกูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('412', '02', 'อรุณี    ', 'รุ่งรัศมี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('413', '02', 'อุทิศศรี     ', 'เรืองบุตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('414', '02', 'อรสา     ', 'ศรีเสริม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('415', '02', 'เพ็ญนภา    ', 'อนุการ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('416', '02', 'ประนอม     ', 'แก้วกุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('417', '01', 'สิทธิ์      ', 'ศรไชย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('418', '01', 'จำนงค์', 'ทองไทย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('419', '01', 'หนูสินธ์', 'เจริญศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('420', '01', 'จิรชาติ', 'วานมนตรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('421', '01', 'สิทธิชัย', 'สุขเสริม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('422', '01', 'อมร', 'ผ่องแผ้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('423', '01', 'สมบัติ', 'ทองกลึง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('424', '01', 'ธีระยุทธ', 'ภูษา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('425', '01', 'ไพรัตน์', 'เผ่าภูรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('426', '01', 'วิชาญ', 'หนองแบก', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('427', '01', 'วีระชน', 'ธรรมรักษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('428', '01', 'ศักดิ์ณรงค์', 'ธานี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('429', '02', 'เทพนิมิตร    ', 'สนุกพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('430', '03', 'ภัทรีนาฏ    ', 'บุญชู', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('431', '02', 'จริยารัศมิ์   ', 'คามวัลย์ ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('432', '01', 'วราห์   ', 'ขำคม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('433', '01', 'อดุลย์    ', 'พุ่มโพธิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('434', '02', 'พิมพ์ชนก', 'หาคำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('435', '01', 'องอาจ', 'ธานี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('436', '02', 'สุภาพร    ', 'แก้วกุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('437', '01', 'อัครเดช   ', 'สุธีร์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('438', '03', 'อารีรัตน์', 'พรมวัลย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('439', '02', 'สมศรี', 'บุญเมตตา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('440', '01', 'บุญศรี', 'เผ่าภูรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('441', '01', 'สนอง', 'ยุบล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('442', '01', 'วิทยา', 'เยื่อใย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('443', '01', 'สมพร', 'มนัส', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('444', '01', 'รัตนศักดิ์', 'เกษมสุข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('445', '01', 'ชญานนท์', 'สายกนก', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('446', '01', 'กิตติพงษ์', 'ประยงค์หอม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('447', '01', 'เทียนชัย', 'พงษ์สถิตย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('448', '01', 'เอกพล', 'นิลวงษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('449', '01', 'คมสันต์', 'ไชยยันต์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('450', '01', 'ธวัชชัย', 'สายสุด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('451', '03', 'สำรวย    ', 'ส่งศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('452', '01', 'สุพรรณ ', 'การกล้า', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('453', '02', 'ศิริวัตร', 'ถนอมใจ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('454', '02', 'สมจิตร   ', 'วงศ์หอม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('455', '01', 'เบญเยี่ยม   ', 'ลาภาอุตย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('456', '02', 'พรพิศ    ', 'ทองไทย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('457', '02', 'วิไลรัตน์   ', 'บรรสุทธี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('458', '02', 'สมปอง   ', 'พรหมชุณห์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('459', '02', 'มยุรี', 'บุญหยาด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('460', '02', 'พัชรี   ', 'ศรีสังข์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('461', '01', 'บุญมี    ', 'วงศ์สายตา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('462', '02', 'มณีรัตน์    ', 'เผ่าภูรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('463', '01', 'สมบูรณ์', 'อินทร์ขาว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('464', '02', 'วรนุช', 'มิ่งบุญ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('465', '02', 'เกษกนก ', 'ดีสมสกุลพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('466', '01', 'บุญธรรม', 'พิมพ์สะ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('467', '01', 'ชาญชัย', 'กำแมด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('468', '01', 'วิทยา', 'ไชยสัตย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('469', '01', 'วิรัตน์', 'เชื้อพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('470', '01', 'สมภาร', 'วงษ์อุ่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('471', '01', 'ชัยวัฒน์', 'เยื่อใย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('472', '01', 'ฉวี', 'ผ่องแผ้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('473', '01', 'กรีพล', 'ชาวทอง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('474', '01', 'ธีระศักดิ์', 'วันดี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('475', '01', 'สรรเพชร', 'ไชยรักษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('476', '01', 'เอกรัตน์', 'เจริญศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('477', '01', 'อิสรา', 'แก่นการ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('478', '01', 'สมาน', 'บุญพั่ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('479', '01', 'ประดิษฐ์', 'ชาลี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('480', '01', 'เกียรติศักดิ์', 'สืบศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('481', '01', 'ศุภชัย', 'ทุมมัย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('482', '01', 'วีระยุทธ', 'โพธินิล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('483', '02', 'จิตรา    ', 'จินารัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('484', '02', 'จิรายุ     ', 'อิ่มแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('485', '01', 'ไหว   ', 'สะอาด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('486', '02', 'ชื่นฤทัย   ', 'พรมโพธิน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('487', '02', 'พนิดา   ', 'กองสุข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('488', '01', 'ไสว    ', 'เรืองบุตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('489', '02', 'เสาวภา    ', 'บุญวิทย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('490', '02', 'สังวาลย์    ', 'แก้วคำแพง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('491', '01', 'สมศักดิ์', 'พวงทวี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('492', '01', 'สถิตย์', 'ผาเวช', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('493', '01', 'สมเดช', 'แก้วมหา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('494', '01', 'มีชัย', 'เจริญสุข', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('495', '01', 'กฤตไชย', 'คำเชื้อ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('496', '01', 'ปรีชา', 'พุทธรักษา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('497', '03', 'ชบา', 'อ่อนสาร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('498', '03', 'นุชิดา', 'จินาพันธ์บุปผา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('499', '01', 'ธัญพิสิษฐ์', 'วรรณพงษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('500', '02', 'นิชนันท์   ', 'คำล้าน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('501', '02', 'อัจฉริยาภรณ์   ', 'สุพิชญ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('502', '02', 'กนกวรรณ', 'วงค์ขึง ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('503', '02', 'อังคณา', 'ชัยรักษ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('504', '02', 'หทัยรัตน์   ', 'ดิษฐ์อั๊ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('505', '02', 'สุภาภรณ์', 'ทองเบ็ญจมาศ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('506', '01', 'ธวัชชัย', 'พละศักดิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('507', '01', 'สืบสันต์', 'ประครองสิน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('508', '01', 'ประเทือง', 'มูลนาม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('509', '03', 'นุจรินทร์', 'สมใส', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('510', '03', 'อุบลวรรณ', 'สุภาสาย', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('511', '03', 'จันทร์นภา', 'อินทรีย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('512', '03', 'เยาวลักษณ์', 'น้อมกลาง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('513', '03', 'ปาริฉัตร', 'ศิริสุวรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('514', '01', 'รพีรัฐ', 'รัตนมูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('515', '01', 'อรชุน', 'เทียนแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('516', '01', 'อัครเดช      ', 'กลิ่นพิบูลย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('517', '02', 'ดารนี   ', 'ชัยอิทธิพร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('518', '02', 'โชติกา', 'ฤกษ์รัตน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('519', '02', 'เจียมใจ', 'มีคำนิตย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('520', '01', 'จรูญ', 'ประสาทศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('521', '01', 'ปวิชญา', 'อวยพร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('522', '01', 'ชาตรี', 'เนตรมณี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('523', '01', 'อนุสรณ์', 'คำสุนี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('524', '01', 'ณัฐนันท์', 'ดวงพุฒ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('525', '02', 'ยุพดี  ', 'พูลจิตต์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('526', '02', 'นราทิพย์', 'ลุผล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('527', '01', 'ฉลอง', 'ปากวิเศษ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('528', '01', 'ถวิล', 'รินรุด', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('529', '02', 'ณัฐิยาพร', 'กาญบรรจง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('530', '02', 'ปาริชาติ', 'ภิญโญ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('531', '02', 'จำปา', 'ยืนมั่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('532', '01', 'นิกร', 'จอมโคตร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('533', '02', 'เพียงพิศ', 'สมคะเณย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('534', '01', 'สมคิด', 'ไชยวรรณ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('535', '02', 'พิสมัย', 'ชามาตย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('536', '02', 'รวิสรา', 'เงาเพ็ชร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('537', '01', 'วิทยา', 'นิ่งนาน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('538', '01', 'สุพรรณ', 'วงษ์พินิจ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('539', '03', 'สาวหทัยทิพย์', 'นาคำ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('540', '01', 'จักรวรรดิ์', 'บุญไพโรจน์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('541', '02', 'ศิริพร', 'สารีมูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('542', '01', 'ศุภวุฒิ', 'วงษ์อุ่น', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('543', '01', 'ชัยชาญ', 'ตามไท', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('544', '02', 'สมรักษ์', 'วาลี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('545', '01', 'พรรษวรรษ', 'ศรัณยธาดาวงศ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('547', '01', 'ณัฐวุฒิ', 'พูลเพิ่ม', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('548', '01', 'กชพงศ์', 'สารการ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('549', '02', 'กมลทิพย์', 'สงวนรัมย์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('550', '03', 'รุ่งทิวา', 'คูณสวัสดิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('551', '01', 'ริญญู', 'สุจิบาล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('552', '03', 'นิติกานต์', 'ซาเสน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('553', '03', 'ศรินประภา', 'ชนารี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('554', '01', 'อุทัย', 'วันโท', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('555', '01', 'วิเชียร', 'ใจศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('556', '03', 'ศิริจันทร์', 'สุขใจ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('557', '03', 'สวามินี', 'บังศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('558', '01', 'สมผล', 'บุญสวาสดิ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('559', '03', 'ณัฏฐณิชา', 'สุภาพ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('560', '03', 'ทิพยงค์', 'วงษาสันต์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('561', '01', 'พิมลจิตร', 'ภูมิพันธ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('562', '02', 'สุวณี', 'ศิริบูรณ์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('563', '01', 'ธวัชชัย', 'วีระศิลป์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('564', '01', 'พนม', 'เมืองแสน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('565', '01', 'สมชาย', 'เงาเพ็ชร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('566', '01', 'สมานมิตร', 'แก้วกุล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('567', '02', 'ปราณี', 'เทียมทัน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('568', '02', 'ขนิษฐา', 'กอแก้ว', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('569', '02', 'บุญช่วย', 'ไนยะกูล', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('570', '03', 'อุษณีย์', 'สิทธิเศษ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('571', '02', 'จินตนา', 'ลี้จงเพิ่มพูน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('572', '02', 'สุพัตรา', 'สุขาวห', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('573', '02', 'รุ้งมณี', 'ยิ่งยืน', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('574', '01', 'สินชัย', 'เจริญศรี', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('575', '01', 'นันทวัฒน์', 'โคตรเจริญ', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('576', '03', 'วงเดือน  ', 'คนกล้า', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('577', '01', 'วาที', 'วันเพ็ง', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('578', '01', 'อรรถกร', 'วงศ์อนันต์', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('579', '01', 'สมควร', 'ประดา', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('580', '03', 'แก้วเฉลียว', 'แพทย์เพียร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('581', '03', 'คณิตตา', 'เงาเพ็ชร', NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('582', '01', 'อัครเดช', 'อาจสม', NULL, NULL, NULL, NULL, NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` varchar(3) NOT NULL,
  `position_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`) VALUES
('20', 'ช่างไฟฟ้า'),
('17', 'ช่างไม้'),
('99', 'ช่างไม้ครุภัณฑ์'),
('200', 'ตำแหน่ง 1'),
('201', 'ตำแหน่ง 2'),
('202', 'ตำแหน่ง 3'),
('203', 'ตำแหน่ง 4'),
('204', 'ตำแหน่ง 5'),
('205', 'ตำแหน่ง 6'),
('44', 'ทันตแพทย์'),
('94', 'นักการภารโรง'),
('40', 'นักการแพทย์แผนไทย'),
('64', 'นักกิจกรรมบำบัด '),
('28', 'นักจัดการงานทั่วไป '),
('08', 'นักจัดการงานทั่วไปชำนาญการพิเศษ'),
('55', 'นักจิตวิทยา'),
('54', 'นักจิตวิทยาคลินิก'),
('83', 'นักประชาสัมพันธ์ '),
('77', 'นักวิชาการคอมพิวเตอร์ '),
('23', 'นักวิชาการเงินและบัญชี'),
('48', 'นักสังคมสงเคราะห์'),
('65', 'นักเทคนิคการแพทย์'),
('32', 'นักโภชนาการ'),
('09', 'นายช่างเครื่องกล'),
('37', 'นายแพทย์'),
('88', 'บรรณารักษ์ '),
('18', 'ผู้ช่วยช่างทั่วไป'),
('80', 'ผู้ช่วยนักวิจัย '),
('71', 'ผู้ช่วยเหลือคนไข้'),
('41', 'ผู้ช่วยแพทย์แผนไทย'),
('78', 'ผู้ดูแลระบบคอมพิวเตอร์  '),
('01', 'ผู้อำนวยการโรงพยาบาล'),
('29', 'พนักงานการเงินและบัญชี '),
('13', 'พนักงานขับรถยนต์'),
('35', 'พนักงานช่วยเหลือคนไข้  '),
('97', 'พนักงานซักฟอก'),
('98', 'พนักงานตัดเย็บผ้า'),
('70', 'พนักงานทั่วไป '),
('19', 'พนักงานธุรการ'),
('92', 'พนักงานประจำตึก'),
('63', 'พนักงานประจำห้องยา '),
('31', 'พนักงานพัสดุ'),
('14', 'พนักงานพิมพ์'),
('95', 'พนักงานพิมพ์ดีด'),
('36', 'พนักงานรับรอง '),
('85', 'พนักงานรับโทรศัพท์ '),
('89', 'พนักงานอาชีวบำบัด'),
('86', 'พนักงานโสตทัศนศึกษา  '),
('38', 'พยาบาลวิชาชีพ'),
('75', 'พยาบาลเทคนิค'),
('05', 'รองผู้อำนวยการด้านการพยาบาล'),
('02', 'รองผู้อำนวยการด้านการแพทย์ 1'),
('07', 'รองผู้อำนวยการด้านการแพทย์ 2'),
('04', 'รองผู้อำนวยการด้านบริหาร'),
('06', 'รองผู้อำนวยการด้านยุทธศาสตร์และการพัฒนา'),
('03', 'รองผู้อำนวยการด้านสุขภาพจิตชุมชน'),
('100', 'ลูกมือช่าง'),
('45', 'เจ้าพนักงานทันตสาธารณสุข'),
('82', 'เจ้าพนักงานธุรการ '),
('24', 'เจ้าพนักงานพัสดุ'),
('66', 'เจ้าพนักงานรังสีการแพทย์'),
('87', 'เจ้าพนักงานห้องสมุด'),
('11', 'เจ้าพนักงานอาชีวบำบัด'),
('62', 'เจ้าพนักงานเภสัชกรรม '),
('69', 'เจ้าพนักงานเวชสถิติ'),
('12', 'เจ้าพนักงานโสตทัศนศึกษา'),
('27', 'เจ้าหน้าที่บริหารงานทั่วไป '),
('102', 'เจ้าหน้าที่บันทึกข้อมูล'),
('57', 'เภสัชกร'),
('84', 'เว็ปมาสเตอร์  '),
('91', 'แม่บ้าน'),
('79', 'โปรแกรมเมอร์   '),
('33', 'โภชนากรอาวุโส');

-- --------------------------------------------------------

--
-- Table structure for table `prefix`
--

CREATE TABLE `prefix` (
  `prefix_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'รหัสคำนำหน้านาม',
  `prefix_name` varchar(50) DEFAULT NULL COMMENT 'คำนำหน้านาม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prefix`
--

INSERT INTO `prefix` (`prefix_id`, `prefix_name`) VALUES
('01', 'นาย'),
('02', 'นาง'),
('03', 'นางสาว'),
('04', 'ว่าที่ร้อยตรี'),
('05', 'จ่าเอก'),
('06', 'เด็กชาย'),
('07', 'เด็กหญิง'),
('08', 'ร้อยตำรวจเอก'),
('09', 'พลตรี'),
('10', 'พลโท'),
('11', 'พลเอก'),
('12', 'สิบตำรวจตรี'),
('13', 'เด็กหญิง'),
('14', 'ร้อยตำรวจเอก'),
('15', 'พลตรี'),
('16', 'พลโท'),
('17', 'พลเอก'),
('18', 'สิบตำรวจตรี');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `expire` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `expire`, `data`) VALUES
('c11eundv38qtfg21d9a50i3gv5', 1509284480, 0x5f5f666c6173687c613a303a7b7d5f5f72657475726e55726c7c733a32303a222f796969327265706f72742f6261636b656e642f223b5f5f69647c693a313b);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_activation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `status`, `auth_key`, `password_reset_token`, `account_activation_token`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', '$2y$13$e1ZzdClOEwI/bkTmcwRSheUUBBdaGOfgNLOiH8ORWSMKCwI3KiM0u', 10, 'H_kl3d8692pfJJFXNoCOjhp4KlizsWv1', NULL, NULL, 1451274599, 1451274599);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `prefix_id` (`prefix_id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`),
  ADD UNIQUE KEY `position_name` (`position_name`);

--
-- Indexes for table `prefix`
--
ALTER TABLE `prefix`
  ADD PRIMARY KEY (`prefix_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`prefix_id`) REFERENCES `prefix` (`prefix_id`),
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`),
  ADD CONSTRAINT `person_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
