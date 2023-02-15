CREATE OR REPLACE TABLE keepcoding.ivr_detail AS
SELECT CAST(ivr_calls.ivr_id AS INT64) AS ivr_id
    , ivr_calls.phone_number
    , ivr_calls.ivr_result
    , ivr_calls.vdn_label
    , ivr_calls.start_date
    , FORMAT_DATE('%Y%m%d', ivr_calls.start_date) AS start_date_id
    , ivr_calls.end_date
    , FORMAT_DATE('%Y%m%d', ivr_calls.end_date) AS end_date_id
    , ivr_calls.total_duration
    , ivr_calls.customer_segment
    , ivr_calls.ivr_language
    , ivr_calls.steps_module
    , ivr_calls.module_aggregation
    , ivr_modules.module_sequece
    , ivr_modules.module_name
    , ivr_modules.module_duration
    , ivr_modules.module_result
    , ivr_steps.step_sequence
    , ivr_steps.step_name
    , ivr_steps.step_result
    , ivr_steps.step_description_error
    , ivr_steps.document_type
    , ivr_steps.document_identification
    , ivr_steps.customer_phone
    , ivr_steps.billing_account_id
  FROM keepcoding.ivr_calls
  LEFT
  JOIN keepcoding.ivr_modules
  ON ivr_calls.ivr_id = ivr_modules.ivr_id
  LEFT
  JOIN keepcoding.ivr_steps
  ON ivr_modules.ivr_id = ivr_steps.ivr_id
  AND ivr_modules.module_sequece = ivr_steps.module_sequece;
