databaseChangeLog:
  - changeSet:
      id: create-users-table
      author: anthony.pahl@harness.io
      comment: Creates a basic users table for storing user information
      labels: "users,initial-setup"
      changes:
        - createTable:
            tableName: users
            columns:
              - column:
                  name: id
                  type: SERIAL
                  constraints:
                    primaryKey: true
                    nullable: false
              - column:
                  name: username
                  type: VARCHAR(50)
                  constraints:
                    nullable: false
                    unique: true
              - column:
                  name: email
                  type: VARCHAR(255)
                  constraints:
                    nullable: false
                    unique: true
              - column:
                  name: first_name
                  type: VARCHAR(100)
              - column:
                  name: last_name
                  type: VARCHAR(100)
              - column:
                  name: created_at
                  type: TIMESTAMP
                  defaultValueComputed: NOW()
              - column:
                  name: updated_at
                  type: TIMESTAMP
                  defaultValueComputed: NOW()
      rollback:
        - dropTable:
            tableName: users
