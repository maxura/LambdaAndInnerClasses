#!/bin/bash
set -e
CHE_PATH=/home/mmusienko/codenvy-projects/che
SELENIUM_PATH=/home/mmusienko/codenvy-projects/che/selenium
CHE_SELENIUM_TESTS_PATH=/home/mmusienko/codenvy-projects/che/selenium/che-selenium-test


cd $CHE_PATH
cbuild -l che --t --skip-sources-validation --skip-git-operations
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v /home/mmusienko/codenvy-projects/che-snapshot-data:/data -v /home/mmusienko/codenvy-projects/che:/repo eclipse/che-cli:nightly restart
cd $SELENIUM_PATH
mvn clean install
cd $CHE_SELENIUM_TESTS_PATH && ./selenium-tests.sh --test=DialogAboutTest
