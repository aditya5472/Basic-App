https://stackoverflow.com/questions/2120544/how-to-get-cumulative-sum
##################################

ques : 
why does query A return a result but B doesn't?

A: select 'true' where 3 in (1, 2, 3, null)
B: select 'true' where 3 not in (1, 2, null)

Ans:
select 'true' where 3 = 1 or 3 = 2 or 3 = 3 or 3 = null
Since 3 = 3 is true, you get a result.

Query B is the same as:

select 'true' where 3 <> 1 and 3 <> 2 and 3 <> null

When ansi_nulls is on, 3 <> null is UNKNOWN, so the predicate evaluates to UNKNOWN, and you don't get any rows.
When ansi_nulls is off, 3 <> null is true, so the predicate evaluates to true, and you get a row.

When ANSI_NULLS is ON, a SELECT statement that uses WHERE column_name = NULL returns zero rows even if there are null values in column_name. ... When SET ANSI_NULLS is OFF, comparisons of all data against a null value evaluate to TRUE if the data value is NULL

*************************************************************

select col values for max date:
SELECT * FROM Table where (col1,col2) = (SELECT col1, max(col2) from Table group by col1)
############
Junk dimensions are used to reduce the number of dimensions in the dimensional model and reduce the number of columns in the fact table.  A junk dimension combines two or more related low cardinality flags into a single dimension.

FROM and JOIN s.
WHERE. ...
GROUP BY. ...
HAVING. ...
SELECT. ...
DISTINCT. ...
ORDER BY. ...
LIMIT / OFFSET.
########################################################

you cannot add more than one null value to a unique key column since the second null value will be the duplicate of the first one – and duplicates are not allowed
#############################

Tables in OLTP database are normalized. Tables in OLAP database are not normalized. OLTP and its transactions are the sources of data. Different OLTP databases become the source of data for OLAP.
#####################################################

A factless fact table is a fact table that does not have any measures.  It is essentially an intersection of dimensions (it contains nothing but dimensional keys).
#############################################
late arriving dimensions:
Dimension that you know what it should be, but it just hasn't been loaded yet. Specifically this means that you know the natural key, but have not been able to find it in the dimension table.
The most common example of late arriving dimensions data can be found in the medical insurance industry. For this example, we will assume that the employee was onboarded and had an accident before all of the forms could be completed, transferred to and processed by the insurance company. The hospital will create a medical claim record to be paid by the insurance company, but the insurance company does not yet have a person to associate the claim. A few weeks later the employer forwards over the completed employee forms and the DIM_INSURED record is created for the employee. What happens in the weeks between the claim and the receipt of the insurance information for the employee?

*********************************

SELECT LISTAGG(SubName, ' , ') WITHIN GROUP (ORDER BY SubName) AS SUBJECTS
  2  FROM   GfG ;
**************
CREATE INDEX index_name
ON table_name (column1, column2, ...);
**************************
Running total
SELECT Id, StudentName, StudentGender, StudentAge,
SUM (StudentAge) OVER (ORDER BY Id) AS RunningAgeTotal
FROM Students

*********************************Masking of data******************
column1
384xxxxxx434

SELECT 
     SUBSTRING(SecurityNumber,1,3) +   'xxxxx' +  SUBSTRING(SecurityNumber,LEN(SecurityNumber) - 2, LEN(SecurityNumber)) AS column1

FROM underlyingTable 

***********************
