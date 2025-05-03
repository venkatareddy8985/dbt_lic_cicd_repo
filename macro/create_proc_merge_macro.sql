
{% macro create_proc_merge_macro(stg_table,tgt_table,merge_key) %}


{{ run_query(
f"""    
CREATE OR REPLACE PROCEDURE sp_merge_{tgt_table}()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    MERGE INTO {tgt_table} AS tgt
    USING (
        SELECT * FROM {stg_table} 
       -- WHERE claim_date > (SELECT MAX(claim_date) FROM {tgt_table})
    ) AS stg
    ON tgt.{merge_key} = stg.{merge_key}
    WHEN MATCHED THEN 
        UPDATE SET tgt.policy_id = stg.policy_id,
                   tgt.claim_date = stg.claim_date,
                   tgt.claim_amount = stg.claim_amount,
                   tgt.reason = stg.reason,
                   tgt.status = stg.status
    WHEN NOT MATCHED THEN 
        INSERT (claim_id, policy_id, claim_date, claim_amount, reason, status) 
        VALUES (stg.claim_id,stg.policy_id,stg.claim_date,stg.claim_amount,stg.reason,stg.status);
    
    RETURN 'claims incremental merge completed';
END;
$$;
"""
) }}

{% endmacro %}
