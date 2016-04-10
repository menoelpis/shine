================================
Rails New
================================

$ rails new --skip-turbolinks \
            --skip-spring     \
            --skip-test-unit  \
            -d postgresql     \
            shine

================================
PostgreSQL Setup
================================

$ psql postgres
postgres> CREATE USER shine PASSWORD 'shine'
postgres> ALTER USER shine CREATEDB;