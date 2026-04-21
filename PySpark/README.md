# 🚀 PySpark Cheat Sheet

A quick revision guide for **PySpark concepts**, covering syntax, transformations, actions, and commonly used operations.

> 📌 Designed for Data Engineers & Analysts transitioning from SQL to PySpark.

---

## 📚 Table of Contents

- [Core Concepts](#-core-concepts)
- [Setup](#-setup)
- [Data Loading](#-data-loading)
- [DataFrame Operations](#-dataframe-operations-dml-equivalent)
- [DDL Operations](#-ddl-operations)
- [SQL Queries in PySpark](#-sql-queries-in-pyspark)
- [Aggregation](#-grouping--aggregation)
- [Joins](#-joins)
- [Window Functions](#-window-functions)
- [String Functions](#-string-functions)
- [Numeric Functions](#-numeric-functions)
- [Date Functions](#-date-functions)
- [Conditional Logic](#-conditional-logic)
- [NULL Handling](#-null-handling)
- [Sorting](#-sorting)
- [Actions](#-actions-execution-triggers)
- [Writing Data](#-writing-data)
- [Performance Optimization](#-caching--performance)
- [Set Operations](#-set-operations)
- [UDF](#-user-defined-functions-udf)
- [Important Notes](#-important-notes)

---

## 🔹 Core Concepts

- **SparkSession** → Entry point to PySpark
- **DataFrame** → Distributed table (like SQL table)
- **RDD** → Low-level distributed collection
- **Transformations** → Lazy operations (`select`, `filter`)
- **Actions** → Trigger execution (`show`, `collect`)

---

## 🔹 Setup

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("MyApp") \
    .getOrCreate()
```

## 🔹 Data Loading

| Operation | Syntax | Example |
|-----------|--------|---------|
| Read CSV | spark.read.csv() | df = spark.read.csv("file.csv", header=True, inferSchema=True) |
| Read JSON | spark.read.json() | df = spark.read.json("file.json") |
| Read Parquet | spark.read.parquet() | df = spark.read.parquet("file.parquet") |
| Read Table | spark.table() | df = spark.table("employees") |

## 🔹 DataFrame Operations (DML Equivalent)

| Operation | Syntax | Example |
|-----------|--------|---------|
| Select | df.select() | df.select("name", "age") |
| Filter | df.filter() | df.filter(df.age > 30) |
| Add Column | withColumn() | df.withColumn("age_plus_1", df.age + 1) |
| Drop Column | drop() | df.drop("age") |
| Rename Column | withColumnRenamed() | df.withColumnRenamed("name", "full_name") |
| Distinct | distinct() | df.select("city").distinct() |
| Drop Duplicates | dropDuplicates() | df.dropDuplicates(["id"]) |

## 🔹 DDL Operations

```python
df.createOrReplaceTempView("employees")

spark.sql("CREATE TABLE emp(id INT, name STRING)")
spark.sql("DROP TABLE emp")
```

## 🔹 SQL Queries in PySpark

```python
df.createOrReplaceTempView("employees")

result = spark.sql("""
SELECT name, age
FROM employees
WHERE age > 30
ORDER BY age DESC
""")
```

## 🔹 Grouping & Aggregation

| Operation | Syntax | Example |
|-----------|--------|---------|
| Group By | groupBy() | df.groupBy("dept").count() |
| Aggregate | agg() | df.groupBy("dept").agg({"salary": "avg"}) |
| Count | count() | df.count() |
| Sum | sum() | df.selectExpr("sum(salary)") |
| Avg | avg() | df.selectExpr("avg(salary)") |
| Min/Max | min()/max() | df.selectExpr("max(salary)") |

## 🔹 Joins

| Join Type | Syntax | Example |
|-----------|--------|---------|
| Inner | join() | df1.join(df2, "id", "inner") |
| Left |  | df1.join(df2, "id", "left") |
| Right |  | df1.join(df2, "id", "right") |
| Full |  | df1.join(df2, "id", "outer") |
| Cross | crossJoin() | df1.crossJoin(df2) |

## 🔹 Window Functions

```python
from pyspark.sql.window import Window
from pyspark.sql.functions import row_number, rank

windowSpec = Window.partitionBy("dept").orderBy("salary")

df.withColumn("rank", rank().over(windowSpec))
```

## 🔹 String Functions

```python
from pyspark.sql.functions import col, upper, lower, concat
```

| Function | Example |
|----------|---------|
| Upper | upper(col("name")) |
| Lower | lower(col("name")) |
| Length | length(col("name")) |
| Substring | substring("name", 1, 3) |
| Concat | concat(col("first"), col("last")) |
| Trim | trim(col("name")) |

## 🔹 Numeric Functions

```python
from pyspark.sql.functions import round, abs
```

| Function | Example |
|----------|---------|
| Round | round(col("salary"), 2) |
| Abs | abs(col("value")) |
| Ceil | ceil(col("value")) |
| Floor | floor(col("value")) |

## 🔹 Date Functions

```python
from pyspark.sql.functions import current_date, date_add
```

| Function | Example |
|----------|---------|
| Current Date | current_date() |
| Current Timestamp | current_timestamp() |
| Date Add | date_add(col("date"), 5) |
| Date Diff | datediff(col("d1"), col("d2")) |
| Year | year(col("date")) |

## 🔹 Conditional Logic

```python
from pyspark.sql.functions import when
```

| Operation | Example |
|-----------|---------|
| CASE WHEN | when(col("age") > 30, "Senior").otherwise("Junior") |
| COALESCE | coalesce(col("a"), col("b")) |

## 🔹 NULL Handling

| Operation | Example |
|-----------|---------|
| Drop NULLs | df.dropna() |
| Fill NULLs | df.fillna(0) |
| Replace | df.na.replace("old", "new") |

## 🔹 Sorting

| Operation | Example |
|-----------|---------|
| Order By | df.orderBy("salary", ascending=False) |
| Multiple Columns | df.orderBy(["dept", "salary"]) |

## 🔹 Actions (Execution Triggers)

| Action | Description |
|--------|-------------|
| show() | Display data |
| collect() | Bring all data to driver ⚠️ |
| count() | Count rows |
| first() | First row |
| take(n) | First n rows |

## 🔹 Writing Data

| Operation | Example |
|-----------|---------|
| CSV | df.write.csv("path") |
| Parquet | df.write.parquet("path") |
| Table | df.write.saveAsTable("table") |

## 🔹 Caching & Performance

| Operation | Syntax |
|-----------|--------|
| Cache | df.cache() |
| Persist | df.persist() |
| Unpersist | df.unpersist() |

## 🔹 Set Operations

| Operation | Example |
|-----------|---------|
| Union | df1.union(df2) |
| Intersect | df1.intersect(df2) |
| Except | df1.subtract(df2) |

## 🔹 User Defined Functions (UDF)

```python
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType

def upper_func(x):
    return x.upper()

upper_udf = udf(upper_func, StringType())

df.withColumn("name_upper", upper_udf(col("name")))
```

## ⚠️ Important Notes

- Prefer built-in functions over UDFs (better performance)
- Avoid collect() on large datasets
- PySpark uses lazy evaluation
- Use partitioning + caching wisely
- Prefer DataFrame API over RDDs