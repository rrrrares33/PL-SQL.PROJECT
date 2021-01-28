REM   Script: PROCEDURES_FUNCTIONS_TRIGGERS
REM   PROCEDURES, FUNCTIONS AND TRIGGERS.

CREATE OR REPLACE PROCEDURE bigger_price_than(nr PRODUCTS.product_price%TYPE) 
    IS 
        TYPE tablou_indexat IS TABLE OF PRODUCTS%ROWTYPE 
            INDEX BY PLS_INTEGER; 
        produse tablou_indexat; 
BEGIN 
    SELECT * BULK COLLECT INTO PRODUSE 
    FROM PRODUCTS 
    WHERE PRODUCT_PRICE > NR 
    ORDER BY PRODUCT_PRICE; 
    FOR i in produse.first..produse.last LOOP 
        IF PRODUSE.EXISTS(i) THEN 
            DBMS_OUTPUT.PUT_LINE(PRODUSE(i).product_id || '  ' || PRODUSE(i).product_price); 
        END IF; 
    END LOOP; 
END; 
/

DECLARE 
    nr PRODUCTS.product_price%TYPE := 40; 
BEGIN 
    bigger_price_than(nr); 
END; 
/

DROP PROCEDURE BIGGER_PRICE_THAN;

CREATE OR REPLACE PROCEDURE CATEG_AND_NR 
IS 
    CURSOR C IS 
        SELECT category_name nume, COUNT(product_id) nr 
        FROM CATEGORIES c, PRODUCTS p 
        WHERE c.category_id = p.category_id(+) 
        GROUP BY category_name 
        ORDER BY category_name; 
    var_name categories.category_name%type; 
    var_nr int; 
BEGIN 
    OPEN C; 
    LOOP 
        FETCH C INTO VAR_NAME, VAR_NR; 
        EXIT WHEN C%NOTFOUND; 
        IF (VAR_NR = 0) THEN 
            DBMS_OUTPUT.PUT_LINE('Categoria ' || VAR_NAME || ' nu conține produse.'); 
        ELSIF (VAR_NR = 1) THEN 
            DBMS_OUTPUT.PUT_LINE('Categoria ' || VAR_NAME || ' conține un singur produs.'); 
        ELSE 
            DBMS_OUTPUT.PUT_LINE('Categoria ' || VAR_NAME || ' conține ' || VAR_NR || ' produse.'); 
        END IF; 
    END LOOP; 
END; 
/

BEGIN 
    CATEG_AND_NR; 
END; 
/

DROP PROCEDURE CATEG_AND_NR;

CREATE OR REPLACE FUNCTION CATEG_PROD_COMM(nume_cat categories.category_name%type) 
RETURN INTEGER IS 
    TYPE vector IS VARRAY(20) OF NUMBER(4); 
    id_produse vector; 
    numar NUMBER(4); 
    aux NUMBER(4); 
    id_categorie categories.category_id%type; 
    exista_categoria EXCEPTION; 
    mai_multe_cu_acelasi_nume EXCEPTION; 
    are_produse EXCEPTION; 
    PROD_NU_AU_COMM EXCEPTION; 
BEGIN 
    numar := 0; 
    SELECT COUNT(CATEGORY_NAME) into numar 
    FROM CATEGORIES 
    WHERE CATEGORY_NAME = NUME_CAT; 
     
    IF (numar = 0) THEN RAISE exista_categoria; 
    ELSIF (numar > 1) THEN RAISE mai_multe_cu_acelasi_nume; 
    end if; 
    numar := 0; 
     
    SELECT CATEGORY_ID into id_categorie 
    FROM CATEGORIES 
    WHERE CATEGORY_NAME = nume_cat; 
     
    SELECT count(*) INTO NUMAR 
    FROM PRODUCTS 
    WHERE CATEGORY_ID = ID_CATEGORIE; 
     
    IF (numar = 0) THEN RAISE are_produse; 
    END IF; 
     
    SELECT PRODUCT_ID BULK COLLECT INTO id_produse 
    FROM PRODUCTS 
    WHERE CATEGORY_ID = id_categorie; 
     
     
    numar := 0; --retin maximul in el 
    FOR i in id_produse.first..id_produse.last LOOP 
        aux := 0; 
        SELECT COUNT(*) into AUX 
        FROM COMMENTS 
        WHERE PRODUCT_ID = id_produse(i); 
        IF (AUX > NUMAR) THEN 
            NUMAR := AUX; 
        END IF; 
    END LOOP; 
     
    IF (NUMAR = 0) THEN RAISE PROD_NU_AU_COMM; 
    END IF; 
     
    RETURN NUMAR; 
     
    EXCEPTION 
        WHEN exista_categoria THEN 
            DBMS_OUTPUT.PUT_LINE('Nu exista categoria cautata.'); 
            RETURN -1; 
        WHEN mai_multe_cu_acelasi_nume THEN 
            DBMS_OUTPUT.PUT_LINE('Exista mai multe categorii cu acest nume.'); 
            RETURN -1; 
        WHEN are_produse THEN 
            DBMS_OUTPUT.PUT_LINE('Categoria cerută nu are produse.'); 
            RETURN -1; 
        WHEN PROD_NU_AU_COMM THEN 
            DBMS_OUTPUT.PUT_LINE('Niciun produs din categoria ceruta nu are comentarii.'); 
            RETURN -1; 
END; 
/

