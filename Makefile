.DEFAULT_GOAL := help
.PHONY: okta-setup okta-test okta-doctor okta-serve okta-login okta-logout
okta-setup:
	@$(MAKE) --no-print-directory -C okta-iam-suite setup
okta-test:
	@$(MAKE) --no-print-directory -C okta-iam-suite test
okta-doctor:
	@$(MAKE) --no-print-directory -C okta-iam-suite doctor
okta-serve:
	@$(MAKE) --no-print-directory -C okta-iam-suite serve
okta-login:
	@$(MAKE) --no-print-directory -C okta-iam-suite login NO_BROWSER='$(NO_BROWSER)'
okta-logout:
	@$(MAKE) --no-print-directory -C okta-iam-suite logout
.PHONY: tenants-init test-tenants tenant-rotate send-message container-security
.PHONY: help up init policies rotate test-app test down clean cli logs exercise-init act exercise-expose exercise-contain exercise-reset exercise-recover exercise-report test-exercise
help up init policies rotate test-app test down clean cli logs exercise-init act exercise-expose exercise-contain exercise-reset exercise-recover exercise-report test-exercise tenants-init test-tenants tenant-rotate send-message container-security:
	@$(MAKE) --no-print-directory -C conjur-sandbox-lab $@ ARGS='$(ARGS)' CONFIRM='$(CONFIRM)' ACTOR='$(ACTOR)' ACTION='$(ACTION)' EXPECT='$(EXPECT)' TENANT='$(TENANT)' ENVIRONMENT='$(ENVIRONMENT)' TARGET_TENANT='$(TARGET_TENANT)' TARGET_ENVIRONMENT='$(TARGET_ENVIRONMENT)'
	@if [ '$@' = help ]; then printf '%s\n' 'okta-setup/test/doctor/serve/login/logout: independent Okta human-IAM suite; see okta-iam-suite/README.md'; fi
