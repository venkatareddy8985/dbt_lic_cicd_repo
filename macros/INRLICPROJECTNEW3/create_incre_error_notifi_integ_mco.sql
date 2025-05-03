{% macro create_incre_error_notifi_integ_mco(notification_integrat_name) %}
    {% set create_err_noti_intr %}
    create or replace notification integration {{notification_integrat_name}}
    type=queue
    enabled=true
    direction=outbound
    notification_provider=aws_sns
    aws_sns_topic_arn='arn:aws:sns:eu-north-1:743938722121:dbt_incre_lic_sns_gmail_notification'
    aws_sns_role_arn='arn:aws:iam::743938722121:role/DBT_INCREMENTAL_LIC_STORA_INTEGRATION';
    {% endset %}
    {% do run_query(create_err_noti_intr) %}

{% endmacro %}

---dbt run-operation create_incre_error_notifi_integ_mco --args "{'notification_integrat_name':'DBT_INCRE_LICRAW_ERROR_NOTI_INTEG'}"
