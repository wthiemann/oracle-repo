SELECT TRUNC(calldate)
  FROM callcenter.cdr_new_1
 WHERE TRUNC(calldate) = '23.02.2026';
/


SELECT TRUNC(calldate)
  FROM callcenter.cdr_new_1;
/

SELECT *
  FROM callcenter.cdr_new_1
 WHERE TRUNC(calldate) = '23.02.2026';
/


SELECT *
  FROM callcenter.cdr_new_1
 WHERE TRUNC(calldate) = DATE '2026-02-23';
/


SELECT *
  FROM callcenter.cdr_new_1
 WHERE TRUNC(calldate) = '23.02.2026';
/


SELECT *
  FROM callcenter.cdr_new_1
 WHERE TRUNC(calldate) = TO_DATE('23.02.2026','DD.MM.YYYY');
/


SELECT  PARAMETER ,VALUE
 FROM nls_session_parameters 
ORDER BY 1;
/

COMMIT;


