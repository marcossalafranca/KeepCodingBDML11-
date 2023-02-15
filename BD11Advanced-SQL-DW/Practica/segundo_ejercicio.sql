CREATE OR REPLACE TABLE keepcoding.ivr_summary AS
WITH vdn_aggregation
  AS (SELECT ivr_id
        , CASE WHEN STARTS_WITH(vdn_label, 'ATC')  THEN 'FRONT'
                WHEN STARTS_WITH(vdn_label, 'TECH')  THEN 'TECH'
                WHEN STARTS_WITH(vdn_label, 'ABSORPTION')  THEN 'ABSORPTION'
                ELSE 'RESTO'
            END AS vdn_aggregation
      FROM keepcoding.ivr_detail
      QUALIFY ROW_NUMBER() OVER(PARTITION BY ivr_id ORDER BY ivr_id DESC) = 1)

  , document
  AS (SELECT ivr_detail.ivr_id
        ,IF(COUNT(DISTINCT document_type) = 1 AND MAX(document_type) = 'NULL', 'NULL', MAX(NULLIF(document_type, 'NULL'))) AS  document_type
        ,IF(COUNT(DISTINCT document_identification) = 1 AND MAX(document_identification) = 'NULL', 'NULL', MAX(NULLIF(document_identification, 'NULL'))) AS  document_identification 
        ,IF(COUNT(DISTINCT customer_phone) = 1 AND MAX(customer_phone) = 'NULL', 'NULL', MAX(NULLIF(customer_phone, 'NULL'))) AS  customer_phone
        ,IF(COUNT(DISTINCT billing_account_id) = 1 AND MAX(billing_account_id) = 'NULL', 'NULL', MAX(NULLIF(billing_account_id, 'NULL'))) AS  billing_account_id
        FROM keepcoding.ivr_detail
        GROUP BY ivr_id
        QUALIFY ROW_NUMBER() OVER(PARTITION BY ivr_id ORDER BY ivr_id DESC) = 1)

    /*Tambien se podria usar MAX(IF())
    IF(COUNT(DISTINCT document_type) = 1 AND MAX(document_type) = 'NULL', 'NULL', MAX(IF(document_type <> 'NULL', document_type, NULL))) AS document_type
    IF(COUNT(DISTINCT document_identification) = 1 AND MAX(document_identification) = 'NULL', 'NULL', MAX(IF(document_identification <> 'NULL', document_identification, NULL))) AS document_identification
    IF(COUNT(DISTINCT customer_phone) = 1 AND MAX(customer_phone) = 'NULL', 'NULL', MAX(IF(customer_phone <> 'NULL', customer_phone, NULL))) AS customer_phone
    IF(COUNT(DISTINCT billing_account_id) = 1 AND MAX(billing_account_id) = 'NULL', 'NULL', MAX(IF(billing_account_id <> 'NULL', billing_account_id, NULL))) AS billing_account_id
   */
  ,masiva_leg
  AS( SELECT ivr_detail.ivr_id
          , MAX(IF(module_name = 'AVERIA_MASIVA', 1, 0)) AS masiva_leg
      FROM keepcoding.ivr_detail
      GROUP BY ivr_id
      QUALIFY ROW_NUMBER() OVER(PARTITION BY ivr_id ORDER BY ivr_id DESC) = 1)

  ,info_by_lg
  AS( SELECT ivr_detail.ivr_id
          , MAX(IF(step_name = 'CUSTOMERINFOBYPHONE.TX'AND step_description_error = 'NULL' , 1, 0)) AS info_by_phone_lg
          , MAX(IF(step_name = 'CUSTOMERINFOBYDNI.TX'AND step_description_error = 'NULL' , 1, 0)) AS info_by_dni_lg
      FROM keepcoding.ivr_detail
      GROUP BY ivr_id
      QUALIFY ROW_NUMBER() OVER(PARTITION BY ivr_id ORDER BY ivr_id DESC) = 1)

  , calls
  AS(SELECT ivr_id
          , phone_number
          , start_date
          , LAG(start_date) OVER (PARTITION BY phone_number ORDER BY start_date) AS prev_call_time
          , LEAD(start_date) OVER (PARTITION BY phone_number ORDER BY start_date) AS next_call_time
      FROM keepcoding.ivr_detail
      GROUP BY ivr_id, phone_number,start_date
      QUALIFY ROW_NUMBER() OVER(PARTITION BY ivr_id ORDER BY ivr_id DESC) = 1)

Select  DISTINCT ivr_detail.ivr_id
    , ivr_detail.phone_number
    , ivr_detail.ivr_result
    , vdn_aggregation.vdn_aggregation
    , ivr_detail.start_date
    , ivr_detail.end_date
    , ivr_detail.total_duration
    , ivr_detail.customer_segment
    , ivr_detail.ivr_language
    , ivr_detail.steps_module
    , ivr_detail.module_aggregation
    , document.document_type
    , document.document_identification
    , document.customer_phone
    , document.billing_account_id
    , masiva_leg.masiva_leg
    , info_by_lg.info_by_phone_lg
    , info_by_lg.info_by_dni_lg
    , IF(calls.start_date - prev_call_time <= INTERVAL 24 HOUR , 1,0) AS repeated_phone_24H
    , IF(next_call_time - calls.start_date <= INTERVAL 24 HOUR , 1,0) AS cause_recall_phone_24H
  FROM keepcoding.ivr_detail
  LEFT
  JOIN calls
  ON  ivr_detail.ivr_id = calls.ivr_id
  LEFT
  JOIN vdn_aggregation
  ON  ivr_detail.ivr_id = vdn_aggregation.ivr_id
  LEFT
  JOIN document
  ON  ivr_detail.ivr_id = document.ivr_id
  LEFT
  JOIN masiva_leg
  ON  ivr_detail.ivr_id = masiva_leg.ivr_id
  LEFT
  JOIN info_by_lg
  ON  ivr_detail.ivr_id = info_by_lg.ivr_id
  ORDER BY ivr_detail.phone_number, ivr_detail.start_date;