{{
    config(
        materialized='table'
    )
}}

select
TYPE::VARCHAR,
CODE::VARCHAR(20),
FULLNAME:: VARCHAR,
CURRENT_DATE() AS CREATED_DATE,
'ETL' AS CREATED_BY,
from {{ source('HOCKEYDB', 'ABBREV') }}
where type in ('Division','Playoffs')