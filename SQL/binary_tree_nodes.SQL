/*
    Enter your query here and follow these instructions:
    1. Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
    2. The AS keyword causes errors, so follow this convention: "Select t.Field From table1 t" instead of "select t.Field From table1 AS t"
    3. Type your code immediately after comment. Don't leave any blank line.
*/
--
-- HackerRank does not admit WITH clause, so it needs to be implemented via subquery
--
--WITH count_parents (
--    SELECT P
--         ,COUNT(P) parent_n_times
--    FROM BST
--    GROUP BY P 
--)
SELECT BST.N
      --,BST.P
     --,ct.parent_n_times
      ,CASE
          WHEN BST.P IS NULL THEN 'Root'
          WHEN ct.parent_n_times IS NULL THEN 'Leaf'
          ELSE 'Inner' 
       END node_type
FROM BST LEFT JOIN (
    SELECT P
          ,COUNT(P) parent_n_times
    FROM BST
    GROUP BY P 
) ct
ON BST.N=ct.P
ORDER BY BST.N;
