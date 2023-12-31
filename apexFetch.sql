-- Redirecting Link from Workato Recipe to Oracle APEX for better user experience
-- Process located in Pre-Rendering, before header


DECLARE
    l_clob 	CLOB;
BEGIN

    l_clob := apex_web_service.make_rest_request(
        p_url => 'https://webhooks.workato.com/webhooks/rest/7467173e-a24e-496c-8024-5037f6c768e7/fsg-quoting?Opportunity='||:P2_OPPORTUNITY||'&Accepted=Yes'||:P2_CUSTOMER_NAME,
        p_http_method => 'GET');
        --p_parm_name => apex_string.string_to_table('Opportunity:Accepted'),
        -- p_parm_value => apex_string.string_to_table(:P2_OPPORTUNITY||':Yes'));
  
 --   :P2_MESSAGE := 'Your order has been accepted! Thank you!';
apex_debug.warn(l_clob, 4711, sqlerrm);
END;