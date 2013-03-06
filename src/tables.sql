DROP TABLE tb_article;
DROP TABLE tb_message;
DROP TABLE tb_site;
DROP TABLE tb_album;
DROP TABLE tb_photo;
DROP TABLE tb_album_photo;

/***创建表结构***/
--文章
CREATE TABLE tb_article (id      BIGINT GENERATED ALWAYS AS IDENTITY ( START WITH 1, INCREMENT BY 1),
                         title   VARCHAR(255),
                         content LONG VARCHAR,
                         post    VARCHAR(200)
);
--留言
CREATE TABLE tb_message (id      BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
                         sender  VARCHAR(233),
                         email   VARCHAR(200),
                         content LONG VARCHAR,
                         date    VARCHAR(100)
);

--网址收藏
CREATE TABLE tb_site (id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY, title VARCHAR(200), url VARCHAR(500));

/**相册功能相关表：
   tb_album
   tb_photo
   tb_album_photo
**/
-- 相册表
CREATE TABLE tb_album (id BIGINT GENERATED ALWAYS AS IDENTITY, name VARCHAR(50), createDate VARCHAR(30), photoList BIGINT);
-- 相片
CREATE TABLE tb_photo (id BIGINT GENERATED ALWAYS AS IDENTITY,descr VARCHAR(100), filename VARCHAR(200), albumId BIGINT);
-- 相册和相片关系表
CREATE TABLE tb_album_photo (id BIGINT GENERATED ALWAYS AS IDENTITY, albumId BIGINT, photoId BIGINT);

/****插入数据 ***/
INSERT INTO tb_article (title, content, post) VALUES ('如玫瑰般华丽的生活 ', '有多少人曾经幻想能够拥有一个如玫瑰般华丽的生活？周围的一切都是如此唯美、精致，连空气中都带着如玫瑰一般浓郁的芬芳。如玫瑰般华丽的生活，你是否也想拥有呢？', '2013');
INSERT INTO tb_article (title, content, post) VALUES ('我们一起走过的青春 再也不会遇见 ', '<span > 每一个人都有青春，每一个青春都有一个故事， 每个故事都有一个遗憾，每个遗憾都有回味不尽的美。 每个人总有点什么事，是想忘也忘不了的 ——《匆匆那年》 当年的喜欢就是这么平淡而简单， 电影胶片中或欢喜圆满或凄美动人的爱情故事， 在他们眼里都当不了真，他们总认为自己会经历与众不同的恋爱， 以为这样无所事事的日子会一直继续下去。 然而，一直到长大以后他们才发现，原来还是在岁月里落入俗套 那时每天都陪伴在身边的人也终究各奔东西。 </span></div> <div align="left"><span >那时候不说爱，爱是多么遥远、多么沉重的字眼啊。&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<br/> 只说喜欢，就算喜欢也是偷偷摸摸的。<br/> 我们都以为长大以后就能真正的永远相伴，<br/> 于是不惜一切代价地拼命成长，<br/> 但是当真的长到足以告别青春时，<br/> 才突然发现，原来长大只会让我们分离。</span></div> <div align="left"><span >长大了之后总会学不一样的功课，<br/> 走不一样的路，遇见不一样的人，<br/> 我们根本避免不了分道而行的命运。<br/> 遥想起当年怎样怎样，才发现原来我们已然长大，<br/> 也有了所谓的曾经，也有了故事可讲。<br/> 我想我们谁也不能再回到从前，<br/> 离开彼此之后我们都会继续各自的人生。<br/> 而在其中可能谁也不会再出现。</span></div> <div align="left"><span >但是这并不代表遗忘，<br/> 也许我们会把对方好好地放在心里，留着那曾经的青春印记。<br/> 据说，所有男孩子在发誓的时候，都是觉得自己一定不会违背承诺，<br/> 而在反悔的时候也都是真的觉得自己不能做到，<br/> 所以誓言这种东西无法衡量坚贞，也不能判断对错，<br/> 它只能证明，在说出来的那一刻，彼此曾经真诚过。</span></div> <br/> <div align="left"><span >其实我一直记得的有一个男孩子，<br/> 曾经信誓旦旦的在面前说下会在一起很久很久。<br/> 重复了两遍的很久，终究还是没能长久。<br/> 即使后来相当长的一段时间里一直想不明白，<br/> 一直说服不了自己放过自己却也不再执着了。<br/> 放过彼此，放过自己。</span></div> <div align="left"><span >有不止一个两个的人说着会永远陪伴。<br/> 只是后来的日子里，出现的频率渐渐的少了，<br/> 于是联系逐渐不再，少了当初一定要在一起时的那份坚持，<br/> 想不明白的还是不明白，只是少了一定要弄明白的不可。</span></div> <div align="left"><span >其实做好朋友挺好的，可进可退。<br/> 可是即使如此还是会有伤害，会有难过的不开心的。<br/> 那是一种特别不愉快的情绪。<br/> 那个一直说喜欢并且坚持了七年的男孩子，<br/> 一次又一次的出现了消失，消失了出现。<br/> 一段时间里频繁的出现，后来被伤了心，默默的隐退了很久。<br/> 却在某一天，措手不及的出现。<br/> 你以为他终于放弃了，可是似乎却更加的坚定了。<br/> </span> ', '2013');

INSERT INTO tb_message (sender, email, content, date) VALUES ('LiTai', 'loyy@gmail.com', '你好~', '2012-04-03 12:32:32');

INSERT INTO tb_site (title, url) VALUES ('google', 'www.google.com.hk');



insert into tb_album(name,createDate,photoList) values('2013春游','2013-2-2',null);
insert into tb_photo(descr,filename,albumId) values('fun','chunyou1.jpg',0);
insert into tb_album_photo(albumId,photoId) values(1,1);


