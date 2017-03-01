delete from jeuxplateforme where idjeuxplateforme>50;
delete from jeux where idjeux>50;
delete from plateforme where idplateforme>50;
delete from categorie where idcategorie>50;
delete from client where idclient>50;


insert into client values(1,'Mamy Aiglon','Lot IVB Ankadifotsy','mamyaiglon@gmail.com',md5('mamyaiglon'));
insert into client values(2,'Rasolofomanana Aiglon','Lot IVB Ankaditoha','rasolofomananaaiglon@gmail.com',md5('rasolofomananaaiglon'));
insert into client values(3,'Aiglon Marc','Lot IVB Ankadimbahoaka','aiglonmarc@gmail.com',md5('aiglonmarc'));
insert into client values(4,'James Bond','Lot IVB Ankatso','jamesbond@gmail.com',md5('jamesbond'));


insert into categorie values(1,'Arcade');
insert into categorie values(2,'Course');
insert into categorie values(3,'Simulation');
insert into categorie values(4,'Strategie');


insert into jeux values(1,1,'Fast and Furious showdown','Vivez la scene de Fast and Furious 6',2,'10-10-2015');
insert into jeux values(2,4,'Age of Empire III','Construisez votre arme,defendez votre empire et detruisez les ennemies',8,'10-10-2014');
insert into jeux values(3,3,'Fligth simulator','Ayez l experience d un pilote avec toutes les sensations dans le cocpite',1,'10-10-2015');
insert into jeux values(4,2,'Need for Speed underground 2','Amateur de voiture de sport voici l ideal pour vous',4,'10-10-2015');


insert into plateforme values(1,'PC');
insert into plateforme values(2,'PS3');
insert into plateforme values(3,'PS4');
insert into plateforme values(4,'XBOX ONE');
insert into plateforme values(5,'XBOX 360');


insert into jeuxplateforme values(1,1,1,2,12000);
insert into jeuxplateforme values(2,1,2,1,15000);
insert into jeuxplateforme values(3,1,3,12000);
insert into jeuxplateforme values(4,3,1,2,12000);
insert into jeuxplateforme values(5,4,5,1,15000);


