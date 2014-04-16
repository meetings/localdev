INSERT INTO theme VALUES (1, '', '', 0, '');

INSERT INTO dicole_domain_user VALUES (1,1,1);

INSERT INTO dicole_domain VALUES (1, 'local.meetin.gs', null, 1, 'en', 'Europe/Helsinki', '', 'meetings_navigation', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0);

INSERT INTO dicole_url_alias VALUES (1, 1, 0, 0, 0, 'meetings', 'meet', 'meet');

INSERT INTO dicole_tool_settings VALUES (null, 0, 0, 'domain_user_manager_1', 'alternative_login', '/meetings/login');
INSERT INTO dicole_tool_settings VALUES (null, 0, 0, 'domain_user_manager_1', 'front_page', '/meetings_global/detect/');
INSERT INTO dicole_tool_settings VALUES (null, 0, 0, 'domain_user_manager_1', 'custom_favicon', '/images/meetings/favicon.png');
INSERT INTO dicole_tool_settings VALUES (null, 0, 0, 'domain_user_manager_1', 'not_found_template', 'dicole_meetings::main_meetings_404');
INSERT INTO dicole_tool_settings VALUES (null, 0, 0, 'domain_user_manager_1', 'not_found_action', 'meetings_404');
INSERT INTO dicole_tool_settings VALUES (null, 0, 0, 'domain_user_manager_1', 'domain_notify_email', '"Test Meetin.gs" <testinfo@test.meetin.gs>');

INSERT INTO dicole_theme VALUES (null, 'dicole_only_theme', '0.01', '', '', '', '', 0, 0, '', '/css/dicole_reset/style.css', null, null, null, null, null, null, null, null, null, '', 1, 1);

INSERT INTO sys_user VALUES (1, '', 'IKXQR/b03UN1w', 'demo@meetin.gs', NULL, NULL, NULL, NULL, 1, 'Demo', NULL, 'User', 'Demo User', NULL, 'en', 'ctIyRBdwnYmZnMw6', '{"1":{"creation_time":1}}', NULL, 'Europe/Helsinki', NULL, NULL, NULL, 0, NULL, NULL, NULL);
