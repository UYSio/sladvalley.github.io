.PHONY: css publish

css:
	for CSS in ie8 ie9 main; do \
		rm assets/css/$$CSS.css ; \
		touch assets/css/$$CSS.css ; \
		docker run --rm -v $(shell pwd)/assets/sass:/data codycraven/sassc $$CSS.scss > assets/css/$$CSS.css ; \
	done

publish:
	s3 cp . s3://sladvalley.co.uk/ --recursive --exclude ".git/*"
