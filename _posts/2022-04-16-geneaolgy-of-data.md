---
layout: post
title: "Data Storage Formats"
categories: databases data
author:
- Andrei Radulescu-Banu
---

# Summary

In this sequence of posts, we will survey data storage formats, and data management. The questions we will be asking are
- How and where the data is store
- Ways in which it is accessed
- Transformations it undergoes

## Assumptions
We will only be looking at open source data formats. Our assumptions are:
- We are working with a distributed system. Data may be stored in a distributed fashion.
- The size of data is in hundreds of terabytes.
- Data is accessed by several consumers during developend lifecycle, for various purposes:
  - Configuration
  - Message passing
  - Data ingestion
  - Data analysis
  - Machine learning model training
  - Simulation

The use case we have in mind is data for robotics and self-driving cars. However, we won't restrict the discussion to these domains. The data storage formats we are considering can apply to many other fields that deal with distributed computing and hundreds of terabytes of data.

# Form follows function

There are many uses for data, and storage format is adapted to the function of the data.
- We make no endorsement of any single storage format!
- ... We try to understand the function first
- ... Each function has 2-3 storage format option that are appropriate

We will be talking about:
- Config & web file formats:
  - JSON, YAML, XML
- Serialization file formats:
  - Pickle, NPZ
  - Protobuf, AVRO
- Databases
  - Relational vs Big Data
  - Row-based, columnar
- Columnar file formats
  - Parquet, DeltaLake, ORC
- Data Lakehouse architecture
  - Databricks, AWS SageMaker
- Deep Learning data loader
  - TFRecord (file format)
  - Petastorm (data loader library)
  - Dvc (data repository)

# JSon

JSon stands for JavaScript Store Object Notation. It has a lightweight syntax, and it is easy to understand by humans. Here is an example JSon file:

```json
{
  "employees": [
    {
      "firstName":"John",
      "lastName":"Doe"
    },
    {
      "firstName":"Anna", 
      "lastName":"Smith"
    },
    {
      "firstName":"Peter", 
      "lastName":"Jones"
    }
  ]
}
```

Readers familiar with JSon will immediately recognize that this defines an `employees` list, with each list element an array with two fiels, `firstName` and `lastName`.

Why is JSon popular?
- Contents is easy to ‘figure out’ without a schema
- Json is widely used in web and client/server applications. It allows client software to be developed independently of web server software.

<img src="src/images/client_server.png" />
     style="float: right; margin-right: 10px;" />

What limitations does JSon have?
- It is schemaless. 
- JSon is not size efficient.
- ... And JSon does not allow comments.

Being schemaless is both an advantage, and a disadvantage of JSon. More precisely - users can define their own schema for JSon files, but they would have to make their own schema implementation, because JSon does not natively support a concept of schema.
