Terms:
Indices
Primary Key 
FOREIGN Key
LEFT JOIN RIGHT JOIN


JOIN SYNTAX: 

SELECT columns
FROM table_a as A
JOIN table_b as B ON A.id = B.fk_id;

---
Key Pairing


Think about the idea of a Venn Diagram
Left Table, Right Table, and the part in the middle where they overlap

INNER JOIN only includes the parts in the middle that overlap/match, ignores NULLS

LEFT JOIN includes everything on the left table and any matches on the right table INCLUDES and INSERTS NULLS
RIGHT JOIN inclues everything on the right table and any matches on the right table INCLUDES and INSERTS NULLS





