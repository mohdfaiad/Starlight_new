-- Start of DDL Script for Package Body CREATOR.BOOKS
-- Generated 30.09.2016 17:11:58 from CREATOR@ORCL

CREATE OR REPLACE 
PACKAGE books
IS

   TYPE ref_cursor is REF CURSOR; -- ���� ����� ����������� ��� ������

   --
   -- ����� ���������� �������
   --
   PROCEDURE get_advertisments
   (
       v_office in number,
       cursor_ out ref_cursor
   );


   --
   -- ����� ����� ��������
   --
   PROCEDURE get_client_types
   (
       v_office in number,
       cursor_ out ref_cursor
   );


   --
   -- ����� ����� ��������
   --
   PROCEDURE get_regions
   (
       v_office in number,
       cursor_ out ref_cursor
   );


   --
   -- ����� �������
   --
   PROCEDURE get_cities
   (
     v_office in number,
     cursor_ out ref_cursor
   );


   --
   -- ����� ����� �����
   --
   PROCEDURE get_job_titles
   (
       v_office in number,
       cursor_ out ref_cursor
   );


   --
   -- ����� �������
   --
   PROCEDURE get_departments
   (
       v_office in number,
       cursor_ out ref_cursor
   );


     --
   -- �������� ������
   --
   PROCEDURE delete_record
   (
       table_ in varchar2,
       pk_      in varchar2,
       id_      in number
   );


     --
   -- ������ ��������
   --
   PROCEDURE save_regions
   (
       name_        in varchar2,
       info_        in varchar2,
       kod_         in varchar2,
       kladr_       in varchar2,
       id_          in out number
   );

     --
   -- ������ �������
   --
   PROCEDURE save_ADVERTISMENTS
   (
       name_        in varchar2,
       info_        in varchar2,
       id_          in out number
   );

     --
   -- ������ ���� ��������
   --
   PROCEDURE save_CLIENT_TYPES
   (
       name_        in varchar2,
       info_        in varchar2,
       id_          in out number,
       TTYPE_       in number,
       price_part_ in number,
       is_contractor_ in number
   );

     --
   -- ������ �������
   --
   PROCEDURE save_DEPARTMENTS
   (
       name_        in varchar2,
       info_        in varchar2,
       id_          in out number,
       TTYPE_       in number
   );


     --
   -- ������ �������
   --
   PROCEDURE save_JOB_TITLES
   (
       name_        in varchar2,
       info_        in varchar2,
       id_          in out number
   );

   --
   -- ������ �������
   --
   PROCEDURE save_city
   (
     v_city       in varchar2,
     v_kod        in varchar2,
     v_id_region  in number,
     id_          in out number
   );

END; -- Package spec
/

-- Grants for Package
GRANT EXECUTE ON books TO new_role
/

CREATE OR REPLACE 
PACKAGE BODY books
IS

cnt_ number;

