---
title: Mossy is Born!
---

Faced with having to script out schema and objects from a SQL Server database, the only option was using SMO. That's a Windows-only solution that has some known bugs and performance problems. Fortunately using the management views in SQL Server, you can script all this stuff out yourself. So I created [mossy](https://github.com/mroach/mossy) to do that in Ruby. It can script out a whole database in under 15 queries and depending on the size of modules, should only takes a few seconds.

[View mossy on GitHub](https://github.com/mroach/mossy)
