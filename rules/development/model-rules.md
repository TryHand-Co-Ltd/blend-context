# Model rules and read replicas

Sources: `Modelクラス`, `リードレプリカ用DBとの同期注意`, and `実装上の注意`. Versioned source links are in [source audit](../evidence/2026-09-09-wiki-source-audit.md).

## Reuse and responsibility

- First look for an existing model method that already serves the task; the Wiki recommends avoiding unnecessary additions to existing models.
- For a new table requiring insert/update behavior, define and use the appropriate model methods. Keep persistence-related business logic in the appropriate model/repository rather than making controllers fat.
- Some features use repositories; inspect and follow the affected feature's established boundary rather than forcing a different pattern.
- Load the required models in the calling class's constructor, unless an ancestor already loads them. When changing affected legacy logic, move its mid-flow loads into the constructor without sweeping unrelated files.

## Read-only connection lifecycle

The Wiki describes read-only query offloading through `application/models/common/Base_m.php`, introduced progressively, prioritizing frequent reads.

- Read-only model queries using this pattern inherit `Base_m` and bracket the query with `use_readonly_start()` and `use_readonly_end()`.
- `use_readonly_start()` checks whether a transaction is active. In a transaction it retains the writable connection; otherwise it switches to the replica. It does not classify the SQL as a read or write.
- Do not issue writes through a read-only scope.
- Do not return between start and end. Place query-free guards before start, complete the query, restore the connection, and then return. Check exceptional exits as well when changing this lifecycle.
- The Wiki warns that an early return can affect subsequent queries. Local inspection on 2026-09-09 confirms `use_readonly_end()` restores `$this->db` from `$this->db_tmp`; it does not itself call a query-builder reset. Describe the observed implementation accurately rather than treating the Wiki's reset wording as an API guarantee.

## Read-after-write

Replicas synchronize asynchronously. Immediately reading a replica after INSERT/UPDATE can miss the new row or return old values.

- The Wiki recommends reusing the associative array/generated data already used for the write instead of selecting it again for subsequent processing.
- Do not use `sleep(1)` or another fixed wait as proof that replication has caught up.
- If the next operation genuinely needs DB-generated/current values, inspect the existing writer/transaction path and obtain them with the required consistency. This last point is local implementation guidance, not a claim that the Wiki mandates one particular API.
- Review every caller affected by a change of connection behavior. A test against a single local database does not prove replica consistency.

For authorization, use [implementation-rules.md](implementation-rules.md): the Wiki allows an ID lookup followed by controller authorization. For DDL/indexes, read [database-rules.md](database-rules.md).
