list(APPEND SQL_PUBLIC_INCLUDES
   QSQLiteResult
   QSQLiteDriver
)

list(APPEND SQL_INCLUDES
   ${CS_SOURCE_DIR}/src/plugins/sqldrivers/sqlite/qsql_sqlite.h
   ${CS_SOURCE_DIR}/src/plugins/sqldrivers/sqlite/qsqliteresult.h
   ${CS_SOURCE_DIR}/src/plugins/sqldrivers/sqlite/qsqlitedriver.h
)

list(APPEND SQL_PRIVATE_INCLUDES
   ${CS_SOURCE_DIR}/src/3rdparty/sqlite/sqlite3.h
)

target_sources(CsSql
   PRIVATE
   ${CS_SOURCE_DIR}/src/3rdparty/sqlite/sqlite3.c
   ${CS_SOURCE_DIR}/src/plugins/sqldrivers/sqlite/qsql_sqlite.cpp
)

include_directories(${CS_SOURCE_DIR}/src/3rdparty/sqlite)