BEGIN 
    DBMS_OUTPUT.PUT_LINE(CATEG_PROD_COMM('Action')); 
END;
/

DROP FUNCTION CATEG_PROD_COMM;

CREATE OR REPLACE PROCEDURE EX9(nume USERS.last_name%type , prenume USERS.first_name%type, telefon USERS.phone_number%type) 
IS 
    TYPE tablou_indexat IS TABLE OF CART_ITEMS%ROWTYPE 
                            INDEX BY PLS_INTEGER; 
    TYPE tablou_indexat2 is TABLE OF CATEGORIES%ROWTYPE 
                            INDEX BY PLS_INTEGER; 
    id_uri tablou_indexat; 
    categ tablou_indexat2; 
    TYPE vector IS VARRAY(40) OF CATEGORIES.CATEGORY_ID%TYPE; 
    categ_tabel vector; 
    nume_categ CATEGORIES.CATEGORY_NAME%TYPE; 
    aux number(4); 
    id_utilizator USERS.user_id%type := '-1'; 
    nu_are_comenzi_finalizate EXCEPTION; 
BEGIN 
    aux := 0; 
     
    SELECT user_id into id_utilizator 
    FROM USERS 
    WHERE last_name = nume AND first_name = prenume and PHONE_NUMBER = telefon; 
     
    SELECT CAR.USER_ID, CAR.PRODUCT_ID, CAR.ORDER_ID, CAR.QUANTITY BULK COLLECT INTO ID_URI 
    FROM CART_ITEMS CAR, ORDERS ORD 
    WHERE CAR.USER_ID = ID_UTILIZATOR AND NVL(CAR.ORDER_ID, 0) = ORD.ORDER_ID 
        AND ORD.DELIVERY_STATE ='Done'; -- ORDER_ID IS NOT NULL ==> COMANDA TRIMISA. 
     
    IF (id_uri.count = 0) THEN RAISE nu_are_comenzi_finalizate; 
    END IF; 
     
    SELECT * BULK COLLECT INTO CATEG 
    FROM CATEGORIES; 
     
    CATEG_TABEL := VECTOR(); 
    FOR I IN ID_URI.FIRST..ID_URI.LAST LOOP 
        SELECT CATEGORY_ID INTO NUME_CATEG 
        FROM PRODUCTS 
        WHERE ID_URI(I).PRODUCT_ID = PRODUCT_ID; 
        CATEG_TABEL.EXTEND(); 
        CATEG_TABEL(i) := NUME_CATEG; 
    END LOOP; 
     
    FOR I IN CATEG.FIRST..CATEG.LAST LOOP 
        aux := 0; 
        FOR J IN CATEG_TABEL.FIRST..CATEG_TABEL.LAST LOOP 
            IF (CATEG(I).CATEGORY_ID = CATEG_TABEL(J)) THEN 
                aux := aux + 1; 
            END IF; 
        END LOOP; 
         
        IF (AUX != 0) THEN  
            DBMS_OUTPUT.PUT(CATEG(I).CATEGORY_NAME || ' '); 
            AUX := 0; 
            FOR J IN CATEG_TABEL.FIRST..CATEG_TABEL.LAST LOOP 
                IF (CATEG(I).CATEGORY_ID = CATEG_TABEL(J)) THEN 
                    AUX := AUX + ID_URI(J).QUANTITY; 
                END IF; 
            END LOOP; 
            DBMS_OUTPUT.PUT(AUX); 
            DBMS_OUTPUT.PUT_LINE(''); 
        END IF; 
    END LOOP; 
     
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('Nu exista utilizator cu datele introduse.'); 
        WHEN nu_are_comenzi_finalizate THEN 
            DBMS_OUTPUT.PUT_LINE('Utilizatorul nu are comenzi finalizate.'); 
END;
/

BEGIN 
    EX9('Corvin', 'Matei', '+40712345678'); 
END;
/

DROP PROCEDURE EX9;

CREATE OR REPLACE TRIGGER trig1 
    BEFORE INSERT OR UPDATE OR DELETE ON PRODUCTS 
BEGIN 
    IF (TO_CHAR(SYSDATE,'D') = 1 OR TO_CHAR(SYSDATE,'D') = 2) OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 17) 
    THEN 
        RAISE_APPLICATION_ERROR(-20001,'tabelul nu poate fi actualizat'); 
    END IF; 
END; 
/

DROP TRIGGER TRIG1;

CREATE OR REPLACE TRIGGER trig2 
    BEFORE UPDATE OF product_price ON PRODUCTS 
    FOR EACH ROW 
BEGIN 
    IF (:NEW.product_price < 10) THEN 
        RAISE_APPLICATION_ERROR(-20002,'Pretul unui produs nu poate sa fie mai mic decat 10 euro.'); 
    END IF; 
END; 
/

DROP TRIGGER TRIG2;

--Trigger-ul scrie in tabelul SYSTEM_UPDATES de feicare data când are loc o schimbare asupra bazei de date.
CREATE TABLE system_updates
    (event VARCHAR(20),
     name_obj VARCHAR(30),
     data DATE);

CREATE OR REPLACE TRIGGER trig3
    BEFORE CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
    INSERT INTO system_updates
        VALUES (  SYS.SYSEVENT, SYS.DICTIONARY_OBJ_NAME, SYSDATE);
END;
/



DROP TRIG3;

DROP TABLE SYSTEM_UPDATES;


