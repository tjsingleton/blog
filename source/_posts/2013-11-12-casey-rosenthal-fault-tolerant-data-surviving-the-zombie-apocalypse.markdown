---
layout: post
title: "Casey Rosenthal - Fault Tolerant Data: Surviving the Zombie Apocalypse"
date: 2013-11-12 09:29
comments: true
categories: 
  - Programming 
---

We are talking about distributed key-value databases. 

There is SQL or other. This is why I find the other category so exciting. New databases are coming out that change how we model and what is possible.

When you search google, you expect it to return results. You don't expect it to return the same results 5 minutes later or even in a different location. You don't expect that it has all the latest information instantly available. We realize it takes some time for the newly indexed data to show up.

When you open your email, you expect it to be available. It may not be consistent. You may have messages in one client that haven't been synced to another. You may have queued messages for delivery.

The expectation of the web is not one of a "high consistency" system. It is a the expectation of "high availability". SQL has a strong idea of consistency. 

In SQL, we have a use case, then model our data the best we can, and present it to a client. 

In key-value, we have a use case, then figure out what we want to present to a client, then model the data.

The more complicated your query planner the harder it is to scale. Key-value is the simplest query planner.

## Example Application: Enter zombies. 

The CDC has 2 data centers on the east coast, 2 data centers on the west coast and one near Texas. Zombies take out the east coast data centers. *Because the east coast never goes down.*

Fault tolerance is a optimistic view that bad things will happen. In a fault tolerant system, that's ok.

Data is stored like: 

```json
{
key: "patient_0",
data: {
    dna: "DNADNADNADNA",
    zip: 30019
  }
}
```

How do you find all the zombies in a zip code? Create an inverted index.

```json
{
key: "zip_30019",
data: ["patient_0", "patient_1", ...] 
}
```

Where to store the index?

* Document Based: partition index w\ document. Good for write, bad for read.
* Term Based: index outside document. Good for read, bad for write.

Use case should determine the paradigm. 

How to deal w\ conflict in distributed system? The network between the west coast and Texas goes down. Someone runs a new wire between. patient_0 was updated in both the west coast and Texas data centers while the network was down. 

How do you reconcile?

* You don't. Offer both records on read and let the client deal with them. "Sibling" records.

* You use data types that can self resolve. Simple case is an array that only grows. You just union the list. Theses are called CRDT (Conflict-Free Replicated Data Types). 

The only way to ensure uniqueness is to use immutable data.


----

Notes from RubyConf 2013


[Casey Rosenthal](https://twitter.com/caseyrosenthal)
