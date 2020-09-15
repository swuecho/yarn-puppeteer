
local_registry=192.168.0.100:5555
aliyun_registry_bestqa=registry.cn-shanghai.aliyuncs.com/bestqa
github_pkg_registry_surveyresearch=docker.pkg.github.com/swuecho/surveyresearch
image=yarn-puppeteer
version=latest

build:
	docker build -t $(image):$(version)  .

push_to_local:
	docker tag $(image):$(version) $(local_registry)/$(image):$(version)
	docker push $(local_registry)/$(image):$(version)

push_to_aliyun:
	docker tag  $(local_registry)/$(image):$(version) $(aliyun_registry_bestqa)/$(image):$(version)
	docker push $(aliyun_registry_bestqa)/$(image):$(version)

push_to_github:
	docker tag  $(local_registry)/$(image):$(version) $(github_pkg_registry_surveyresearch)/$(image):$(version)
	docker push $(github_pkg_registry_surveyresearch)/$(image):$(version)
