REM   Script: Insert Data in Tables
REM   Insert Data in Tables

INSERT INTO USERS  
VALUES 
    (1, 'rares_gherasim', 'lorep_ipsum', TO_DATE('2018/07/09', 'yyyy/mm/dd'), 'ADMIN',  TO_DATE('2000/11/04', 'yyyy/mm/dd'), '+40746018999','Gherasim', 'Rares');

INSERT INTO USERS  
VALUES 
    (2, 'roberta_voinea', 'lorep_ipsum', TO_DATE('2019/03/15', 'yyyy/mm/dd'), 'COLAB',  TO_DATE('2000/12/12', 'yyyy/mm/dd'), '+40753264353','Voinea', 'Roberta');

INSERT INTO USERS  
VALUES 
    (3, 'matei_corvin', 'lorep_ipsum', TO_DATE('2020/07/15', 'yyyy/mm/dd'), 'CUSTOMER',  TO_DATE('1999/10/06', 'yyyy/mm/dd'), '+40712345678','Corvin', 'Matei');

INSERT INTO USERS  
VALUES 
    (4, 'sandu_sebastian', 'lorep_ipsum', TO_DATE('2021/01/05', 'yyyy/mm/dd'), 'CUSTOMER',  TO_DATE('2001/05/23', 'yyyy/mm/dd'), '+40787654321','Sandu', 'Sebastian');

INSERT INTO USERS  
VALUES 
    (5, 'alexandra_topliceanu', 'lorep_ipsum', TO_DATE('2015/09/20', 'yyyy/mm/dd'), 'CUSTOMER',  TO_DATE('2001/01/01', 'yyyy/mm/dd'), '+40787655678','Topliceanu', 'Alexandra');

INSERT INTO USERS  
VALUES 
    (6, 'moldovan_iulian', 'lorep_ipsum', TO_DATE('2008/06/20', 'yyyy/mm/dd'), 'CUSTOMER',  TO_DATE('2005/10/04', 'yyyy/mm/dd'), '+40712344321','Moldovan', 'Iulian');

INSERT INTO USERS  
VALUES 
    (7, 'paun_andrei', 'lorep_ipsum', TO_DATE('1996/06/03', 'yyyy/mm/dd'), 'COLAB',  TO_DATE('2000/12/01', 'yyyy/mm/dd'), '+40742131234','Paun', 'Andrei');

INSERT INTO USERS  
VALUES 
(8, 'Florian_gherasim', 'lorep_ipsum', TO_DATE('2018/07/09', 'yyyy/mm/dd'), 'ADMIN',  TO_DATE('2002/10/03', 'yyyy/mm/dd'), '+40746012349','Gherasim', 'Florian');

INSERT INTO CATEGORIES 
VALUES 
    (1, 1, 'Action');

INSERT INTO CATEGORIES 
VALUES 
    (2, 1, 'Adventure');

INSERT INTO CATEGORIES 
VALUES 
    (3, 1, 'RPG');

INSERT INTO CATEGORIES 
VALUES 
    (4, 1, 'Shooting');

INSERT INTO CATEGORIES 
VALUES 
    (5, 8, 'VR');

INSERT INTO CATEGORIES 
VALUES 
    (6, 8, 'Logic');

INSERT INTO PRODUCTS 
VALUES  
    (1, 3, 7, 'Minecraft', 29.99, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus erat.', null);

INSERT INTO PRODUCTS 
VALUES  
    (4, 1, 2, 'Fortnite', 49.99, 'Nam ex libero, vehicula non facilisis euismod, suscipit eget odio.', 50);

INSERT INTO PRODUCTS 
VALUES  
    (2, 3, 2, 'GTA V', 99.99, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 100);

INSERT INTO PRODUCTS 
VALUES  
    (3, 6, 7, 'Logic', 9.99, 'Fusce eget consequat felis. Sed nec neque eget', 9999);

INSERT INTO PRODUCTS 
VALUES  
    (5, 2, 7, 'World of Warcraft', 59.99, 'Cras nunc massa, maximus ut ligula et', 10);

INSERT INTO PRODUCTS 
VALUES  
    (6, 2, 2, 'The Withcer Wild Hunt', 29.99, 'Quisque at laoreet elit, bibendum volutpat lectus.', 30);

INSERT INTO COMMENTS 
VALUES 
    (1, 2, 6, 'Cel mai fain joc de pe planeta.', 4);

INSERT INTO COMMENTS 
VALUES 
    (2, 2, 5, 'Nu imi place.', 1);

INSERT INTO COMMENTS 
VALUES 
    (3, 2, 4, 'Excelent job.', 5);

INSERT INTO COMMENTS 
VALUES 
    (4, 4, 6, 'Joc zilnic cu prietenii si totul este super.', 5);

INSERT INTO COMMENTS 
VALUES 
    (5, 3, 4, 'Nu are logica deloc.', 1);

INSERT INTO ORDERS 
VALUES 
    (1, 3, TO_DATE('2021/01/01', 'yyyy/mm/dd'), 'CARD', 'Fusce eget consequat felis. Sed nec neque eget', TO_DATE('2021/01/05', 'yyyy/mm/dd'), 'Done');

INSERT INTO ORDERS 
VALUES 
    (2, 4, TO_DATE('2020/11/10', 'yyyy/mm/dd'), 'NUMERAR', 'DSGDGSASDFASDASFAFS. Sed nec neque eget', TO_DATE('2020/11/14', 'yyyy/mm/dd'), 'Done');

INSERT INTO ORDERS 
VALUES  
    (3, 4, TO_DATE('2020/12/25', 'yyyy/mm/dd'), 'NUMERAR', 'DSGDGSASDFASDASFAFS. Sed nec neque eget', TO_DATE('2021/01/05', 'yyyy/mm/dd'), null);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 5, 2, 3);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 2, 2, 4);

INSERT INTO CART_ITEMS 
VALUES 
    (3, 2, 1, 5);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 3, 2, 1);

INSERT INTO CART_ITEMS 
VALUES 
    (3, 5, 1, 2);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 6, 2, 10);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 2, 2, 7);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 5, 3, 6);

INSERT INTO CART_ITEMS 
VALUES 
    (3, 3, 1, 5);

INSERT INTO CART_ITEMS 
VALUES 
    (3, 6, 1, 4);

INSERT INTO CART_ITEMS 
VALUES 
    (3, 4, 1, 3);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 6, 3, 2);

INSERT INTO CART_ITEMS 
VALUES 
    (4, 3, 3, 12);

INSERT INTO CART_ITEMS 
VALUES 
    (3, 1, null, 1);

INSERT INTO CART_ITEMS 
VALUES 
    (5, 3, null, 3);

INSERT INTO CART_ITEMS 
VALUES 
    (5, 2, null, 10);

