create database create_demo_db;

use create_demo_db;

create table students
(
    student_id int primary key,
    name varchar(30),
    age int,
    email varchar(50)
);

insert into students values
(155, "Anny Reddy", 16, "annyreddy12@gmail.com"),
(156, "Binny Mahto", 16, "mahtobinny031@gmail.com"),
(157, "Simpi Waliya", 18, "waliyasimpi@outlook.com"),
(158, "Animesh Kumar", 21, "kumaranimeshwrl@gmail.com"),
(159, "Surendra Prasad", 25, "prasadsurendra9112@gmail.com"),
(160, "Sanjay Lakra", 22, "sanjaylucky@gmail.com"),
(161, "Golu Katariya", 24, "golukatariya12874@gmail.com"),
(162, "Solanki Bansal", 24, "bansalsolanki@gmail.com"),
(163, "Anurag Kishore", 25, "anukishore88@gmail.com"),
(164, "Arvind Menon", 26, "arvindmenon98@gmail.com"),
(165, "Priya Nair", 23, "priyanair001@gmail.com"),
(166, "Rajesh Iyer", 27, "rajesh.iyer1997@gmail.com"),
(167, "Ananya Reddy", 22, "ananyareddy327@gmail.com"),
(168, "Vikram Rao", 28, "vikram.rao9618@gmail.com"),
(169, "Amit Sharma", 28, "amit_sharma97@yahoo.com"),
(170, "Priya Kaur", 25, "priya.kaur.2000@outlook.com"),
(171, "Rahul Verma", 30, "rahulv1995@rediffmail.com"),
(172, "Ananya Singh", 24, "ananya_singh2001@protonmail.com"),
(173, "Vikram Thakur", 27, "vikramthakur98@icloud.com"),
(174, "Neha Kapoor", 26, "neha-kapoor99@hotmail.com"),
(175, "Rajesh Patel", 29, "rajeshpatel.1996@inbox.com"),
(176, "Pooja Desai", 23, "poojadesai2002@zoho.com"),
(177, "Siddharth Rao", 31, "siddharth_rao94@yandex.com"),
(178, "Kavita Solanki", 25, "kavitassolanki@mail.com"),
(179, "Sourav Banerjee", 27, "sourav_banerjee98@fastmail.com"),
(180, "Mitali Das", 24, "mitali.das.2001@tutanota.com"),
(181, "Abhishek Choudhury", 30, "abhishek_choudhury@live.com"),
(182, "Rina Dey", 26, "rina_dey99@gmx.com"),
(183, "Arjun Reddy", 28, "arjun_reddy97@disroot.org"),
(184, "Meenakshi Iyer", 25, "meenakshi.iyer@riseup.net"),
(185, "Vijay Menon", 32, "vijaymenon1993@aol.com"),
(186, "Latha Nair", 29, "latha.nair.96@ymail.com"),
(187, "Karthik Pillai", 26, "karthikpillai@proton.me"),
(188, "Rohan Boro", 25, "rohanboro2000@mailfence.com"),
(189, "Anjali Devi", 23, "anjali_devi2002@ctemplar.com"),
(190, "Bikram Singh", 30, "bikramsingh1995@skiff.com"),
(191, "Sangita Chhetri", 27, "sangita_chhetri@tuta.io"),
(192, "Rajiv Gogoi", 28, "rajivgogoi97@startmail.com"),
(193, "Moni Das", 24, "moni-das2001@countermail.com"),
(194, "Joydeep Barman", 29, "joydeepbarman96@runbox.com"),
(195, "Lalita Saikia", 26, "lalita_saikia99@mailbox.org"),
(196, "Sanju Yadav", 27, "sanjuyadav98@keemail.me"),
(197, "Kiran Pawar", 25, "kiranpawar2000@cock.li");

-- selection command
select * from students;

-- projection command
select name, email from students;

select student_id, name, email from students;