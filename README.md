# jenkins-ci-template
Template to have a Jenkins server with some examples using pipeline.


## Use


```bash
git clone https://github.com/mariocabral/jenkins-ci-template.git
cd jenkins-ci-template
make docker-lint
make docker-build
make docker-start
```

After that visit http://localhost:8080/ 


## Jenkins Theme

### Option A: using themeManager plugin

You can change the the used for this template editing the file: `jenkins/jenkins-config.yaml` in the section:

```yaml
unclassified:
  themeManager:
    disableUserThemes: false
    theme: "dark"
```

The list of available theme are: `dark`, `darkSystem`, `noOp`, `material-indigo`, `material-red`, `solarizedSystem`, `solarizedDark` and `solarizedLight`.

### Option B: using simple-theme-plugin

Also you can use a custom theme, for this I used the generator [jenkins-material-theme](http://afonsof.com/jenkins-material-theme/)

```yaml
unclassified:
  simple-theme-plugin:
    elements:
    - cssUrl:
        url: "http://localhost:8080/userContent/jenkins-material-theme.css"
    - faviconUrl:
        url: "http://localhost:8080/userContent/favicon.ico"
```
**Note:** If the jenkins domain change, should be update the url used in the theme configuration.


## DLS docs

Reference [page](https://jenkinsci.github.io/job-dsl-plugin/#path/pipelineJob) of DSL plugin.

## Credits

- [jenkinsci/docker](https://github.com/jenkinsci/docker)
- [docker-jenkins-dsl-ready](https://github.com/thomasleveil/docker-jenkins-dsl-ready)
- [jenkins-job-dsl](https://github.com/binario200/jenkins-job-dsl)
- [project-examples](https://github.com/jfrog/project-examples)
