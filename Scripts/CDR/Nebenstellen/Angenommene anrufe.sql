/* -- die letzten 100 angenommene anrufe einer nebenstelle -- */

SELECT   calldate,
         TO_CHAR(calldate, 'HH24:MI:SS') AS calltime,
         src AS caller_number,
         route_caller_id,
         dst,
         disposition
    FROM callcenter.cdr_new_1
   WHERE disposition = 'ANSWERED'
     AND (dst = '27' OR dstchannel LIKE 'PJSIP/27%')
     AND calldate <= SYSDATE
ORDER BY calldate DESC
FETCH FIRST 100 ROWS ONLY;
/



SELECT *
  FROM callcenter.cdr_new_1;