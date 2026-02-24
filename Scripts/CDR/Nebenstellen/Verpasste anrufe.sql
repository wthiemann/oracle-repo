/* -------------------------------------------------------- */
/* -- die letzten 100 verpasten anrufe einer nebenstelle -- */

SELECT   calldate, 
         TO_CHAR(calldate, 'HH24:MI:SS') AS calltime,
         src AS caller_number,
         dst,
         disposition
    FROM callcenter.cdr_new_1
   WHERE disposition = 'NO ANSWER'
     AND (dst = '27' OR dstchannel LIKE 'PJSIP/27%')
     AND calldate <= SYSDATE   -- nur Anrufe bis heute
ORDER BY calldate DESC
FETCH FIRST 100 ROWS ONLY;
/


SELECT   parameter, value 
    FROM nls_session_parameters 
ORDER BY 1;
/