--
-- ����� ���������� �������
--
PROCEDURE get_advertisments
(
   v_office in number,
   cursor_ out ref_cursor
)
IS
BEGIN
  open cursor_ for
       SELECT a.id_advertisments, a.name, a.info, a.ID_OFFICE, o.BRIEF, row_number() over(partition by 1 order by upper(a.name)) nn
       FROM books_advertisments a, offices o
       where (a.ID_OFFICE in (1, v_office) or v_office = 0)
          and a.id_office = o.id_office
       order by upper(a.name)
       ;

  EXCEPTION
       WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.get_advertisments', '');
           RAISE_APPLICATION_ERROR (-20001, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ����� ����� ��������
--
PROCEDURE get_client_types
(
   v_office in number,
   cursor_ out ref_cursor
)
IS
BEGIN
  open cursor_ for
       SELECT a.id_client_types, a.name, a.info, a.t_type, a.discount, a.ID_OFFICE, o.BRIEF, row_number() over(partition by 1 order by upper(a.name)) nn,
       a.is_contractor
       FROM books_client_types a, offices o
       where (a.ID_OFFICE in (1, v_office) or v_office = 0)
          and a.id_office = o.id_office
       order by upper(a.name)
       ;

  EXCEPTION
       WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.get_client_types', '');
           RAISE_APPLICATION_ERROR (-20002, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ����� ����� ��������
--
PROCEDURE get_regions
(
   v_office in number,
   cursor_ out ref_cursor
)
IS
BEGIN
  open cursor_ for
       SELECT a.id_regions, a.name, a.info, a.ID_OFFICE, a.kladr, a.kod, o.BRIEF, row_number() over(partition by 1 order by upper(a.name)) nn
       FROM books_regions a, offices o
       where (a.ID_OFFICE in (1, v_office) or v_office = 0)
          and a.id_office = o.id_office
       order by upper(a.name)
       ;

  EXCEPTION
       WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.get_regions', '');
           RAISE_APPLICATION_ERROR (-20003, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ����� �������
--
PROCEDURE get_cities
(
   v_office in number,
   cursor_ out ref_cursor
)
IS
BEGIN
  open cursor_ for
       SELECT a.id_city, a.city, a.kod, a.id_region, a.id_office, o.BRIEF, r.name
       FROM books_cities a, offices o, books_regions r
       where (a.ID_OFFICE in (1, v_office) or v_office = 0)
          and a.id_office = o.id_office
          and a.id_region = r.ID_REGIONS(+)
       order by city
       ;

  EXCEPTION
       WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.get_regions', '');
           RAISE_APPLICATION_ERROR (-20003, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ����� �������
--
PROCEDURE get_departments
(
   v_office in number,
   cursor_ out ref_cursor
)
IS
BEGIN
  open cursor_ for
       SELECT a.id_departments, a.name, a.info, a.state, a.ID_OFFICE, o.BRIEF, row_number() over(partition by 1 order by upper(a.name)) nn
       FROM books_departments a, offices o
       where (a.ID_OFFICE in (1, v_office) or v_office = 0)
          and a.id_office = o.id_office
       order by upper(a.name)
       ;

  EXCEPTION
       WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.get_departments', '');
           RAISE_APPLICATION_ERROR (-20004, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ����� ����� �����
--
PROCEDURE get_job_titles
(
   v_office in number,
   cursor_ out ref_cursor
)
IS
BEGIN
  open cursor_ for
       SELECT a.id_job_titles, a.name, a.info, a.ID_OFFICE, o.BRIEF, row_number() over(partition by 1 order by upper(a.name)) nn
       FROM books_job_titles a, offices o
       where (a.ID_OFFICE in (1, v_office) or v_office = 0)
          and a.id_office = o.id_office
       order by upper(a.name)
       ;

  EXCEPTION
       WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.get_job_titles', '');
           RAISE_APPLICATION_ERROR (-20005, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- �������� ������
--
PROCEDURE delete_record
(
   table_ in varchar2,
   pk_      in varchar2,
   id_      in number
)
IS
   sql_str   varchar2(512);
BEGIN

   sql_str := 'delete from ' || table_ || ' where '|| pk_ ||' = :p1';
   execute immediate sql_str using id_;
   commit;

   EXCEPTION
      WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.delete_record', sql_str);
           RAISE_APPLICATION_ERROR (-20006, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ������ ��������
--
PROCEDURE save_regions
(
   name_        in varchar2,
   info_        in varchar2,
   kod_         in varchar2,
   kladr_       in varchar2,
   id_          in out number
)
IS
BEGIN

  if id_ > 0 then
     select count(*) into cnt_ from books_regions where upper(NAME) = upper(name_) and ID_REGIONS <> id_;

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� ������ ��� ����������!');
     else
        update books_regions set NAME = name_, info = info_, DATE_CHANGE=sysdate, kod=kod_, kladr=kladr_ where ID_REGIONS = id_;
     end if;

  else
     select count(*) into cnt_ from books_regions where upper(NAME) = upper(name_);

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� ������ ��� ����������!');
     else
        insert into BOOKS_REGIONS values(BOOKS_ID_REGIONS.NEXTVAL, name_, info_, CONST_OFFICE, sysdate, kod_, kladr_) returning id_regions into id_;
     end if;

  end if;
  commit;

  EXCEPTION
      WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.save_regions', '');
           RAISE_APPLICATION_ERROR (-20007, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;



--
-- ������ �������
--
PROCEDURE save_city
(
   v_city       in varchar2,
   v_kod        in varchar2,
   v_id_region  in number,
   id_          in out number
)
IS
BEGIN

  if id_ > 0 then
     select count(*) into cnt_ from books_cities where upper(city) = upper(v_city) and ID_CITY <> id_;

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� ����� ��� ����������!');
     else
        update books_cities set city = v_city, kod = v_kod, id_region=v_id_region, DATE_CHANGE=sysdate where ID_CITY = id_;
     end if;

  else
     select count(*) into cnt_ from books_cities where upper(city) = upper(v_city);

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� ����� ��� ����������!');
     else
        insert into books_cities values(get_office_unique('seq_id_city'), v_city, v_kod, v_id_region, CONST_OFFICE, sysdate) returning ID_CITY into id_;
     end if;

  end if;
  commit;

  EXCEPTION
      WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.save_regions', '');
           RAISE_APPLICATION_ERROR (-20007, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;



--
-- ������ �������
--
PROCEDURE save_ADVERTISMENTS
(
   name_        in varchar2,
   info_        in varchar2,
   id_          in out number
)
IS
BEGIN
  if id_ > 0 then
     select count(*) into cnt_ from BOOKS_ADVERTISMENTS where upper(NAME) = upper(name_) and ID_ADVERTISMENTS <> id_;

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� �������� ������� ��� ����������!');
     else
        update BOOKS_ADVERTISMENTS set NAME = name_, info = info_, DATE_CHANGE=sysdate where ID_ADVERTISMENTS = id_;
     end if;

  else
     select count(*) into cnt_ from BOOKS_ADVERTISMENTS where upper(NAME) = upper(name_);

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� �������� ������� ��� ����������!');
     else
        insert into BOOKS_ADVERTISMENTS values(BOOKS_ID_ADVERTISMENTS.NEXTVAL, name_, info_, CONST_OFFICE, sysdate) returning ID_ADVERTISMENTS into id_;
     end if;
  end if;
  commit;

  EXCEPTION
      WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.save_ADVERTISMENTS', '');
           RAISE_APPLICATION_ERROR (-20008, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ������ ���� ��������
--
PROCEDURE save_CLIENT_TYPES
(
   name_        in varchar2,
   info_        in varchar2,
   id_          in out number,
   TTYPE_       in number,
   price_part_ in number,
   is_contractor_ in number
)
IS
BEGIN
  if id_ > 0 then
     select count(*) into cnt_ from BOOKS_CLIENT_TYPES where upper(NAME) = upper(name_) and ID_CLIENT_TYPES <> id_;

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� ��� ������� ��� ����������!');
     else
        update BOOKS_CLIENT_TYPES set NAME = name_, info = info_, T_TYPE = TTYPE_, DISCOUNT = price_part_, DATE_CHANGE=sysdate, is_contractor=is_contractor_ where ID_CLIENT_TYPES = id_;
     end if;

  else
    select count(*) into cnt_ from BOOKS_CLIENT_TYPES where upper(NAME) = upper(name_);

    if (cnt_ > 0) then
       raise_application_error(-20021,'��������� ��� ������� ��� ����������!');
    else
       insert into BOOKS_CLIENT_TYPES values(BOOKS_ID_CLIENT_TYPES.NEXTVAL, name_, info_, TTYPE_, price_part_, CONST_OFFICE, sysdate, is_contractor_) returning ID_CLIENT_TYPES into id_;
    end if;
  end if;
  commit;

  EXCEPTION
      WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.save_CLIENT_TYPES', '');
           RAISE_APPLICATION_ERROR (-20009, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ������ �������
--
PROCEDURE save_DEPARTMENTS
(
   name_        in varchar2,
   info_        in varchar2,
   id_          in out number,
   TTYPE_       in number
)
IS
BEGIN
  if id_ > 0 then
     select count(*) into cnt_ from BOOKS_DEPARTMENTS where upper(NAME) = upper(name_) and ID_DEPARTMENTS <> id_;

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� ����� ��� ����������!');
     else
        update BOOKS_DEPARTMENTS set NAME = name_, info = info_, state = TTYPE_, DATE_CHANGE=sysdate where ID_DEPARTMENTS = id_;
     end if;

  else
     select count(*) into cnt_ from BOOKS_DEPARTMENTS where upper(NAME) = upper(name_);

     if (cnt_ > 0) then
        raise_application_error(-20021,'��������� ����� ��� ����������!');
     else
        insert into BOOKS_DEPARTMENTS values(BOOKS_ID_DEPARTMENTS.NEXTVAL, name_, info_, TTYPE_, CONST_OFFICE, sysdate) returning ID_DEPARTMENTS into id_;
     end if;
  end if;
  commit;

  EXCEPTION
      WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.save_DEPARTMENTS', '');
           RAISE_APPLICATION_ERROR (-20010, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;


--
-- ������ �������
--
PROCEDURE save_JOB_TITLES
(
   name_        in varchar2,
   info_        in varchar2,
   id_          in out number
)
IS
BEGIN
  if id_ > 0 then
     select count(*) into cnt_ from BOOKS_JOB_TITLES where upper(NAME) = upper(name_) and ID_JOB_TITLES <> id_;

     if (cnt_ > 0) then
         raise_application_error(-20021,'��������� ��������� ��� ����������!');
     else
         update BOOKS_JOB_TITLES set NAME = name_, info = info_, DATE_CHANGE=sysdate where ID_JOB_TITLES = id_;
     end if;

  else
     select count(*) into cnt_ from BOOKS_JOB_TITLES where upper(NAME) = upper(name_);

     if (cnt_ > 0) then
         raise_application_error(-20021,'��������� ��������� ��� ����������!');
     else
         insert into BOOKS_JOB_TITLES values( get_office_unique('BOOKS_ID_JOB_TITLES'), name_, info_, CONST_OFFICE, sysdate) returning ID_JOB_TITLES into id_;
     end if;
  end if;
  commit;

  EXCEPTION
      WHEN others THEN
           LOG_ERR(SQLERRM, SQLCODE, 'books.save_JOB_TITLES', '');
           RAISE_APPLICATION_ERROR (-20011, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
END;

END; -- BOOKS
/


-- End of DDL Script for Package Body CREATOR.BOOKS

