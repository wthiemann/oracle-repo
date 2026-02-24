-- Letzte 100 extern gewählte Nummern von Nebenstelle 27,
-- ohne 9000‑er Nummern und ohne interne Durchwahlen

WITH ranked_calls AS (
    SELECT
        linkedid,
        src,          -- aktive Nebenstelle
        dst,          -- gewählte Nummer
        calldate,
        duration,
        billsec,
        ROW_NUMBER() OVER (
            PARTITION BY linkedid, src, dst
            ORDER BY calldate DESC
        ) AS rn
    FROM callcenter.cdr_new_1
    WHERE src = '27'                         -- Nebenstelle 27 ruft an
      AND calldate <= SYSDATE                -- ab heute rückwärts
      AND NOT (dst BETWEEN '9000' AND '9999')-- 9000‑er-Serie ausschließen
      AND NOT REGEXP_LIKE(dst, '^[0-9]{2}$') -- zweistellige interne Durchwahlen ausschließen
)
SELECT
    TO_CHAR(rc.calldate, 'DD.MM.YYYY HH24:MI:SS') AS calldate,
    TO_CHAR(
      TRUNC(SYSDATE) + NUMTODSINTERVAL(rc.duration, 'SECOND'),
      'HH24:MI:SS'
    ) AS duration,      -- Gesamtdauer formatiert
    TO_CHAR(
      TRUNC(SYSDATE) + NUMTODSINTERVAL(rc.billsec, 'SECOND'),
      'HH24:MI:SS'
    ) AS billsec,       -- Gesprächsdauer formatiert
    rc.src AS extension,
    rc.dst AS dst
FROM ranked_calls rc
WHERE rc.rn = 1                                -- nur die aktuellste Zeile pro Anruf
ORDER BY rc.calldate DESC
FETCH FIRST 100 ROWS ONLY;
/


SELECT   parameter, value 
    FROM nls_session_parameters 
ORDER BY 1;
/