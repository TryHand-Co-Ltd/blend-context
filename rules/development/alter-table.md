# ALTER TABLE rules

Source: [ALTER_TABLE時の注意](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/ALTER_TABLE%E6%99%82%E3%81%AE%E6%B3%A8%E6%84%8F?version=1), version 1. Compared live on 2026-09-09; source updated 2026-08-18T01:31:16Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

Consolidate compatible additions and removals of columns or indexes for the same table into one `ALTER TABLE` statement.

## Do not write

```sql
ALTER TABLE `students` ADD COLUMN `field_1` VARCHAR(32);
ALTER TABLE `students` ADD COLUMN `field_2` VARCHAR(32);
ALTER TABLE `students` ADD COLUMN `field_3` VARCHAR(32);
```

## Write

```sql
ALTER TABLE `students`
	ADD COLUMN `field_1` VARCHAR(32) COMMENT 'Field 1',
	ADD COLUMN `field_2` VARCHAR(32) COMMENT 'Field 2',
	ADD COLUMN `field_3` VARCHAR(32) COMMENT 'Field 3';
```

Each `ALTER TABLE` can lock or rebuild the target table. Repeating it can repeat that operational impact. Consolidate statements to minimize disruption to daytime production screen operations and data updates.

Local operational recommendation (beyond this Wiki page's explicit consolidation rule): before release, assess table size, supported online-DDL behavior, lock duration, execution time, rollback, and whether the change can safely run in the planned window.
