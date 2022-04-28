---
layout: post
title: "Data Storage Formats"
categories: databases data
author:
- Andrei Radulescu-Banu
---

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

[JSon](https://en.wikipedia.org/wiki/JSON) stands for JavaScript Store Object Notation. It has a lightweight syntax, and it is easy to understand by humans. Here is an example JSon file:

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

<p align="center">
<img src="/src/images/client_server.png" width="350" height="250"/>
</p>

What limitations does JSon have?
- It is schemaless. 
- JSon is not size efficient.
- ... And JSon does not allow comments.

Being schemaless is both an advantage, and a disadvantage of JSon. More precisely - users can define their own schema for JSon files, but they would have to make their own schema implementation, because JSon does not natively support a concept of schema.

# YAML
The [YAML](https://en.wikipedia.org/wiki/YAML) format is...
- Used for configuration
- … Could be used for data serialization
- Created to solve problems of XML
- Simple to read & write by humans

Here is the same example contents expressed in YAML:

```yaml
employees:
  - firstName: John
    lastName: Doe
  - firstName: Anna 
    lastName: Smith
  - firstName: Peter
    lastName: Jones
# Some comment
```

As you can see, YAML allows comments. Indentation is used to express nested syntax. Basic format is an enumeration of `key: value` elements. List elements are enumerated using a `-` character. 

Why is YAML popular?
- It is widely used for configuration files for dev/ops

What limitations does it have?
- It is schemaless
- Not size efficient
- When configs large and repetitive, it becomes difficult to read.

A typical difficulty is figuring out the indentation of YAML blocks when the file spans multiple screens that need to be paged-up and paged-down.

# XML

- [XML](https://en.wikipedia.org/wiki/XML) is often used when data is sent from a web server to a client.
- It is a Markup language. You can add attributes to entities.
- HTML was original language of Web. XML is an evolution of HTML.
- XML supports syntax enforcement through [DTDs](https://en.wikipedia.org/wiki/Document_type_definition) and [Schemas](https://en.wikipedia.org/wiki/XML_schema)

Here is our document expressed as XML:

```xml
<employees>
   <person firstName=”John”
           lastName=”Doe” />
   <person firstName=”Anna”
           lastName=”Smith” />
   <person firstName=”Peter”
           lastName=”Jones” />
</employees>
<!-- Some comment -->

<!-- DTD schema -->
<!DOCTYPE employees [
   <!ELEMENT person (#PCDATA)>
    <!ATTLIST person firstName CDATA #REQUIRED>
    <!ATTLIST person lastName CDATA #REQUIRED>
]>

```

XML distinguishes between `blocks` (in our case, `employees` and `person`), and `attributes` (in our case, `firstName` and `lastName`).

The `person` block is empty and only has attributes. The `employees` block has no attributes, and has multiple `person` subblocks.

When is XML popular?
- When you want different renderings depending on style
- When you need strong schema support
- For a long time, XML was used to store configuration (until YAML came along)

Limitations of XML:
- Difficult to balance end bracket by humans
- Not size efficient

In robotics, XML is used by ROS (Robot OS), and by the Gazebo simulator.

# Object Serialization

The setup for serialization is as follows:
* Assume we have an object with embedded pointers
* We want to pass it to another process
  * One time
  * Or, many times, repeatedly
* The process1 CPU could be big endian, while the process 2 CPU could be little endian

<p align="center">
<img src="/src/diagrams/serialization.png" width="350" height="250"/>
</p>

* ... Or, you could save state to disk across process runs (This is more similar to sending it one time)

<p align="center">
<img src="/src/diagrams/serialization_to_disk.png" width="350" height="250"/>
</p>

