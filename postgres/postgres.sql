databaseChangeLog:
  - changeSet:
      id: 1761609680050-1
      author: anthony.pahl@harness.io
      comment: Create subscribers table
      labels: "dev"
      changes:
        - createTable:
            tableName: subscribers
            columns:
              - column:
                  name: subscriber_id
                  type: BIGSERIAL
                  constraints:
                    primaryKey: true
                    primaryKeyName: pk_subscribers
              - column:
                  name: email
                  type: VARCHAR(255)
                  constraints:
                    nullable: false
                    unique: true
                    uniqueConstraintName: uk_subscribers_email
              - column:
                  name: signup_date
                  type: TIMESTAMP WITH TIME ZONE
                  constraints:
                    nullable: false
                  defaultValueComputed: CURRENT_TIMESTAMP
              - column:
                  name: terms_accepted
                  type: BOOLEAN
                  constraints:
                    nullable: false
                  defaultValueBoolean: false
              - column:
                  name: terms_accepted_date
                  type: TIMESTAMP WITH TIME ZONE
              - column:
                  name: created_at
                  type: TIMESTAMP WITH TIME ZONE
                  constraints:
                    nullable: false
                  defaultValueComputed: CURRENT_TIMESTAMP
              - column:
                  name: updated_at
                  type: TIMESTAMP WITH TIME ZONE
                  constraints:
                    nullable: false
                  defaultValueComputed: CURRENT_TIMESTAMP
      rollback:
        - dropTable:
            tableName: subscribers

  - changeSet:
      id: 1761609680050-2
      author: anthony.pahl@harness.io
      comment: Create index on email for fast lookups
      labels: "dev"
      changes:
        - createIndex:
            indexName: idx_subscribers_email
            tableName: subscribers
            columns:
              - column:
                  name: email
      rollback:
        - dropIndex:
            indexName: idx_subscribers_email
            tableName: subscribers

  - changeSet:
      id: 1761609680050-3
      author: anthony.pahl@harness.io
      comment: Create index on signup_date for date-based queries
      labels: "dev"
      changes:
        - createIndex:
            indexName: idx_subscribers_signup_date
            tableName: subscribers
            columns:
              - column:
                  name: signup_date
      rollback:
        - dropIndex:
            indexName: idx_subscribers_signup_date
            tableName: subscribers
