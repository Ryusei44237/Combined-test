CREATE DATABASE application;

use application;

CREATE TABLE account(

    id int(255) AUTO_INCREMENT, /**アカウント識別番号**/
    name VARCHAR(256),          /**アカウント名**/
    mail VARCHAR(256),          /**メールアドレス**/
    password VARCHAR(256),      /**パスワード**/
    birthday date,              /**生年月日**/
    tell VARCHAR(256),          /**電話番号**/
    token VARCHAR(256),         /**ログイン情報保持**/
    create_at DATETIME,             /**作成日時**/
    update_at date,             /**更新日時**/
    userimg VARCHAR(256),
    UNIQUE(name),
    PRIMARY KEY(id)

);



CREATE TABLE post(

    id int(255) AUTO_INCREMENT, /**投稿ID**/
    account_name VARCHAR(256),
    contents VARCHAR(256),      /**投稿内容**/
    img MEDIUMBLOB,             /**画像**/
    tags_id int(255),           /**投稿タグ**/
    account_id int(255),        /**アカウントID**/
    address VARCHAR(256),       /**投稿場所**/
    create_at DATETIME,             /**作成日時**/
    PRIMARY KEY(id)

);


CREATE TABLE tags(

    id int(255),                /**タグ識別**/
    name VARCHAR(256),          /**タグ名が重複しないように**/
    UNIQUE(name),
    PRIMARY KEY(id)

);


CREATE TABLE post_tags(

    id int(255) AUTO_INCREMENT, /**タグ紐づけ識別**/
    post_id int(255),           /**タグがつけられた記事のID**/
    tags_id int(255),           /**記事につけられたタグのID**/
    PRIMARY KEY(id)

);


CREATE TABLE follows(

    id int(255) AUTO_INCREMENT,
    account_id int(255),
    follow int(255),
    PRIMARY KEY(id)

);


/**テスト**/
INSERT INTO account VALUE(1,'test','test@morijyobi.ac.jp','testaccount','2020-01-01','08012345678','','2020-08-08','2020-09-09'),
(2,'test2','test@morijyobi.ac.jp','testaccount','2020-01-01','08012345678','','2020-08-08','2020-09-09');
INSERT INTO account(name, mail, password, birthday, tell, token, create_at, update_at) VALUE('test','test@morijyobi.ac.jp','testaccount','2020-01-01','08012345678','','2020-08-08','2020-09-09');
/**テストアカウント**/

INSERT INTO post(contents, img, tags_id, account_id, address, create_at) VALUE('台風災害','',1,1,'xxxxx','2020-10-10'),('地震災害','',2,2,'xxxxx','2020-10-10'),('地震災害','',2,2,'xxxxx','2020-10-10');

INSERT INTO post VALUE(1,'台風災害','',1,1,'xxxxx','2020-10-10');
INSERT INTO tags VALUE(1,'台風'),(2,'地震'),(3,'津波'),(4,'洪水');

INSERT INTO post_tags VALUE(1,1,1);

alter table post add index id(id);
alter table tags add index id(id);


SELECT post.id, post.contents, tags.name FROM post
LEFT JOIN post_tags ON post.id =  post_tags.post_id
LEFT JOIN tags ON post_tags.tags_id = tags.id
WHERE tags.id = 1;


FOREIGN KEY(post_id) REFERENCES post(id),
    FOREIGN KEY(tags_id) REFERENCES tags(id)

